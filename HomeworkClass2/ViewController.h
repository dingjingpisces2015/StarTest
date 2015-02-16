//
//  ViewController.h
//  HomeworkClass2
//
//  Created by TWO_FISH on 15/2/12.
//  Copyright (c) 2015年 TWO_FISH. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RootTableViewController.h"
#import "collectionImageChange.h"

@interface ViewController : UIViewController

@property (nonatomic,strong) NSIndexPath * clickedButtonIndex;
@property (nonatomic,weak) id <collectionImageChange> delegate;
@end
