//
//  RootTableViewController.m
//  HomeworkClass2
//
//  Created by TWO_FISH on 15/2/11.
//  Copyright (c) 2015年 TWO_FISH. All rights reserved.
//

#import "RootTableViewController.h"
#import "UIImage+imageColor.h"
#import "ViewController.h"
#define ROWNUM 10

@interface RootTableViewController ()
{
    NSMutableArray * _isCollected;
    id  <collectionImageChange> __weak delegate;
    NSIndexPath * _rootIndex;
    
}
@property (nonatomic,strong) NSMutableArray *isCollected;
@property (nonatomic,weak) id <collectionImageChange> delegate;
@property (nonatomic,strong) NSIndexPath *rootIndex;
-(void)changeCollectionButtonColor:(UIButton*)button;
@end


@implementation RootTableViewController
@synthesize isCollected = _isCollected;
@synthesize delegate;
@synthesize rootIndex = _rootIndex;



- (void)viewDidLoad {
    [super viewDidLoad];

    self.delegate = self;

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return ROWNUM;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
     // Configure the cell...
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"rootViewCell" forIndexPath:indexPath];
    UIImage *_cellImage = [UIImage imageWithColor:[UIColor redColor] withHight:50.0f withWidth:100.0f];
    [cell.imageView setImage:_cellImage];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *imageNormal = [UIImage imageNamed:@"btn_collection_normal@2x.png"];
    UIImage *imageSelected = [UIImage imageNamed:@"btn_collection_selected@2x.png"];

    [button setImage:imageNormal forState:UIControlStateNormal];
    [button setImage:imageSelected forState:UIControlStateSelected];
    button.frame = CGRectMake(0.0f, 0.0f, imageNormal.size.width, imageNormal.size.height);
    [button addTarget:self.delegate action:@selector(changeCollectionButtonColor:)
                          forControlEvents:UIControlEventTouchUpInside];
    
    cell.accessoryView = button;
  
    return cell;
}

-(void)changeCollectionButtonColor:(UIButton*)button
{
    button.selected = !button.selected;
}
-(UITableViewCell *) BeforeTableViewCellAtIndex:(NSIndexPath *) indexPath
{
    return [self.tableView cellForRowAtIndexPath:indexPath];
}
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(UITableViewCell*)sender {
    ViewController *destination = segue.destinationViewController;
    if ([destination respondsToSelector:@selector(setClickedButtonIndex:)]) {
        destination.clickedButtonIndex = self.tableView.indexPathForSelectedRow;;
    }
    destination.delegate = self;
    
    
    
}


@end
