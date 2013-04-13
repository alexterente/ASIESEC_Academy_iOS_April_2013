//
//  RecipeTableViewController.m
//  recipe
//
//  Created by Alex Terente on 4/6/13.
//  Copyright (c) 2013 TAGonSoft. All rights reserved.
//

#import "UIRecipeTableViewController.h"
#import "ACRecipe.h"
#import "JSONKit.h"

#define kDetailedLabelFont [UIFont systemFontOfSize:12]

@implementation UIRecipeTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (NSArray *)recipeFromArray:(NSArray *)jsonArray{
    NSMutableArray *returnRecipeArray = [[NSMutableArray alloc] initWithCapacity:[jsonArray count]];
    for (NSDictionary *currentDictionary in jsonArray) {
        ACRecipe *newRecipe = [[ACRecipe alloc]
                               initWithName:currentDictionary[@"Name"]
                               description:currentDictionary[@"Description"]
                               andPhotoName:currentDictionary[@"PhotoName"]];
        
        [returnRecipeArray addObject:newRecipe];
    }
    return [NSArray arrayWithArray:returnRecipeArray];
}

- (void)loadJson{
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"Recipe" ofType:@"json"];
    NSString *jsonString = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
    NSLog(@"JsonString:%@",jsonString);
    NSArray *recipeDictionaryArray = [jsonString objectFromJSONString];
    [dataSourceArray removeAllObjects];
    [dataSourceArray addObjectsFromArray:[self recipeFromArray:recipeDictionaryArray]];
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    self.navigationItem.title = NSLocalizedString(@"kRecipeTitle", @"");
    dataSourceArray = [[NSMutableArray alloc] initWithCapacity:0];

    [self loadJson];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    // Return the number of rows in the section.
    return [dataSourceArray count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    ACRecipe *curentRecipe = [dataSourceArray objectAtIndex:indexPath.row];
    CGSize constraindSize = CGSizeMake(280, 9999);
    CGSize descriptionSize = [curentRecipe.description sizeWithFont:kDetailedLabelFont
                                                   constrainedToSize:constraindSize
                                                      lineBreakMode:NSLineBreakByTruncatingTail];
    
    //return 30+descriptionSize.height;
    return 60;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if(cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
    // Configure the cell...
    ACRecipe *currentRecipe = [dataSourceArray objectAtIndex:indexPath.row];
    cell.textLabel.text = currentRecipe.name;
    cell.detailTextLabel.text = currentRecipe.description;
    cell.detailTextLabel.numberOfLines = 2;
    cell.imageView.image = [UIImage imageNamed:currentRecipe.photoName];
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return NSLocalizedString(@"kOldRecipes", @"");
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

@end
