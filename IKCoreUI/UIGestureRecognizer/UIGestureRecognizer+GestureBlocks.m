//
//  UIGestureRecognizer+GestureBlocks
//
//  Created by Ian Keen on 2/06/2015.
//  Copyright (c) 2015 IanKeen. All rights reserved.
//

#import <objc/runtime.h>
#import "UIGestureRecognizer+GestureBlocks.h"

static void * kGestureBlock;

@implementation UIGestureRecognizer (GestureBlocks)
-(id)initWithBlock:(gestureBlock)block {
    self = [self initWithTarget:self action:@selector(itemTriggered:)];
    if (self) {
        objc_setAssociatedObject(self, kGestureBlock, block, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return self;
}
-(void)itemTriggered:(UIGestureRecognizer *)g {
    gestureBlock block = objc_getAssociatedObject(self, kGestureBlock);
    if (block) {
        block(self);
    }
}
@end
