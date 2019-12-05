//
//  DNDTopLevelResult.h
//  DND Reference
//
//  Created by Landon Epps on 12/4/19.
//  Copyright © 2019 Convenient Code, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DNDTopLevelResult : NSObject

@property (nonatomic, copy, readonly) NSString *name;
@property (nonatomic, copy, readonly) NSURL *url;

- (instancetype)initWithName:(NSString *)name
                         url:(NSURL *)url;

@end

#pragma mark - JSONConvertible

@interface DNDTopLevelResult (JSONConvertible)

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
