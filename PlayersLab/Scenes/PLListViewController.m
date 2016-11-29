//
//  PLListViewController.m
//  PlayersLab
//
//  Created by kirill on 28.11.16.
//  Copyright © 2016 maugrysmirnov. All rights reserved.
//

#import "PLListViewController.h"
#import "PLListCellViewModel.h"
#import "PLListTableViewCell.h"
#import "PLDataManager.h"

static NSString *kCellID = @"cell_id";

@interface PLListViewController ()<UITableViewDelegate, UITableViewDataSource, PLDataManagerDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray<PLListCellViewModel*> *playersList;

@end

@implementation PLListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [PLDataManager sharedInstance].delegate = self;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerNib: [UINib nibWithNibName: @"PLListTableViewCell" bundle: nil] forCellReuseIdentifier: kCellID];
    if (self.nameQuery){
        [PLDataManager getPlayersByName:self.nameQuery];
    } else {
        [PLDataManager getAllPlayers];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.playersList.count > 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.playersList.count > 0 ? self.playersList.count : 0;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 120;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    PLListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellID forIndexPath:indexPath];
    [cell bindModel: self.playersList[indexPath.row]];
    return cell;
}

- (void) displayPlayers:(NSArray *)p_players{
    self.playersList = p_players;
    [self.tableView reloadData];
}

@end
