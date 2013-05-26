//
//  StackTracer.h
//  Utilities
//
//  Created by Shaun Reynolds on 5/17/13.
//  Copyright (c) 2013 Shaun Reynolds. All rights reserved.
//

// This will match the part of NSLog you want to chop off (date, thread number, etc)
// "[0-9]{4}-[0-9]{2}-[0-9]{2} [0-9:]*\.[0-9]{1,4} [a-zA-Z]*\[.*\] "


#import <Foundation/Foundation.h>

@interface StackTracer : NSObject

@property(assign) BOOL shouldLogFrameworkFrames;

+ (StackTracer *)sharedInstance;
- (void)log:(NSString*)commentOrNil;
- (void)clear;
- (void)runTest;

@end
