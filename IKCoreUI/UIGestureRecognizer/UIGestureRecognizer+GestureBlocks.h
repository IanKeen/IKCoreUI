//
//  UIGestureRecognizer+GestureBlocks
//
//  Created by Ian Keen on 2/06/2015.
//  Copyright (c) 2015 IanKeen. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^gestureBlock)(UIGestureRecognizer *gesture);

/**
 Allows for any UIGestureRecognizer to use a block rather than the delegate pattern
 */
@interface UIGestureRecognizer (GestureBlocks)
-(id)initWithBlock:(gestureBlock)block;
@end
