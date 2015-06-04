//
//  UITableViewCell+Automation
//
//  Created by Ian Keen on 2/06/2015.
//  Copyright (c) 2015 IanKeen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableViewCell (Automation)
/**
 *  A convenience method that takes care of all the registration of UITableViewCell's as well as the dequeue routine
 *  NOTE: if no UITableViewCell instance can be created or registered a standard UITableViewCell will be created and returned
 *
 *  You can also parse in a UITableViewCellStyle as an NSString if you need one of those
 *
 *  @param tableView    UITableView cell will go into
 *  @param nibOrClass   Name of Nib or Class used to create cell
 *  @param indexPath    NSIndexPath cell will go into
 *
 *  @return UITableViewCell
 */
+(instancetype)instance:(UITableView *)tableView nibOrClass:(NSString *)nibOrClass indexPath:(NSIndexPath *)indexPath;

/**
 *  A convenience method that takes care of all the registration of UITableViewCell's as well as the dequeue routine
 *  NOTE: if no UITableViewCell instance can be created or registered a standard UITableViewCell will be created and returned
 *
 *  You can also parse in a UITableViewCellStyle as an NSString if you need one of those
 *
 *  @param tableView    UITableView cell will go into
 *  @param nibOrClass   Name of Nib or Class used to create cell
 *
 *  @return UITableViewCell
 */
+(instancetype)sizingInstance:(UITableView *)tableView nibOrClass:(NSString *)nibOrClass;
@end
