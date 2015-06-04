//
//  UICollectionViewCell+Automation
//
//  Created by Ian Keen on 2/06/2015.
//  Copyright (c) 2015 IanKeen. All rights reserved.
//

#import "UICollectionViewCell+Automation.h"
#import <objc/runtime.h>

static void * kRegisteredCollectionViewCells;

@interface UICollectionView (Registration)
-(NSArray *)registeredCellNames;
-(BOOL)registerCell:(NSString *)nibOrClass;
@end

@implementation UICollectionView (Registration)
-(NSArray *)registeredCellNames {
    return [NSArray arrayWithArray:objc_getAssociatedObject(self, kRegisteredCollectionViewCells)];
}
-(BOOL)registerCell:(NSString *)nibOrClass {
    if ([nibOrClass isEqualToString:NSStringFromClass([UICollectionViewCell class])]) { return NO; }
    
    if (![[self registeredCellNames] containsObject:nibOrClass]) {
        UINib *nib = [UINib nibWithNibName:nibOrClass bundle:nil];
        if (nib) {
            [self registerNib:nib forCellWithReuseIdentifier:nibOrClass];
            
        } else if (NSClassFromString(nibOrClass)) {
            [self registerClass:NSClassFromString(nibOrClass) forCellWithReuseIdentifier:nibOrClass];
            
        } else {
            return NO;
        }
        
        NSArray *registered = [[self registeredCellNames] arrayByAddingObject:nibOrClass];
        objc_setAssociatedObject(self, kRegisteredCollectionViewCells, registered, OBJC_ASSOCIATION_RETAIN);
    }
    
    return YES;
}
@end

@implementation UICollectionViewCell (Automation)
+(instancetype)instance:(UICollectionView *)collectionView nibOrClass:(NSString *)nibOrClass indexPath:(NSIndexPath *)indexPath {
    if ([collectionView registerCell:nibOrClass]) {
        return [collectionView dequeueReusableCellWithReuseIdentifier:nibOrClass forIndexPath:indexPath];
    }
    return [self fallbackInstance:collectionView nibOrClass:nibOrClass indexPath:indexPath];
}
+(instancetype)fallbackInstance:(UICollectionView *)collectionView nibOrClass:(NSString *)nibOrClass indexPath:(NSIndexPath *)indexPath {
    return [[UICollectionViewCell alloc] init];
}
@end
