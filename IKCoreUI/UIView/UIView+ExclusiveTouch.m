//
//  UIView+ExclusiveTouch
//
//  Created by Ian Keen on 2/06/2015.
//  Copyright (c) 2015 IanKeen. All rights reserved.
//

#import "UIView+ExclusiveTouch.h"

@implementation UIView (ExclusiveTouch)
-(void)setExclusiveTouchRecursive:(BOOL)exclusiveTouch {
    self.exclusiveTouch = exclusiveTouch;
    
    [self.subviews enumerateObjectsUsingBlock:^(UIView *obj, NSUInteger idx, BOOL *stop) {
        [obj setExclusiveTouchRecursive:exclusiveTouch];
    }];
}
@end
