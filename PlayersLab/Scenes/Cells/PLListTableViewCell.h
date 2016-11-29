//
//  PLListTableViewCell.h
//  PlayersLab
//
//  Created by kirill on 28.11.16.
//  Copyright © 2016 maugrysmirnov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PLListCellViewModel.h"

@interface PLListTableViewCell : UITableViewCell

- (void) bindModel: (PLListCellViewModel *)model;

@end
