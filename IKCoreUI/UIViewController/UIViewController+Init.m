//
//  UIViewController+Init
//
//  Created by Ian Keen on 2/06/2015.
//  Copyright (c) 2015 IanKeen. All rights reserved.
//

#import "UIViewController+Init.h"

@implementation UIViewController (Init)
+(instancetype)instance {
    NSString *nibName = NSStringFromClass([self class]);
    if ([nibName rangeOfString:@"."].location != NSNotFound) {
        //to accomodate swift viewcontrollers
        nibName = [[nibName componentsSeparatedByString:@"."] lastObject];
    }
    return [[self alloc] initWithNibName:nibName bundle:nil];
}
@end
