//
//  DNDSpellController.h
//  DND Reference
//
//  Created by Landon Epps on 12/5/19.
//  Copyright © 2019 Convenient Code, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DNDTopLevelResult.h"
#import "DNDSpell.h"

NS_ASSUME_NONNULL_BEGIN

@interface DNDSpellController : NSObject

+ (void)fetchSpellsForClass:(NSString *)className
                completionHandler:(void (^)(NSArray<DNDTopLevelResult *> * _Nullable))completionHandler;

+ (void)fetchSpellDetailsFromURL:(NSURL *)url
               completionHandler:(void (^)(DNDSpell * _Nullable))completionHandler;

@end

NS_ASSUME_NONNULL_END
