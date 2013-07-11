//
//  PhotoCell.h
//  Sick Note
//
//  Created by lancy.fernandes on 11/07/13.
//  Copyright (c) 2013 Self. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ImageModel;

@interface PhotoCell : UITableViewCell

+ (instancetype)instance;

@property(strong, nonatomic) ImageModel *imageModel;

@end
