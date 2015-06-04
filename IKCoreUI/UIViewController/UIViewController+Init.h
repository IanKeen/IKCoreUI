//
//  UIViewController+Init
//
//  Created by Ian Keen on 2/06/2015.
//  Copyright (c) 2015 IanKeen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (Init)
/**
 *  Convenience method to create an instance of a UIViewController using the standard initWithNibName:bundle:
 *  This works for both Objective-C and Swift
 *
 *  @return UIViewController instance
 */
+(instancetype)instance;
@end
