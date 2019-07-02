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

// These macros are formatted oddly to preserve the newlines in the
// preprocessed output, for the sake of the Swift file produced.

import Realm
import Realm.Private

// clang -x c -E -CC -P -I Realm RealmSwift/ManagedPropertyTypes.swift.in >! RealmSwift/ManagedPropertyTypes.swift
/*
*/ /*
   */ extension Bool { /*
       */ @inlinable /*
       */ public static func _rlmSetProperty(_ obj: Object, _ key: UInt16, _ value: Bool) { /*
           */ RLMSetSwiftPropertyBool(obj, key, value) /*
       */ } /*
       */ @inlinable public static var _type: PropertyType { .bool } /*
       */ @inlinable public static var _optional: Bool { false } /*
   */ } /*
*/ /*
   */ extension Double { /*
       */ @inlinable /*
       */ public static func _rlmSetProperty(_ obj: Object, _ key: UInt16, _ value: Double) { /*
           */ RLMSetSwiftPropertyDouble(obj, key, value) /*
       */ } /*
       */ @inlinable public static var _type: PropertyType { .double } /*
       */ @inlinable public static var _optional: Bool { false } /*
   */ } /*
*/ /*
   */ extension Float { /*
       */ @inlinable /*
       */ public static func _rlmSetProperty(_ obj: Object, _ key: UInt16, _ value: Float) { /*
           */ RLMSetSwiftPropertyFloat(obj, key, value) /*
       */ } /*
       */ @inlinable public static var _type: PropertyType { .float } /*
       */ @inlinable public static var _optional: Bool { false } /*
   */ } /*
*/ /*
   */ extension Int64 { /*
       */ @inlinable /*
       */ public static func _rlmSetProperty(_ obj: Object, _ key: UInt16, _ value: Int64) { /*
           */ RLMSetSwiftPropertyInt64(obj, key, value) /*
       */ } /*
       */ @inlinable public static var _type: PropertyType { .int } /*
       */ @inlinable public static var _optional: Bool { false } /*
   */ }
/*
*/ /*
   */ extension String { /*
       */ @inlinable /*
       */ public static func _rlmSetProperty(_ obj: Object, _ key: UInt16, _ value: String) { /*
           */ RLMSetSwiftPropertyString(obj, key, value) /*
       */ } /*
       */ @inlinable public static var _type: PropertyType { .string } /*
       */ @inlinable public static var _optional: Bool { false } /*
   */ } /*
*/ /*
   */ extension Date { /*
       */ @inlinable /*
       */ public static func _rlmSetProperty(_ obj: Object, _ key: UInt16, _ value: Date) { /*
           */ RLMSetSwiftPropertyDate(obj, key, value) /*
       */ } /*
       */ @inlinable public static var _type: PropertyType { .date } /*
       */ @inlinable public static var _optional: Bool { false } /*
   */ } /*
*/ /*
   */ extension Data { /*
       */ @inlinable /*
       */ public static func _rlmSetProperty(_ obj: Object, _ key: UInt16, _ value: Data) { /*
           */ RLMSetSwiftPropertyData(obj, key, value) /*
       */ } /*
       */ @inlinable public static var _type: PropertyType { .data } /*
       */ @inlinable public static var _optional: Bool { false } /*
   */ }
/*
*/ /*
 */ extension Bool: RealmValue { /*
     */ @inlinable /*
     */ public static func _rlmGetProperty(_ obj: Object, _ key: UInt16) -> Bool { /*
         */ return RLMGetSwiftPropertyBool(obj, key) /*
     */ } /*
     */ @inlinable /*
     */ public static func _rlmGetPropertyOptional(_ obj: Object, _ key: UInt16) -> Bool? { /*
         */ var gotValue = false /*
         */ let ret = RLMGetSwiftPropertyBoolOptional(obj, key, &gotValue) /*
         */ return gotValue ? ret : nil /*
     */ } /*
 */ } /*
*/ /*
 */ extension Double: RealmValue { /*
     */ @inlinable /*
     */ public static func _rlmGetProperty(_ obj: Object, _ key: UInt16) -> Double { /*
         */ return RLMGetSwiftPropertyDouble(obj, key) /*
     */ } /*
     */ @inlinable /*
     */ public static func _rlmGetPropertyOptional(_ obj: Object, _ key: UInt16) -> Double? { /*
         */ var gotValue = false /*
         */ let ret = RLMGetSwiftPropertyDoubleOptional(obj, key, &gotValue) /*
         */ return gotValue ? ret : nil /*
     */ } /*
 */ } /*
*/ /*
 */ extension Float: RealmValue { /*
     */ @inlinable /*
     */ public static func _rlmGetProperty(_ obj: Object, _ key: UInt16) -> Float { /*
         */ return RLMGetSwiftPropertyFloat(obj, key) /*
     */ } /*
     */ @inlinable /*
     */ public static func _rlmGetPropertyOptional(_ obj: Object, _ key: UInt16) -> Float? { /*
         */ var gotValue = false /*
         */ let ret = RLMGetSwiftPropertyFloatOptional(obj, key, &gotValue) /*
         */ return gotValue ? ret : nil /*
     */ } /*
 */ } /*
*/ /*
 */ extension Int64: RealmValue { /*
     */ @inlinable /*
     */ public static func _rlmGetProperty(_ obj: Object, _ key: UInt16) -> Int64 { /*
         */ return RLMGetSwiftPropertyInt64(obj, key) /*
     */ } /*
     */ @inlinable /*
     */ public static func _rlmGetPropertyOptional(_ obj: Object, _ key: UInt16) -> Int64? { /*
         */ var gotValue = false /*
         */ let ret = RLMGetSwiftPropertyInt64Optional(obj, key, &gotValue) /*
         */ return gotValue ? ret : nil /*
     */ } /*
 */ }
/*
*/ /*
 */ extension String: RealmValue { /*
     */ @inlinable /*
     */ public static func _rlmGetProperty(_ obj: Object, _ key: UInt16) -> String { /*
         */ return RLMGetSwiftPropertyString(obj, key)! /*
     */ } /*
     */ @inlinable /*
     */ public static func _rlmGetPropertyOptional(_ obj: Object, _ key: UInt16) -> String? { /*
         */ return RLMGetSwiftPropertyString(obj, key) /*
     */ } /*
 */ } /*
*/ /*
 */ extension Date: RealmValue { /*
     */ @inlinable /*
     */ public static func _rlmGetProperty(_ obj: Object, _ key: UInt16) -> Date { /*
         */ return RLMGetSwiftPropertyDate(obj, key)! /*
     */ } /*
     */ @inlinable /*
     */ public static func _rlmGetPropertyOptional(_ obj: Object, _ key: UInt16) -> Date? { /*
         */ return RLMGetSwiftPropertyDate(obj, key) /*
     */ } /*
 */ } /*
*/ /*
 */ extension Data: RealmValue { /*
     */ @inlinable /*
     */ public static func _rlmGetProperty(_ obj: Object, _ key: UInt16) -> Data { /*
         */ return RLMGetSwiftPropertyData(obj, key)! /*
     */ } /*
     */ @inlinable /*
     */ public static func _rlmGetPropertyOptional(_ obj: Object, _ key: UInt16) -> Data? { /*
         */ return RLMGetSwiftPropertyData(obj, key) /*
     */ } /*
 */ }
/*
*/ /*
 */ extension Int8: RealmValue { /*
     */ @inlinable /*
     */ public static func _rlmSetProperty(_ obj: Object, _ key: UInt16, _ value: Int8) { /*
         */ RLMSetSwiftPropertyInt64(obj, key, Int64(value)) /*
     */ } /*
     */ @inlinable /*
     */ public static func _rlmGetProperty(_ obj: Object, _ key: UInt16) -> Int8 { /*
         */ return Int8(Int64._rlmGetProperty(obj, key)) /*
     */ } /*
     */ @inlinable /*
     */ public static func _rlmGetPropertyOptional(_ obj: Object, _ key: UInt16) -> Int8? { /*
         */ return Int64._rlmGetPropertyOptional(obj, key).map(Int8.init) /*
     */ } /*
     */ @inlinable public static var _type: PropertyType { .int } /*
     */ @inlinable public static var _optional: Bool { false } /*
 */ } /*
*/ /*
 */ extension Int16: RealmValue { /*
     */ @inlinable /*
     */ public static func _rlmSetProperty(_ obj: Object, _ key: UInt16, _ value: Int16) { /*
         */ RLMSetSwiftPropertyInt64(obj, key, Int64(value)) /*
     */ } /*
     */ @inlinable /*
     */ public static func _rlmGetProperty(_ obj: Object, _ key: UInt16) -> Int16 { /*
         */ return Int16(Int64._rlmGetProperty(obj, key)) /*
     */ } /*
     */ @inlinable /*
     */ public static func _rlmGetPropertyOptional(_ obj: Object, _ key: UInt16) -> Int16? { /*
         */ return Int64._rlmGetPropertyOptional(obj, key).map(Int16.init) /*
     */ } /*
     */ @inlinable public static var _type: PropertyType { .int } /*
     */ @inlinable public static var _optional: Bool { false } /*
 */ } /*
*/ /*
 */ extension Int32: RealmValue { /*
     */ @inlinable /*
     */ public static func _rlmSetProperty(_ obj: Object, _ key: UInt16, _ value: Int32) { /*
         */ RLMSetSwiftPropertyInt64(obj, key, Int64(value)) /*
     */ } /*
     */ @inlinable /*
     */ public static func _rlmGetProperty(_ obj: Object, _ key: UInt16) -> Int32 { /*
         */ return Int32(Int64._rlmGetProperty(obj, key)) /*
     */ } /*
     */ @inlinable /*
     */ public static func _rlmGetPropertyOptional(_ obj: Object, _ key: UInt16) -> Int32? { /*
         */ return Int64._rlmGetPropertyOptional(obj, key).map(Int32.init) /*
     */ } /*
     */ @inlinable public static var _type: PropertyType { .int } /*
     */ @inlinable public static var _optional: Bool { false } /*
 */ } /*
*/ /*
 */ extension Int: RealmValue { /*
     */ @inlinable /*
     */ public static func _rlmSetProperty(_ obj: Object, _ key: UInt16, _ value: Int) { /*
         */ RLMSetSwiftPropertyInt64(obj, key, Int64(value)) /*
     */ } /*
     */ @inlinable /*
     */ public static func _rlmGetProperty(_ obj: Object, _ key: UInt16) -> Int { /*
         */ return Int(Int64._rlmGetProperty(obj, key)) /*
     */ } /*
     */ @inlinable /*
     */ public static func _rlmGetPropertyOptional(_ obj: Object, _ key: UInt16) -> Int? { /*
         */ return Int64._rlmGetPropertyOptional(obj, key).map(Int.init) /*
     */ } /*
     */ @inlinable public static var _type: PropertyType { .int } /*
     */ @inlinable public static var _optional: Bool { false } /*
 */ }
