////////////////////////////////////////////////////////////////////////////
//
// Copyright 2019 Realm Inc.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//
////////////////////////////////////////////////////////////////////////////

import Realm
import Realm.Private

public protocol RealmValue {
    static func _rlmGetProperty(_ obj: Object, _ key: UInt16) -> Self
    static func _rlmGetPropertyOptional(_ obj: Object, _ key: UInt16) -> Self?
    static func _rlmSetProperty(_ obj: Object, _ key: UInt16, _ value: Self)
    static var _type: PropertyType { get }
    static var _optional: Bool { get }
    static var _className: String? { get }
}
extension RealmValue {
    public static var _className: String? { nil }
}

public protocol PrimaryKeyType: RealmValue {
}

extension Int: PrimaryKeyType { }
extension String: PrimaryKeyType { }

extension Optional: RealmValue where Wrapped: RealmValue {
    public static func _rlmGetProperty(_ obj: Object, _ key: UInt16) -> Wrapped? {
        return Wrapped._rlmGetPropertyOptional(obj, key)
    }
    public static func _rlmGetPropertyOptional(_ obj: Object, _ key: UInt16) -> Wrapped?? {
        fatalError()
    }
    public static func _rlmSetProperty(_ obj: Object, _ key: UInt16, _ value: Wrapped?) {
        if let value = value {
            Wrapped._rlmSetProperty(obj, key, value)
        } else {
            RLMSetSwiftPropertyNil(obj, key)
        }
    }
    public static var _type: PropertyType { Wrapped._type }
    public static var _className: String? { Wrapped._className }
    public static var _optional: Bool { true }
}

extension Object: RealmValue {
    public static func _rlmGetProperty(_ obj: Object, _ key: UInt16) -> Self {
        fatalError()
    }
    public static func _rlmGetPropertyOptional(_ obj: Object, _ key: UInt16) -> Self? {
//        return RLMGetSwiftPropertyObject(obj, key).map(dynamicBridgeCast)
//        FIXME: gives Assertion failed: (LocalSelf && "no local self metadata"), function getLocalSelfMetadata, file /src/swift-source/swift/lib/IRGen/GenHeap.cpp, line 1686.
        if let value = RLMGetSwiftPropertyObject(obj, key) {
            return value as! Self
        } else {
            return nil
        }
    }
    public static func _rlmSetProperty(_ obj: Object, _ key: UInt16, _ value: Object) {
        RLMSetSwiftPropertyObject(obj, key, value)
    }
    public static var _type: PropertyType { .object }
    public static var _optional: Bool { true }
    public static var _className: String? { self.className() }
}

extension List: RealmValue where Element: RealmValue {
    public static func _rlmGetProperty(_ obj: Object, _ key: UInt16) -> Self {
        fatalError()
    }
    public static func _rlmGetPropertyOptional(_ obj: Object, _ key: UInt16) -> Self? {
        fatalError()
    }
    public static func _rlmSetProperty(_ obj: Object, _ key: UInt16, _ value: List) {
        fatalError()
    }
    public static var _type: PropertyType { Element._type }
    public static var _optional: Bool { Element._optional }
    public static var _className: String? { Element._className }
}

public protocol _ManagedPropertyProtocol {
    var _type: PropertyType { get }
    var _className: String? { get }
    var _optional: Bool { get }
    var _accessor: RLMManagedPropertyAccessor.Type { get }
}

@propertyWrapper
public struct ManagedProperty<Value: RealmValue>: _ManagedPropertyProtocol {
    var key: UInt16 = .max
    fileprivate var unmanagedValue: Value?
    public var _type: PropertyType { Value._type }
    public var _optional: Bool { Value._optional }
    public var _className: String? { Value._className }
    public var _accessor: RLMManagedPropertyAccessor.Type {
        return ManagedPropertyAccessor<Value>.self
    }

    @available(*, unavailable)
    public var wrappedValue: Value {
        get { fatalError("called wrappedValue getter") }
        set { fatalError("called wrappedValue setter") }
    }

    public init(wrappedValue value: Value, primaryKey: Bool = false) {
        print("init: \(value) primaryKey: \(primaryKey)")
        unmanagedValue = value
    }

    public static subscript<EnclosingSelf: Object, FinalValue>(
        _enclosingInstance observed: EnclosingSelf,
        wrapped wrappedKeyPath: ReferenceWritableKeyPath<EnclosingSelf, FinalValue>,
        storage storageKeyPath: ReferenceWritableKeyPath<EnclosingSelf, Self>
        ) -> Value {
        get {
            let prop = observed[keyPath: storageKeyPath]
            if prop.key == .max {
                return prop.unmanagedValue!
            }
            return Value._rlmGetProperty(observed, prop.key)
        }
        set {
            let key = observed[keyPath: storageKeyPath].key
            if key == .max {
                observed[keyPath: storageKeyPath].unmanagedValue = newValue
            } else {
                Value._rlmSetProperty(observed, key, newValue)
            }
        }
    }
}

@propertyWrapper
public struct PrimaryKey<Value: PrimaryKeyType>: _ManagedPropertyProtocol {
    var key: UInt16 = .max
    fileprivate var unmanagedValue: Value?
    public var _type: PropertyType { Value._type }
    public var _optional: Bool { Value._optional }
    public var _className: String? { nil }
    public var _accessor: RLMManagedPropertyAccessor.Type {
        return ManagedPropertyAccessor<Value>.self
    }

    @available(*, unavailable)
    public var wrappedValue: Value {
        get { fatalError("called wrappedValue getter") }
        set { fatalError("called wrappedValue setter") }
    }

    public init(wrappedValue value: Value) {
        print("init: \(value)")
        unmanagedValue = value
    }

    public static subscript<EnclosingSelf: Object, FinalValue>(
        _enclosingInstance observed: EnclosingSelf,
        wrapped wrappedKeyPath: ReferenceWritableKeyPath<EnclosingSelf, FinalValue>,
        storage storageKeyPath: ReferenceWritableKeyPath<EnclosingSelf, Self>
        ) -> Value {
        get {
            let prop = observed[keyPath: storageKeyPath]
            if prop.key == .max {
                return prop.unmanagedValue!
            }
            return Value._rlmGetProperty(observed, prop.key)
        }
        set {
            let key = observed[keyPath: storageKeyPath].key
            if key == .max {
                observed[keyPath: storageKeyPath].unmanagedValue = newValue
            } else {
                fatalError("Cannot modify the primay key of an existing manged object")
            }
        }
    }
}

class ManagedPropertyAccessor<T: RealmValue>: RLMManagedPropertyAccessor {
    @objc override class func getAtPointer(_ ptr: UnsafeMutableRawPointer) -> Any {
        return ptr.assumingMemoryBound(to: ManagedProperty<T>.self).pointee.unmanagedValue!
    }
    @objc override class func setAtPointer(_ ptr: UnsafeMutableRawPointer, value: Any) -> Void {
        ptr.assumingMemoryBound(to: ManagedProperty<T>.self).pointee.unmanagedValue = value as! T
    }
}

