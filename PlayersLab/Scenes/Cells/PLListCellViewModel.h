//
//  PLListCellViewModel.h
//  PlayersLab
//
//  Created by kirill on 28.11.16.
//  Copyright © 2016 maugrysmirnov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PLListCellViewModel : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *sport;
@property (nonatomic, strong) NSString *country;

- (instancetype) initWithName:(NSString *)p_name sport:(NSString *)p_sport andCountry: (NSString *)p_country;

@end
