//
//  UIAlertView+Blocks
//
//  Created by Ian Keen on 2/06/2015.
//  Copyright (c) 2015 IanKeen. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^uiAlertViewActionBlock)(UIAlertView *alertView, NSInteger selectedButtonIndex, NSString *selectedButtonText);
typedef void (^uiAlertViewWillShowBlock)(UIAlertView *alertView);

/**
 *  Adds block based methods to UIAlertView to break out of the delegte pattern
 */
@interface UIAlertView (Blocks) <UIAlertViewDelegate>
+(void)alertWithTitle:(NSString *)title message:(NSString *)message cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitles:(NSArray *)otherButtonTitles action:(uiAlertViewActionBlock)block;
+(void)alertWithTitle:(NSString *)title message:(NSString *)message cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitles:(NSArray *)otherButtonTitles willShow:(uiAlertViewWillShowBlock)willShow action:(uiAlertViewActionBlock)block;
@end
