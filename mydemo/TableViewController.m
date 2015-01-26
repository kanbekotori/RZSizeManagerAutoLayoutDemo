//
//  TableViewController.m
//  mydemo
//
//  Created by jiangxingshang on 15/1/18.
//  Copyright (c) 2015年 jxs. All rights reserved.
//

#import "TableViewController.h"
#import "TableViewCell.h"
#import "RZCellSizeManager.h"

@interface TableViewController ()
@property (nonatomic, strong) RZCellSizeManager *manager;
@property (nonatomic, strong) NSArray *data;
@end

static NSString *cellId = @"cell";

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UINib *nib = [UINib nibWithNibName:@"TableViewCell" bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:cellId];
    [self.tableView registerClass:[TableViewCell class] forCellReuseIdentifier:cellId];
    self.manager = [[RZCellSizeManager alloc] init];
    [self.manager registerCellClassName:NSStringFromClass([TableViewCell class])
                               withNibNamed:nil
                         forReuseIdentifier:cellId
                     withConfigurationBlock:^(TableViewCell *cell, id data) {
                         [cell setCellData:data];
                     }];
    self.data = [NSArray arrayWithObjects:
                 @"i have checkbox if i click checkbox and login then username and",
                 @"i have checkbox if i click checkbox and login then username and password is saved in sharedpreferences..and moves to FirstScreen Activity",
                 @"i have checkbox if i click checkbox and login then username and password is saved in sharedpreferences..and moves to FirstScreen Activity....then if i close application and relaunches again then the application has to move directly to FirstScrren ...this is fine for me and working well",
                 @"issue:: if i login after entering details and click on checkbox...moves to firstScrren there if i logout and it comes to LoginScreen by removing values in shared preferences...it also fine...but here if i press back button and open application again then it showing the values of the logged in ..(in this condition it has to be empty...)",
                 @"whatever this helped you to figure our the problem or not, you must never pass a null as a default value to the SharedPreferences object, you have to pass "" in the case of Strings (may be this is what it gives you the current behaviour), just modify it to the following",
                 nil];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.data.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *str = [self.data objectAtIndex:indexPath.row];
    CGFloat height = [self.manager cellHeightForObject:str indexPath:indexPath];
    NSLog(@"=================================================%f", height);
    return height;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId forIndexPath:indexPath];
    [cell setCellData:[self.data objectAtIndex:indexPath.row]];
    return cell;
}



@end
