//
//  DNDClassController.m
//  DND Reference
//
//  Created by Landon Epps on 12/4/19.
//  Copyright © 2019 Convenient Code, LLC. All rights reserved.
//

#import "DNDClassController.h"

static NSString * const baseURL = @"http://www.dnd5eapi.co/api";
static NSString * const classesComponent = @"classes";

@implementation DNDClassController

+ (void)fetchClassesWithCompletionHandler:(void (^)(NSArray<DNDTopLevelResult *> *))completionHandler  {
    
    NSURL *url = [NSURL URLWithString:baseURL];
    NSURL *finalURL = [url URLByAppendingPathComponent:classesComponent];
    
    [[NSURLSession.sharedSession dataTaskWithURL:finalURL completionHandler:^(NSData * _Nullable data,NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error) {
            NSLog(@"Error fetching classes\nIn %s: %@\n---\n%@", __PRETTY_FUNCTION__, error.localizedDescription, error);
            completionHandler(nil);
            return;
        }
        
        if (data == nil) {
            NSLog(@"No data in response.");
            completionHandler(nil);
            return;
        }
        
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
        
        if (error) {
            NSLog(@"Error serializing JSON\nIn %s: %@\n---\n%@", __PRETTY_FUNCTION__, error.localizedDescription, error);
            completionHandler(nil);
            return;
        }
        
        NSMutableArray *classes = [NSMutableArray new];
        
        for (NSDictionary *classDict in json[@"results"]) {
            DNDTopLevelResult *class = [[DNDTopLevelResult alloc] initWithDictionary:classDict];
            [classes addObject:class];
        }
        
        completionHandler([classes copy]);
        
    }] resume];
    
}

+ (void)fetchClassDetailsFromURL:(NSURL *)url
               completionHandler:(void (^)(DNDClass * _Nullable))completionHandler {
    
    [[NSURLSession.sharedSession dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error) {
            NSLog(@"Error\nIn %s: %@\n---\n%@", __PRETTY_FUNCTION__, error.localizedDescription, error);
            completionHandler(nil);
            return;
        }
        
        if (data == nil) {
            NSLog(@"No data in response.");
            completionHandler(nil);
            return;
        }
        
        NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
        
        if (error) {
            NSLog(@"Error serializing JSON\nIn %s: %@\n---\n%@", __PRETTY_FUNCTION__, error.localizedDescription, error);
            completionHandler(nil);
            return;
        }
        
        DNDClass *class = [[DNDClass alloc] initWithDictionary:jsonDict];
        
        completionHandler(class);
    }] resume];
}

@end
