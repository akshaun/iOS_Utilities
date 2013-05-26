//
//  StackTracer.h
//  Utilities
//
//  Created by Shaun Reynolds on 5/17/13.
//  Copyright (c) 2013 Shaun Reynolds. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StackTracer : NSObject

+ (StackTracer *)sharedInstance;
- (void)log:(NSString*)commentOrNil;
- (void)clear;
- (void)runTest;

@end
