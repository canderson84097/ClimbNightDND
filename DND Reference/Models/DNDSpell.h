//
//  DNDSpell.h
//  DND Reference
//
//  Created by Landon Epps on 12/4/19.
//  Copyright © 2019 Convenient Code, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DNDSpell : NSObject

@property (nonatomic, strong, readonly) NSNumber *level;
@property (nonatomic, copy, readonly) NSArray<NSString *> *components;
@property (nonatomic, copy, readonly) NSString *concentration;
@property (nonatomic, copy, readonly) NSString *range;
@property (nonatomic, copy, readonly) NSString *castingTime;
@property (nonatomic, copy, readonly) NSArray<NSString *> *spellDescription;

@end

#pragma mark - JSONConvertible

@interface DNDSpell (JSONConvertible)

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
