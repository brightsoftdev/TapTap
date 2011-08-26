//
//  CocoaExtentions.h
//  ROM
//
//  Created by Malaar on 7/11/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


//==============================================================================
//==============================================================================
//==============================================================================
@interface UINavigationBar (Extention)

- (void) drawRect:(CGRect)rect;

@end

//==============================================================================
//==============================================================================
//==============================================================================
@interface UIColor (Extention)

+ (UIColor *)colorWithRedI:(NSInteger)red greenI:(NSInteger)green blueI:(NSInteger)blue alphaI:(NSInteger)alpha;

@end

//==============================================================================
//==============================================================================
//==============================================================================
@interface UIView (Extention)

- (UIViewController *) firstAvailableUIViewController;
- (id) traverseResponderChainForUIViewController;

@end

//==============================================================================
//==============================================================================
//==============================================================================