//
//  StackTracerFrame.m
//  Utilities
//
//  Created by Shaun Reynolds on 5/26/13.
//  Copyright (c) 2013 Shaun Reynolds. All rights reserved.
//

#import "StackTracerFrame.h"

@implementation StackTracerFrame

- (id)initWithFrame:(NSString*)aFrame comment:(NSString*)aComment {
    self = [super init];
    if(self) {
        self.frame = aFrame;
        if(aComment)
            [self addComment:aComment];
    }
    return self;
}

- (void)addComment:(NSString*)comment {
    if(!self.comments)
        self.comments = [[NSMutableArray alloc] init];
    
    [self.comments addObject:comment];
}

#pragma mark - Equality

- (NSUInteger)hash {
    return self.frame.hash;
}

- (BOOL)isEqual:(id)object {
    if(object == nil)
        return NO;
    
    if(![object isMemberOfClass:[self class]])
        return NO;
    
    StackTracerFrame *typedObject = object;
    
    return [typedObject.frame isEqualToString:self.frame];
}

@end
