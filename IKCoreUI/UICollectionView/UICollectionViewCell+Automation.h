//
//  UICollectionViewCell+Automation
//
//  Created by Ian Keen on 2/06/2015.
//  Copyright (c) 2015 IanKeen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UICollectionViewCell (Automation)
/**
 *  A convenience method that takes care of all the registration of UICollectionViewCell's as well as the dequeue routine
 *  NOTE: if no UICollectionViewCell instance can be created or registered a standard UICollectionViewCell will be created and returned
 *
 *  @param collectionView UICollectionView being used
 *  @param nibOrClass     Nib or Class to create the UICollectionViewCell from
 *  @param indexPath      NSIndexPath the cell will be shown at
 *
 *  @return UICollectionViewCell
 */
+(instancetype)instance:(UICollectionView *)collectionView nibOrClass:(NSString *)nibOrClass indexPath:(NSIndexPath *)indexPath;
@end
