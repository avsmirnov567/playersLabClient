//
//  PLDataManager.m
//  PlayersLab
//
//  Created by kirill on 28.11.16.
//  Copyright © 2016 maugrysmirnov. All rights reserved.
//

#import "PLDataManager.h"
#import <AFNetworking.h>

@implementation PLDataManager

+ (instancetype)sharedInstance {
    static PLDataManager *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    return instance;
}

+ (void)getAllPlayers {
    AFHTTPSessionManager *manager= [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    
    [manager GET:@"http://playerslab.cloudapp.net/Service1.svc/players"
      parameters:nil
        progress:nil
         success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
             [PLDataManager parsePlayers:responseObject];
            }
         failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
             
         }];
}

+ (void)getPlayersByName:(NSString *)p_name {
    AFHTTPSessionManager *manager= [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    
    [manager GET:@"http://playerslab.cloudapp.net/Service1.svc/players"
      parameters:@{@"nameQuery":p_name}
        progress:nil
         success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
             [PLDataManager parsePlayers:responseObject];
         }
         failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
             
         }];
}

+ (void)addPlayerWithName:(NSString *)p_name withSport:(NSString *)p_sport andCountry:(NSString *)p_country {
    AFHTTPSessionManager *manager= [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    
    
}

+ (void)parsePlayers: (id)json {
    NSMutableArray<PLListCellViewModel *> *allPlayers = [NSMutableArray new];
    
    for (id player in json){
        PLListCellViewModel *model = [[PLListCellViewModel alloc] initWithName:player[@"Name"] sport:player[@"Sports"] andCountry:player[@"Country"]];
        [allPlayers addObject:model];
    }
    
    [[PLDataManager sharedInstance].delegate displayPlayers:allPlayers];
}

@end
