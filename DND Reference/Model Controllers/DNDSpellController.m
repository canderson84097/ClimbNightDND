//
//  DNDSpellController.m
//  DND Reference
//
//  Created by Landon Epps on 12/5/19.
//  Copyright © 2019 Convenient Code, LLC. All rights reserved.
//

#import "DNDSpellController.h"

static NSString * const baseURL = @"http://www.dnd5eapi.co/api";
static NSString * const spellsComponent = @"spells";

@implementation DNDSpellController

+ (void)fetchSpellsForClass:(NSString *)className
          completionHandler:(void (^)(NSArray<DNDTopLevelResult *> * _Nullable))completionHandler {
    
    NSURL *url = [NSURL URLWithString:baseURL];
    NSURL *spellsUrl = [url URLByAppendingPathComponent:spellsComponent];
    NSURL *finalURL = [spellsUrl URLByAppendingPathComponent:[className lowercaseString]];
    
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
        
        NSMutableArray *spells = [NSMutableArray new];
        
        for (NSDictionary *classDict in json[@"results"]) {
            DNDTopLevelResult *class = [[DNDTopLevelResult alloc] initWithDictionary:classDict];
            [spells addObject:class];
        }
        
        completionHandler([spells copy]);
        
    }] resume];
}

+ (void)fetchSpellsMatchingSearch:(NSString *)searchTerm
                completionHandler:(void (^)(NSArray<DNDTopLevelResult *> * _Nullable))completionHandler {
    
}

+ (void)fetchSpellDetailsFromURL:(NSURL *)url
               completionHandler:(void (^)(DNDSpell * _Nullable))completionHandler {
    
    [[NSURLSession.sharedSession dataTaskWithURL:url completionHandler:^(NSData * _Nullable data,NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
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
        
        NSMutableArray *spells = [NSMutableArray new];
        
        for (NSDictionary *classDict in json[@"results"]) {
            DNDTopLevelResult *class = [[DNDTopLevelResult alloc] initWithDictionary:classDict];
            [spells addObject:class];
        }
        
        completionHandler([spells copy]);
        
    }] resume];
}

@end
