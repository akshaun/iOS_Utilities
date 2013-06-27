//
//  UIView+iOSUtilities.m
//  Utilities
//
//  Created by Shaun Reynolds on 5/26/13.
//  Copyright (c) 2013 Shaun Reynolds. All rights reserved.
//

#import "UIView+iOSUtilities.h"
#import "macros.h"

@implementation UIView (iOSUtilities)

+ (CGRect)alignFrameToPixels:(CGRect)frame {
    if(IS_RETINA()) {
        // half points are ok
        frame.origin.x = floorf(frame.origin.x * 2) / 2.0f;
        frame.origin.y = floorf(frame.origin.y * 2) / 2.0f;
        frame.size.width = floorf(frame.size.width * 2) / 2.0f;
        frame.size.height = floorf(frame.size.height * 2) / 2.0f;
    } else {
        // points == pixels, round everything off
        frame.origin.x = floorf(frame.origin.x);
        frame.origin.y = floorf(frame.origin.y);
        frame.size.width = floorf(frame.size.width);
        frame.size.height = floorf(frame.size.height);
    }
    return frame;
}

- (CGRect)frameAlignedToPixels {
    return [UIView alignFrameToPixels:self.frame];
}

@end
