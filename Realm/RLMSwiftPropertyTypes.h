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

#define REALM_FOR_EACH_SWIFT_PRIMITIVE_TYPE(macro) /*
*/    macro(bool, Bool, bool) /*
*/    macro(double, Double, double) /*
*/    macro(float, Float, float) /*
*/    macro(int64_t, Int64, int)

#define REALM_FOR_EACH_SWIFT_INT_SIZE(macro) /*
*/    macro(int8_t, Int8, int) /*
*/    macro(int16_t, Int16, int) /*
*/    macro(int32_t, Int32, int) /*
*/    macro(NSInteger, Int, int)

#define REALM_FOR_EACH_SWIFT_OBJECT_TYPE(macro) /*
*/    macro(NSString, String, string) /*
*/    macro(NSDate, Date, date) /*
*/    macro(NSData, Data, data)

