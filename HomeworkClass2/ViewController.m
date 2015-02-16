//
//  ViewController.m
//  HomeworkClass2
//
//  Created by TWO_FISH on 15/2/12.
//  Copyright (c) 2015年 TWO_FISH. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()


@end

@implementation ViewController
- (void)changeBeforePageButton
{
    UITableViewCell *selectedCell = [self.delegate BeforeTableViewCellAtIndex:self.clickedButtonIndex];
    [self.delegate changeCollectionButtonColor:(UIButton *)selectedCell.accessoryView];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    UIImage *imageNormal = [UIImage imageNamed:@"btn_collection_normal@2x.png"];
    UIImage *imageSelected = [UIImage imageNamed:@"btn_collection_selected@2x.png"];
    UIButton *buttonONViewController = [UIButton buttonWithType:UIButtonTypeCustom];
    buttonONViewController.frame = CGRectMake(100.0f, 100.0f, imageNormal.size.width, imageNormal.size.height);
    
    
    UITableViewCell *selectedCell = [self.delegate BeforeTableViewCellAtIndex:self.clickedButtonIndex];
    
    
    
    [buttonONViewController setBackgroundImage:imageSelected forState:UIControlStateSelected];
    [buttonONViewController setBackgroundImage:imageNormal forState:UIControlStateNormal];
    buttonONViewController.selected = ((UIButton *)selectedCell.accessoryView).selected;
    
    [self.view addSubview:buttonONViewController];
    
    if ([self.delegate respondsToSelector:@selector(changeCollectionButtonColor:)]) {
        [buttonONViewController addTarget:self action:@selector(changeBeforePageButton) forControlEvents:UIControlEventTouchUpInside];
        [buttonONViewController addTarget:self.delegate action:@selector(changeCollectionButtonColor:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    // Do any additional setup after loading the view.
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
