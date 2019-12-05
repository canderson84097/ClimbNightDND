//
//  DNDSpell.m
//  DND Reference
//
//  Created by Landon Epps on 12/4/19.
//  Copyright © 2019 Convenient Code, LLC. All rights reserved.
//

#import "DNDSpell.h"

static NSString * const levelKey = @"level";
static NSString * const componentsKey = @"components";
static NSString * const concentrationKey = @"concentration";
static NSString * const rangeKey = @"range";
static NSString * const castingTimeKey = @"casting_time";
static NSString * const spellDescriptionKey = @"desc";

@implementation DNDSpell

- (instancetype)initWithLevel:(NSNumber *)level
                   components:(NSArray<NSString *> *)components
                concentration:(NSString *)concentration
                        range:(NSString *)range
                  castingTime:(NSString *)castingTime
             spellDescription:(NSArray<NSString *> *)spellDescription {
    
    if (self == [super init]) {
        _level = level;
        _components = components;
        _concentration = concentration;
        _range = range;
        _castingTime = castingTime;
        _spellDescription = spellDescription;
    }
    
    return self;
}

@end

#pragma mark - JSONConvertible

@implementation DNDSpell (JSONConvertible)

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    
    NSNumber *level = dictionary[levelKey];
    NSArray<NSString *> *components = dictionary[componentsKey];
    NSString *concentration = dictionary[concentrationKey];
    NSString *range = dictionary[rangeKey];
    NSString *castingTime = dictionary[castingTimeKey];
    NSArray<NSString *> *spellDescription = dictionary[spellDescriptionKey];
    
    return [self initWithLevel:level components:components concentration:concentration range:range castingTime:castingTime spellDescription:spellDescription];
}

@end
