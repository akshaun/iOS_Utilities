//
//  UIView+iOSUtilities.h
//  Utilities
//
//  Created by Shaun Reynolds on 5/26/13.
//  Copyright (c) 2013 Shaun Reynolds. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (iOSUtilities)

// lines of code like this can create frames that are not aligned to points....
// CGRect f = CGRectMake(0, 0, superview.bounds.size.height / 2.0, superview.bounds.size.width / 2.0);
//
// Half points are ok on retina devices, but on non retina devices we end up with blurry views.
// This method adjusts a frame (rounds down) to ensure no blurryness.
+ (CGRect)alignFrameToPixels:(CGRect)frame;
- (CGRect)frameAlignedToPixels;

@end
