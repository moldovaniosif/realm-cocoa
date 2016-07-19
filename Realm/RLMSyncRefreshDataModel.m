////////////////////////////////////////////////////////////////////////////
//
// Copyright 2016 Realm Inc.
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

#import "RLMSyncRefreshDataModel.h"

#import "RLMSyncRenewalTokenModel.h"

@interface RLMSyncRefreshDataModel ()

@property (nonatomic, readwrite) RLMSyncToken accessToken;
@property (nonatomic, readwrite) NSTimeInterval accessTokenExpiry;
@property (nonatomic, readwrite) RLMSyncRenewalTokenModel *renewalTokenModel;

@end

@implementation RLMSyncRefreshDataModel

- (instancetype)initWithJSON:(NSDictionary *)json {
    if (self = [super init]) {
        RLMSYNC_PARSE_STRING_OR_ABORT(json, kRLMSyncTokenKey, accessToken);
        RLMSYNC_PARSE_DOUBLE_OR_ABORT(json, kRLMSyncExpiresKey, accessTokenExpiry);
        RLMSYNC_PARSE_MODEL_OR_ABORT(json, kRLMSyncRefreshKey, RLMSyncRenewalTokenModel, renewalTokenModel);
    }
    return self;
}

@end