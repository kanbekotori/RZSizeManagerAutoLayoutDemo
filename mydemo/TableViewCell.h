//
//  TableViewCell.h
//  mydemo
//
//  Created by jiangxingshang on 15/1/18.
//  Copyright (c) 2015年 jxs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewCell : UITableViewCell
@property (nonatomic, weak) IBOutlet UILabel *label;

- (void)setCellData:(NSString *)text;
@end
