//
//  iMASNotifsTableViewController.m
//  sentry-app
//
//  Created by Ren, Alice on 8/15/14.
//  Copyright (c) 2014 MITRE Corp. All rights reserved.
//

#import "iMASNotifsTableViewController.h"
#import <Filter.h>
#import "iMASFilterClass.h"
#import "constants.h"
#import "APViewController.h"

static NSMutableArray* _oldNotifs;

@interface iMASNotifsTableViewController ()
@end

@implementation iMASNotifsTableViewController

+(void)insertToNotifs:(NSString *)newNotif shouldCrash:(BOOL)crash
{
    if ([[IMSKeychain passwordForService:serviceName account:@"exitAppSwitch"] isEqualToString:@"ON"] && crash) {
        strcpy(0, "crash");
    }
    [oldNotifs() addObject:newNotif];
    [iMASFilterClass writeNotifs:oldNotifs()];
}

NSMutableArray* oldNotifs()
{
    if(!_oldNotifs)
    {
        static dispatch_once_t dToken;
        dispatch_once(&dToken, ^{
            _oldNotifs = [[NSMutableArray alloc] init];
          //  oldNotifs = [iMASFilterClass loadNotifs];
        });
    }
    return _oldNotifs;
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
   // NSString* notice = @"Debugger Detected"
   // [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(insertToNotifs:notice) name:@"debugDetected" object:nil];

    [super viewDidLoad];
    
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
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
    return [oldNotifs() count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"NotifCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
    // Get list of local notifications
  //  NSArray *notificationArray = [[UIApplication sharedApplication] scheduledLocalNotifications];
    
   // UILocalNotification *notif = [self.oldNotifs objectAtIndex:indexPath.row];
    
    // Display notification info
   // [cell.textLabel setText:notif.alertBody];
   // [cell.detailTextLabel setText:[notif.fireDate description]];
    [cell.textLabel setText:[oldNotifs() objectAtIndex:indexPath.row]];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 88.0f;
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
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end