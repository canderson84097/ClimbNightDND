//
//  DNDClass.h
//  DND Reference
//
//  Created by Landon Epps on 12/4/19.
//  Copyright © 2019 Convenient Code, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DNDClass : NSObject

@property (nonatomic, strong, readonly) NSNumber *hitDice;
@property (nonatomic, copy, readonly) NSArray<NSString *> *proficiencies;
@property (nonatomic, copy, readonly) NSArray<NSString *> *savingThrows;

- (instancetype)initWithHitDice:(NSNumber *)hitDice
                  proficiencies:(NSArray<NSString *> *)proficiencies
                   savingThrows:(NSArray<NSString *> *)savingThrows;

@end

#pragma mark - JSONConvertible

@interface DNDClass (JSONConvertible)

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
