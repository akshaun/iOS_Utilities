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

- (CGRect)frameAlignedToPixels {
    CGRect f = self.frame;
    if(IS_RETINA()) {
        // half points are ok
        f.origin.x = floorf(f.origin.x * 2) / 2.0f;
        f.origin.y = floorf(f.origin.y * 2) / 2.0f;
        f.size.width = floorf(f.size.width * 2) / 2.0f;
        f.size.height = floorf(f.size.height * 2) / 2.0f;
    } else {
        // points == pixels, round everything off
        f.origin.x = floorf(f.origin.x);
        f.origin.y = floorf(f.origin.y);
        f.size.width = floorf(f.size.width);
        f.size.height = floorf(f.size.height);
    }
    return f;
}

@end
