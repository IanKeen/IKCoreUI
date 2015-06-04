//
//  UIView+ExclusiveTouch
//
//  Created by Ian Keen on 2/06/2015.
//  Copyright (c) 2015 IanKeen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (ExclusiveTouch)
/**
 *  Simple convenience method to recursively enable or disable exclusive touch on a UIView and its children
 *
 *  @param exclusiveTouch YES to enable exclusive touch, NO to disable
 */
-(void)setExclusiveTouchRecursive:(BOOL)exclusiveTouch;
@end
