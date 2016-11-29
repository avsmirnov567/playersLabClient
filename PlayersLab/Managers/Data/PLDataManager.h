//
//  PLDataManager.h
//  PlayersLab
//
//  Created by kirill on 28.11.16.
//  Copyright © 2016 maugrysmirnov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PLListCellViewModel.h"

@protocol PLDataManagerDelegate <NSObject>

- (void) displayPlayers: (NSArray *)p_players;

@end

@interface PLDataManager : NSObject

@property (nonatomic, weak) id<PLDataManagerDelegate> delegate;

+ (instancetype)sharedInstance;

typedef void (^PLDataManagerSuccessLoad)(id p_loadedObject);
typedef void (^PLDataManagerFailLoad)(NSError *p_error);

+ (void) getAllPlayers;
+ (void) getPlayersByName: (NSString *)p_name;

@end
