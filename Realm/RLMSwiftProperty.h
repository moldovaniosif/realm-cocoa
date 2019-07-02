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

#import <Realm/RLMSwiftPropertyTypes.h>

#import <Foundation/Foundation.h>
#import <stdint.h>

@class RLMObjectBase;

#define REALM_SWIFT_PROPERTY_ACCESSOR(objc, swift, rlmtype) \
    FOUNDATION_EXTERN objc RLMGetSwiftProperty##swift(RLMObjectBase *, uint16_t); \
    FOUNDATION_EXTERN objc RLMGetSwiftProperty##swift##Optional(RLMObjectBase *, uint16_t, bool *); \
    FOUNDATION_EXTERN void RLMSetSwiftProperty##swift(RLMObjectBase *, uint16_t, objc);
REALM_FOR_EACH_SWIFT_PRIMITIVE_TYPE(REALM_SWIFT_PROPERTY_ACCESSOR)
#undef REALM_SWIFT_PROPERTY_ACCESSOR

#define REALM_SWIFT_PROPERTY_ACCESSOR(objc, swift, rlmtype) \
    FOUNDATION_EXTERN objc *RLMGetSwiftProperty##swift(RLMObjectBase *, uint16_t); \
    FOUNDATION_EXTERN void RLMSetSwiftProperty##swift(RLMObjectBase *, uint16_t, objc *);
REALM_FOR_EACH_SWIFT_OBJECT_TYPE(REALM_SWIFT_PROPERTY_ACCESSOR)
#undef REALM_SWIFT_PROPERTY_ACCESSOR

FOUNDATION_EXTERN RLMObjectBase *RLMGetSwiftPropertyObject(RLMObjectBase *, uint16_t);
FOUNDATION_EXTERN void RLMSetSwiftPropertyNil(RLMObjectBase *, uint16_t);
FOUNDATION_EXTERN void RLMSetSwiftPropertyObject(RLMObjectBase *, uint16_t, RLMObjectBase *);
