//
//  HJImagesToGIF.m
//  HJImagesToGIF
//
//  Created by Harrison Jackson on 8/6/13.
//  Copyright (c) 2013 Harrison Jackson. All rights reserved.
//

#import "HJImagesToGIF.h"

@implementation HJImagesToGIF

+(void)saveGIFFromImages:(NSArray*)images toPath:(NSString *)path WithCallbackBlock:(void (^)(void))callbackBlock{
    [[NSFileManager defaultManager] removeItemAtPath:path error:NULL];

    NSDictionary *prep = [NSDictionary dictionaryWithObject:[NSDictionary dictionaryWithObject:[NSNumber numberWithFloat:0.2f] forKey:(NSString *) kCGImagePropertyGIFDelayTime] forKey:(NSString *) kCGImagePropertyGIFDictionary];
    
    static NSUInteger kFrameCount = 16;
    
    NSDictionary *fileProperties = @{
                                     (__bridge id)kCGImagePropertyGIFDictionary: @{
                                             (__bridge id)kCGImagePropertyGIFLoopCount: @0, // 0 means loop forever
                                             }
                                     };
    
    CFURLRef url = (__bridge CFURLRef)[NSURL fileURLWithPath:path];
    
    CGImageDestinationRef dst = CGImageDestinationCreateWithURL(url, kUTTypeGIF, [images count], nil);
    CGImageDestinationSetProperties(dst, (__bridge CFDictionaryRef)fileProperties);
    
    for (int i=0;i<[images count];i++)
    {
        //load anImage from array
        UIImage * anImage = [images objectAtIndex:i];
        
        CGImageDestinationAddImage(dst, anImage.CGImage,(__bridge CFDictionaryRef)(prep));
        
    }
    
    bool fileSave = CGImageDestinationFinalize(dst);
    CFRelease(dst);
    if(fileSave) {
        NSLog(@"animated GIF file created at %@", path);
    }else{
        NSLog(@"error: no animated GIF file created at %@", path);
    }
}
+(void)saveGIFToPhotoAlbumFromImages:(NSArray*)images WithCallbackBlock:(void (^)(void))callbackBlock{
    NSString *tempPath = [NSHomeDirectory() stringByAppendingPathComponent:
                          [NSString stringWithFormat:@"hj_temp.gif"]];

    [HJImagesToGIF saveGIFFromImages:images toPath:tempPath WithCallbackBlock:callbackBlock];
    UIImage * gif_image = [UIImage imageWithContentsOfFile:tempPath];
    UIImageWriteToSavedPhotosAlbum(gif_image, self, nil, nil);
}



@end
