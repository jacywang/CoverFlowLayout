//
//  CoverFlowLayout.m
//  CoverFlowLayout
//
//  Created by JIAN WANG on 5/22/15.
//  Copyright (c) 2015 JWANG. All rights reserved.
//

#import "CoverFlowLayout.h"

@implementation CoverFlowLayout

-(void)prepareLayout {
    [super prepareLayout];
    
    self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    self.minimumLineSpacing = 0;
    self.itemSize = CGSizeMake(self.collectionView.bounds.size.width / 3, self.collectionView.bounds.size.height / 2 );

}

-(NSArray *)layoutAttributesForElementsInRect:(CGRect)rect {
    NSMutableArray *allAttributes = [[super layoutAttributesForElementsInRect:rect] mutableCopy];
    
    CGRect visibleRegion;
    visibleRegion.origin = self.collectionView.contentOffset;
    visibleRegion.size = self.collectionView.bounds.size;
    
    // Modify the layout attributes as needed here
    for (UICollectionViewLayoutAttributes *attributes in allAttributes) {
        float distance = abs(attributes.center.x - visibleRegion.origin.x - visibleRegion.size.width / 2);
        if (distance < self.itemSize.width / 2) {
            attributes.alpha = 1;
        } else {
            attributes.alpha = (self.itemSize.width / 2) / distance;
        }
        
        attributes.transform3D = CATransform3DMakeScale(1, 10, 2);
        attributes.transform3D = CATransform3DMakeRotation(distance / 5 * M_PI / 180, 0.0, 1.0, 0.0);
        
        
        
//        NSLog(@"attibutes.size.width:%f", attributes.bounds.size.width);
//        NSLog(@"attributes.center.x: %f", attributes.center.x);
//        NSLog(@"visibleRegion.origin.x: %f", visibleRegion.origin.x);
//        NSLog(@"visibleRegion.size.width/2: %f", visibleRegion.size.width/2);
//        NSLog(@"%d", abs(attributes.center.x - visibleRegion.origin.x - visibleRegion.size.width / 2))
//        ;
//        NSLog(@"alpha: %f", attributes.alpha);
    }
    
    return allAttributes;
}

-(BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds {
    return YES;
}

@end
