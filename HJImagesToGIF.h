//
//  HJImagesToGIF.h
//  HJImagesToGIF
//
//  Created by Harrison Jackson on 8/6/13.
//  Copyright (c) 2013 Harrison Jackson. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <UIKit/UIKit.h>
#import <ImageIO/ImageIO.h>
#import <MobileCoreServices/MobileCoreServices.h>


@interface HJImagesToGIF : NSObject

+(void)saveGIFFromImages:(NSArray*)images toPath:(NSString *)path WithCallbackBlock:(void (^)(void))callbackBlock;
+(void)saveGIFToPhotoAlbumFromImages:(NSArray*)images WithCallbackBlock:(void (^)(void))callbackBlock;

@end
