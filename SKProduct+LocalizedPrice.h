//
//  SKProduct+LocalizedPrice.h
//  Utility
//
//  Created by Shaun Reynolds on 11/23/12.
//  Copyright (c) 2012 Shaun Reynolds. All rights reserved.
//

#import <StoreKit/StoreKit.h>

@interface SKProduct (LocalizedPrice)
@property(nonatomic, readonly) NSString *localizedPrice;
@end
