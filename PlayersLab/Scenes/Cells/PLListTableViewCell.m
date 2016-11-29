//
//  PLListTableViewCell.m
//  PlayersLab
//
//  Created by kirill on 28.11.16.
//  Copyright © 2016 maugrysmirnov. All rights reserved.
//

#import "PLListTableViewCell.h"

@interface PLListTableViewCell ()

@property (weak, nonatomic) IBOutlet UILabel *nameLbl;
@property (weak, nonatomic) IBOutlet UILabel *sportCountryLbl;

@end

@implementation PLListTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void) bindModel:(PLListCellViewModel *)model {
    [self.nameLbl setText:model.name];
    [self.sportCountryLbl setText: [NSString stringWithFormat:@"%@ - %@", model.country, model.sport]];
}

@end
