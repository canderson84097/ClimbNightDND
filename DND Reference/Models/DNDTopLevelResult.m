//
//  DNDTopLevelResult.m
//  DND Reference
//
//  Created by Landon Epps on 12/4/19.
//  Copyright © 2019 Convenient Code, LLC. All rights reserved.
//

#import "DNDTopLevelResult.h"

static NSString * const nameKey = @"name";
static NSString * const urlKey = @"url";

@implementation DNDTopLevelResult

- (instancetype)initWithName:(NSString *)name url:(NSURL *)url {
    
    if (self == [super init]) {
        _name = name;
        _url = url;
    }
    
    return self;
}

@end

#pragma mark - JSONConvertible

@implementation DNDTopLevelResult (JSONConvertible)

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    NSString *name = dictionary[nameKey];
    NSURL *url = [NSURL URLWithString:dictionary[urlKey]];
    
    return [self initWithName:name url:url];
}

@end
