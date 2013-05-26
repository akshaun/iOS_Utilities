//
//  StackTracerFrame.h
//  Utilities
//
//  Created by Shaun Reynolds on 5/26/13.
//  Copyright (c) 2013 Shaun Reynolds. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StackTracerFrame : NSObject

@property (strong) NSString *frame;
@property (strong) NSMutableArray *comments;

- (id)initWithFrame:(NSString*)aFrame comment:(NSString*)aComment;
- (void)addComment:(NSString*)comment;

@end
