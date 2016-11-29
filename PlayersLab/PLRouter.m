//
//  PLRouter.m
//  PlayersLab
//
//  Created by kirill on 28.11.16.
//  Copyright © 2016 maugrysmirnov. All rights reserved.
//

#import "PLRouter.h"
#import "PLMainViewController.h"
#import "PLListViewController.h"

@implementation PLRouter

+ (instancetype)sharedInstance {
    static PLRouter *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    return instance;
}

- (void) start {
    if (self.ncMain){
        PLMainViewController *main = [[PLMainViewController alloc] initWithNibName: @"PLMainViewController" bundle: nil];
        [self.ncMain pushViewController:main animated:NO];
    }
}

- (void) showListWithName:(NSString *)p_name {
    PLListViewController *list = [[PLListViewController alloc] initWithNibName: @"PLListViewController" bundle: nil];
    list.nameQuery = p_name;
    [self.ncMain pushViewController:list animated:YES];
}

@end
