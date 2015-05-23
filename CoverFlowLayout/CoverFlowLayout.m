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
    self.itemSize = CGSizeMake(150, 100);
}



@end
