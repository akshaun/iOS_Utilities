//
//  macros.h
//  Utilities
//
//  Created by Shaun Reynolds on 5/26/13.
//  Copyright (c) 2013 Shaun Reynolds. All rights reserved.
//

static inline BOOL IS_RETINA() {
    return [[UIScreen mainScreen] respondsToSelector:@selector(scale)] && [[UIScreen mainScreen] scale] == 2;
}

static inline BOOL IS_PAD() {
    return [[UIDevice currentDevice] respondsToSelector:@selector(userInterfaceIdiom)] && [[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad;
}

static inline BOOL IS_PHONE() {
    return [[UIDevice currentDevice] respondsToSelector:@selector(userInterfaceIdiom)] && [[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone;
}

#define ABSTRACT_BASE [NSException raise:@"Abstract Base Method" format:@"%@ must be overridden by %@", NSStringFromSelector(_cmd), NSStringFromClass([self class])]