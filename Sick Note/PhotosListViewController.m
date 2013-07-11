//
//  PhotosListViewController.m
//  SickNote
//
//  Created by Lim Jessica on 23/6/13.
//  Copyright (c) 2013 Self. All rights reserved.
//

#import "PhotosListViewController.h"
#import <MobileCoreServices/MobileCoreServices.h>
#import <AssetsLibrary/AssetsLibrary.h>
#import "Utils.h"
#import "ImageModel.h"
#import "PhotoCell.h"

@interface PhotosListViewController ()

@end

@implementation PhotosListViewController
@synthesize photos = _photos;
@synthesize galleryImage;
@synthesize test;
@synthesize urlCollector;
@synthesize photoCollector;
@synthesize imageModelObjects;

- (NSMutableArray *)photos
{
    if (!_photos) _photos = [NSMutableArray array];
    return _photos;
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

    [super viewDidLoad];

    self.imageModelObjects = [NSMutableArray array];
    for(NSURL *url in self.urlCollector)
    {
        ImageModel *imageModel = [[ImageModel alloc] init];
        imageModel.imageUrl = url;
        [self.imageModelObjects addObject:imageModel];
        NSLog(@"Image model %@,",imageModelObjects);
    }
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.urlCollector count];

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    PhotoCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [PhotoCell instance];
    }

    ImageModel *model = [self.imageModelObjects objectAtIndex:indexPath.row];
    model.index = indexPath.row;
    cell.imageModel = model;

    return cell;
}

@end
