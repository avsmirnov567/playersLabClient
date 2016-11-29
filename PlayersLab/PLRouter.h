//
//  PLRouter.h
//  PlayersLab
//
//  Created by kirill on 28.11.16.
//  Copyright © 2016 maugrysmirnov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface PLRouter : NSObject

@property (nonatomic, strong) UINavigationController *ncMain;

+ (instancetype)sharedInstance;

- (void) start;
- (void) showListWithName: (NSString *)p_name;

@end
