//
//  StackTracer.m
//  Utilities
//
//  Created by Shaun Reynolds on 5/17/13.
//  Copyright (c) 2013 Shaun Reynolds. All rights reserved.
//

#import "StackTracer.h"

@interface StackTracer ()
@property(strong) NSArray *lastTrace;
@property(strong) NSRegularExpression *regex;
@end

@implementation StackTracer

#pragma mark - Singleton Pattern

+ (StackTracer *)sharedInstance
{
    static dispatch_once_t once;
    static StackTracer *sharedManager;
    dispatch_once(&once, ^{ sharedManager = [[StackTracer alloc] init]; });
    return sharedManager;
}

- (id)init {
    self = [super init];
    if(self) {
        NSError *error = nil;
        self.regex = [NSRegularExpression regularExpressionWithPattern:@"([0-9]*)\\s*(\\S*)\\s*0x\\S* _*[0-9]*-?(\\[?.*\\]?).* \\+ "
                                                               options:0
                                                                 error:&error];
        if(error)
            NSLog(@"Regex fail: %@", error);
    }
    return self;
}

- (void)clear {
    self.lastTrace = nil;
}

- (NSArray*)cleanedStack:(NSArray*)stack addingComment:(NSString*)comment {
    // flip the indexes and remove non-ultralingua stack frames
    NSMutableArray *mutableStack = [[NSMutableArray alloc] init];
    NSString *processName = [[NSProcessInfo processInfo] processName]; // used to screen out stack frames that aren't our code.
    for(int i = stack.count - 3; i > 0; --i) { // chops off "start" and "main" and also "[StackTracer log]" at the other end
        NSString *frame = [stack objectAtIndex:i];
        if([frame rangeOfString:processName].location != NSNotFound) {
            NSTextCheckingResult *result = [self.regex firstMatchInString:frame
                                                                  options:0
                                                                    range:NSMakeRange(0, frame.length)];
            
            NSString *methodName = nil;
            if(result == nil) {
                NSLog(@"regex failed to match: %@", frame);
                methodName = @"failed_to_grab_method_name";
            } else {
                //        NSRange frameIndexRange = [result rangeAtIndex:1];
                //        NSRange frameworkRange = [result rangeAtIndex:2];
                NSRange methodRange = [result rangeAtIndex:3];
                methodName = [frame substringWithRange:methodRange];
            }
            
            [mutableStack addObject:methodName];
        }
    }
    if(comment) {
        NSString *lastFrame = [mutableStack lastObject];
        [mutableStack removeLastObject];
        lastFrame = [NSString stringWithFormat:@"%@\t%@", lastFrame, comment];
        [mutableStack addObject:lastFrame];
    }
    return mutableStack;
}

- (NSInteger)firstDifferentIndexStackOne:(NSArray*)stackOne stackTwo:(NSArray*)stackTwo {
    NSInteger limit = MIN(stackOne.count, stackTwo.count);
    for(NSInteger i = 0; i < limit; ++i) {
        if(![[stackOne objectAtIndex:i] isEqualToString:[stackTwo objectAtIndex:i]])
            return i;
    }
    
    return limit;
}

- (void)log:(NSString*)commentOrNil {
    NSArray *fullStack = [NSThread callStackSymbols];
    NSArray *stack = [self cleanedStack:fullStack addingComment:commentOrNil];
    //NSLog(@"%@", stack);
    
    NSInteger firstDifferentIndex = [self firstDifferentIndexStackOne:stack stackTwo:self.lastTrace];
    
    // special case where we log the same stack twice in a row.
    // log the last frame a second time
    if(firstDifferentIndex == stack.count) {
        firstDifferentIndex--;
    }
    
    NSMutableString *indent = [[NSMutableString alloc] init];
    for(NSInteger i = 0; i < firstDifferentIndex; ++i) {
        [indent appendString:@"|\t"];
    }
    
    for(NSInteger i = firstDifferentIndex; i < stack.count; ++i) {
        NSString *frame = [stack objectAtIndex:i];
        NSLog(@"%@%@", indent, frame);
        [indent appendString:@"|\t"];
    }
    
    self.lastTrace = stack;
}

#pragma mark test methods

- (void)runTest {
    [self log:@"run"];
    [self one];
    [self two];
    [self one];
    [self log:@"same frame"];
}

- (void)one {
    [self log:nil];
    [self two];
    [self three];
}

- (void)two {
    [self log:nil];
    [self three];
    [self three];
}

- (void)three {
    [self log:@"test!"];
}

@end
