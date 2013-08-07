HJImagesToGIF
=============

Convert image array to animated GIF

### Save to path
```
[HJImagesToGIF saveGIFFromImages:images toPath:path WithCallbackBlock:nil];

```
### Save to photo album
```
[HJImagesToGIF saveGIFToPhotoAlbumFromImages:images WithCallbackBlock:nil];

```
### Example Usage
```
    NSString *tempPath = [NSHomeDirectory() stringByAppendingPathComponent:
                          [NSString stringWithFormat:@"puppy.gif"]];
    
    NSArray * images = [NSArray arrayWithObjects:[UIImage imageNamed:@"frame1.png"],
                        [UIImage imageNamed:@"frame2.png"],
                        [UIImage imageNamed:@"frame3.png"],
                        [UIImage imageNamed:@"frame4.png"],
                        [UIImage imageNamed:@"frame5.png"],
                        [UIImage imageNamed:@"frame6.png"], nil];
    
    [HJImagesToGIF saveGIFFromImages:images toPath:tempPath WithCallbackBlock:^{
        NSLog(@"Saved to file!");
    }];
    
    [HJImagesToGIF saveGIFToPhotoAlbumFromImages:images WithCallbackBlock:^{
        NSLog(@"Saved to album!");
    }];

```
![alt text](https://raw.github.com/HarrisonJackson/HJImagesToGIF/master/hj_temp.gif "Animated GIF")
![alt text](https://raw.github.com/HarrisonJackson/HJImagesToGIF/master/frame1.png "Frame 1")
![alt text](https://raw.github.com/HarrisonJackson/HJImagesToGIF/master/frame2.png "Frame 1")
![alt text](https://raw.github.com/HarrisonJackson/HJImagesToGIF/master/frame3.png "Frame 1")
![alt text](https://raw.github.com/HarrisonJackson/HJImagesToGIF/master/frame4.png "Frame 1")
![alt text](https://raw.github.com/HarrisonJackson/HJImagesToGIF/master/frame5.png "Frame 1")
![alt text](https://raw.github.com/HarrisonJackson/HJImagesToGIF/master/frame6.png "Frame 1")

Copyright 2013 Harrison Jackson
http://harrisonjackson.us

Feel free to use however you want - if you make any improvements submit a pull request!

