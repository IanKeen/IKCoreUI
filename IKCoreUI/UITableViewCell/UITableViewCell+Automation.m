//
//  UITableViewCell+Automation
//
//  Created by Ian Keen on 2/06/2015.
//  Copyright (c) 2015 IanKeen. All rights reserved.
//

#import "UITableViewCell+Automation.h"
#import <objc/runtime.h>

static void * kRegisteredCells;

@interface UITableViewCell (Private)
+(NSArray *)cellStylesStrings;
@end

@interface UITableView (Registration)
-(NSArray *)registeredCellNames;
-(BOOL)registerCell:(NSString *)nibOrClass;
@end

@implementation UITableView (Registration)
-(NSArray *)registeredCellNames {
    return [NSArray arrayWithArray:objc_getAssociatedObject(self, kRegisteredCells)];
}
-(BOOL)registerCell:(NSString *)nibOrClass {
    NSInteger styleIndex = [[UITableViewCell cellStylesStrings] indexOfObject:nibOrClass];
    if (styleIndex != NSNotFound || [nibOrClass isEqualToString:NSStringFromClass([UITableViewCell class])]) { return NO; }
    
    if (![[self registeredCellNames] containsObject:nibOrClass]) {
        UINib *nib = [UINib nibWithNibName:nibOrClass bundle:nil];
        if (nib) {
            [self registerNib:nib forCellReuseIdentifier:nibOrClass];
            
        } else if (NSClassFromString(nibOrClass)) {
            [self registerClass:NSClassFromString(nibOrClass) forCellReuseIdentifier:nibOrClass];
            
        } else {
            return NO;
        }
        
        NSArray *registered = [[self registeredCellNames] arrayByAddingObject:nibOrClass];
        objc_setAssociatedObject(self, kRegisteredCells, registered, OBJC_ASSOCIATION_RETAIN);
    }
    
    return YES;
}
@end

@implementation UITableViewCell (Automation)
+(instancetype)instance:(UITableView *)tableView nibOrClass:(NSString *)nibOrClass indexPath:(NSIndexPath *)indexPath {
    if ([tableView registerCell:nibOrClass]) {
        return [tableView dequeueReusableCellWithIdentifier:nibOrClass forIndexPath:indexPath];
    }
    return [self fallbackInstance:tableView nibOrClass:nibOrClass indexPath:indexPath];
}
+(instancetype)sizingInstance:(UITableView *)tableView nibOrClass:(NSString *)nibOrClass {
    if ([tableView registerCell:nibOrClass]) {
        return [tableView dequeueReusableCellWithIdentifier:nibOrClass];
    }
    return [self fallbackInstance:tableView nibOrClass:nibOrClass indexPath:nil];
}

+(instancetype)fallbackInstance:(UITableView *)tableView nibOrClass:(NSString *)nibOrClass indexPath:(NSIndexPath *)indexPath {
    NSInteger styleIndex = [[self cellStylesStrings] indexOfObject:nibOrClass];
    if (styleIndex != NSNotFound) {
        return [[UITableViewCell alloc] initWithStyle:[[self cellStyles][styleIndex] integerValue] reuseIdentifier:nibOrClass];
    } else {
        return [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nibOrClass];
    }
}
+(NSArray *)cellStylesStrings {
    return @[@"UITableViewCellStyleDefault", @"UITableViewCellStyleValue1", @"UITableViewCellStyleValue2", @"UITableViewCellStyleSubtitle"];
}
+(NSArray *)cellStyles {
    return @[@(UITableViewCellStyleDefault), @(UITableViewCellStyleValue1), @(UITableViewCellStyleValue2), @(UITableViewCellStyleSubtitle)];
}
@end
