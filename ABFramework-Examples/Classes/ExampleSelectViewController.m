//
//  ExampleSelectViewController.m
//  ABFramework-Examples
//
//  Created by Alexander Blunck on 1/31/13.
//  Copyright (c) 2013 Ablfx. All rights reserved.
//

#import "ExampleSelectViewController.h"

//Data Model
#import "ExampleSection.h"
#import "ExampleObject.h"

//Example ViewControllers
#import "ABSwitchExample.h"

@interface ExampleSelectViewController () <UITableViewDataSource, UITableViewDelegate> {
    UITableView *_tableView;
    NSMutableArray *_sectionArray;
}
@end

@implementation ExampleSelectViewController

#pragma mark - LifeCycle
- (void)viewDidLoad
{
    [super viewDidLoad];
	
    self.title = @"ABFramework Examples";
    
    //Data Model
    _sectionArray = [NSMutableArray new];
    [self compileData];
    
    //TableView
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [self.view addSubview:_tableView];
}



#pragma mark - Helper
-(void) compileData
{
    //Components
    NSArray *componentObjects = @[
                                  [ExampleObject objectWithName:@"ABSwitch" viewControllerClass:[ABSwitchExample class]]
                                  ];
    ExampleSection *componentSection = [ExampleSection sectionWithName:@"Components" exampleObjectArray:componentObjects];
    [_sectionArray addObject:componentSection];
}

-(ExampleObject*) exampleObjectForIndexPath:(NSIndexPath*)indexPath
{
    ExampleSection *exampleSection = [_sectionArray objectAtIndex:indexPath.section];
    return [exampleSection.exampleObjectArray objectAtIndex:indexPath.row];
}



#pragma mark - UITableViewDataSource
-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return _sectionArray.count;
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[(ExampleSection*)[_sectionArray objectAtIndex:section] exampleObjectArray] count];
}

-(NSString*) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    ExampleSection *exampleSection = [_sectionArray objectAtIndex:section];
    return exampleSection.name;
}

-(UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    ExampleObject *exampleObject = [self exampleObjectForIndexPath:indexPath];
    
    cell.textLabel.text = exampleObject.name;
    
    return cell;
}



#pragma mark - UITableViewDelegate
-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ExampleObject *exampleObject = [self exampleObjectForIndexPath:indexPath];
    id viewController = [[exampleObject.viewControllerClass class] new];
    [(UIViewController*)viewController setTitle:exampleObject.name];
    [self.navigationController pushViewController:viewController animated:YES];
}

@end