//
//  UIBarButtonItem+Blocks
//
//  Created by Ian Keen on 2/06/2015.
//  Copyright (c) 2015 IanKeen. All rights reserved.
//

#import "UIBarButtonItem+Blocks.h"

static void * kActionBlock;

@implementation UIBarButtonItem (Blocks)
-(id)initWithBarButtonSystemItem:(UIBarButtonSystemItem)systemItem block:(barButtonItemActionBlock)action {
    self = [self initWithBarButtonSystemItem:systemItem target:self action:@selector(actionTriggered:)];
    if (self) {
        objc_setAssociatedObject(self, kActionBlock, action, OBJC_ASSOCIATION_COPY_NONATOMIC);
    }
    return self;
}
-(id)initWithTitle:(NSString *)title style:(UIBarButtonItemStyle)style block:(barButtonItemActionBlock)action {
    self = [self initWithTitle:title style:style target:self action:@selector(actionTriggered:)];
    if (self) {
        objc_setAssociatedObject(self, kActionBlock, action, OBJC_ASSOCIATION_COPY_NONATOMIC);
    }
    return self;
}
-(id)initWithImage:(UIImage *)image style:(UIBarButtonItemStyle)style block:(barButtonItemActionBlock)action {
    self = [self initWithImage:image style:style target:self action:@selector(actionTriggered:)];
    if (self) {
        objc_setAssociatedObject(self, kActionBlock, action, OBJC_ASSOCIATION_COPY_NONATOMIC);
    }
    return self;
}
-(id)initWithImage:(UIImage *)image landscapeImagePhone:(UIImage *)landscapeImagePhone style:(UIBarButtonItemStyle)style block:(barButtonItemActionBlock)action {
    self = [self initWithImage:image landscapeImagePhone:landscapeImagePhone style:style target:self action:@selector(actionTriggered:)];
    if (self) {
        objc_setAssociatedObject(self, kActionBlock, action, OBJC_ASSOCIATION_COPY_NONATOMIC);
    }
    return self;
}
-(id)initWithCustomView:(UIView *)customView block:(barButtonItemActionBlock)action {
    self = [self initWithCustomView:customView];
    if (self) {
        [self setTarget:self];
        [self setAction:@selector(actionTriggered:)];
        objc_setAssociatedObject(self, kActionBlock, action, OBJC_ASSOCIATION_COPY_NONATOMIC);
        
        if ([customView isKindOfClass:[UIButton class]]) {
            [((UIButton *)customView) addTarget:self action:@selector(actionTriggered:) forControlEvents:UIControlEventTouchUpInside];
        }
    }
    return self;
}

-(void)actionTriggered:(id)sender {
    barButtonItemActionBlock action = objc_getAssociatedObject(self, kActionBlock);
    if (action) {
        action(self);
    }
}
@end
