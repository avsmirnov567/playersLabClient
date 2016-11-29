//
//  PLListCellViewModel.m
//  PlayersLab
//
//  Created by kirill on 28.11.16.
//  Copyright © 2016 maugrysmirnov. All rights reserved.
//

#import "PLListCellViewModel.h"

@implementation PLListCellViewModel

- (instancetype) initWithName:(NSString *)p_name sport:(NSString *)p_sport andCountry:(NSString *)p_country {
    if (self == [super init]){
        self.name = p_name;
        self.sport = p_sport;
        self.country = p_country;
    }
    return self;
}

@end
