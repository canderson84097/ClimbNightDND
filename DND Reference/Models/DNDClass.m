//
//  DNDClass.m
//  DND Reference
//
//  Created by Landon Epps on 12/4/19.
//  Copyright © 2019 Convenient Code, LLC. All rights reserved.
//

#import "DNDClass.h"

static NSString * const hitDiceKey = @"hit_die";
static NSString * const proficienciesKey = @"proficiencies";
static NSString * const savingThrowsKey = @"saving_throws";
static NSString * const nameKey = @"name";

@implementation DNDClass

- (instancetype)initWithHitDice:(NSNumber *)hitDice
                  proficiencies:(NSArray<NSString *> *)proficiencies
                   savingThrows:(NSArray<NSString *> *)savingThrows {
    
    if (self == [super init]) {
        _hitDice = hitDice;
        _proficiencies = proficiencies;
        _savingThrows = savingThrows;
    }
    
    return self;
}

@end

#pragma mark - JSONConvertible

@implementation DNDClass (JSONConvertible)

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    
    NSNumber *hitDice = dictionary[hitDiceKey];
    NSArray *proficienciesDictArray = dictionary[proficienciesKey];
    NSArray *savingThrowsDictArray = dictionary[savingThrowsKey];
    
    NSMutableArray *proficiencies = [NSMutableArray new];
    
    for (NSDictionary *dict in proficienciesDictArray) {
        [proficiencies addObject:dict[nameKey]];
    }
    
    NSMutableArray *savingThrows = [NSMutableArray new];
    
    for (NSDictionary *dict in savingThrowsDictArray) {
        [savingThrows addObject:dict[nameKey]];
    }
    
    return [self initWithHitDice:hitDice proficiencies:proficiencies savingThrows:savingThrows];
    
}

@end
