//
//  collectionImageChange.h
//  HomeworkClass2
//
//  Created by TWO_FISH on 15/2/12.
//  Copyright (c) 2015年 TWO_FISH. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol collectionImageChange <NSObject>
@required
-(void)changeCollectionButtonColor:(UIButton *)button;
-(UITableViewCell *) BeforeTableViewCellAtIndex:(NSIndexPath *) indexPath;

@end
