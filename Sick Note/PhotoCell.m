//
//  PhotoCell.m
//  Sick Note
//
//  Created by lancy.fernandes on 11/07/13.
//  Copyright (c) 2013 Self. All rights reserved.
//

#import "PhotoCell.h"
#import "ImageModel.h"

@interface PhotoCell ()

@property (nonatomic, weak) IBOutlet UILabel *ibLabel;
@property (nonatomic, weak) IBOutlet UIImageView *ibImageView;

@end

@implementation PhotoCell

+ (instancetype)instance
{
    NSArray *nibViews = [[NSBundle mainBundle] loadNibNamed:@"PhotoCell"
                                                      owner:nil
                                                    options:nil];
    PhotoCell *cell = nibViews[0];
    return cell;
}

- (void)setImageModel:(ImageModel *)imageModel
{
    _imageModel = imageModel;
    [_imageModel getImageWithCompletionHandler:^(UIImage *image) {
        dispatch_async(dispatch_get_main_queue(), ^{
            self.ibImageView.image = image;
        });
    }];
    
    [self.ibLabel setText:[NSString stringWithFormat:@"Attachement %d", _imageModel.index+1]];
}

@end
