//
//  DNDClassController.h
//  DND Reference
//
//  Created by Landon Epps on 12/4/19.
//  Copyright © 2019 Convenient Code, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DNDTopLevelResult.h"
#import "DNDClass.h"

NS_ASSUME_NONNULL_BEGIN

@interface DNDClassController : NSObject

+ (void)fetchClassesWithCompletionHandler:(void (^)(NSArray<DNDTopLevelResult *> * _Nullable))completionHandler;

+ (void)fetchClassDetailsFromURL:(NSURL *)url
               completionHandler:(void (^)(DNDClass * _Nullable))completionHandler;

@end

NS_ASSUME_NONNULL_END
