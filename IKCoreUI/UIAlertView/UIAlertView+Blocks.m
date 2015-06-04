//
//  UIAlertView+Blocks
//
//  Created by Ian Keen on 2/06/2015.
//  Copyright (c) 2015 IanKeen. All rights reserved.
//

#import "UIAlertView+Blocks.h"
#import <objc/runtime.h>

const void * kAssociatedActionBlock;

@implementation UIAlertView (Blocks)
+(void)alertWithTitle:(NSString *)title message:(NSString *)message cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitles:(NSArray *)otherButtonTitles willShow:(uiAlertViewWillShowBlock)willShow action:(uiAlertViewActionBlock)block {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title message:message delegate:[self class] cancelButtonTitle:cancelButtonTitle otherButtonTitles:nil];
    for (NSString *title in otherButtonTitles) {
        [alert addButtonWithTitle:title];
    }
    
    objc_setAssociatedObject(alert, kAssociatedActionBlock, block, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    if (willShow) { willShow(alert); }
    
    [alert show];
}
+(void)alertWithTitle:(NSString *)title message:(NSString *)message cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitles:(NSArray *)otherButtonTitles action:(uiAlertViewActionBlock)block {
    [[self class] alertWithTitle:title message:message cancelButtonTitle:cancelButtonTitle otherButtonTitles:otherButtonTitles willShow:nil action:block];
}

+(void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
    uiAlertViewActionBlock action = objc_getAssociatedObject(alertView, kAssociatedActionBlock);
    objc_setAssociatedObject(alertView, kAssociatedActionBlock, nil, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if (action) {
        action(alertView, buttonIndex, [alertView buttonTitleAtIndex:buttonIndex]);
    }
}
+(void)alertViewCancel:(UIAlertView *)alertView {
    uiAlertViewActionBlock action = objc_getAssociatedObject(alertView, kAssociatedActionBlock);
    objc_setAssociatedObject(alertView, kAssociatedActionBlock, nil, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if (action) {
        action(alertView, -1, nil);
    }
}
@end
