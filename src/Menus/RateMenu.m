//
//  RateScreen.m
//  TapTapRevolution
//
//  Created by Yuriy Bosov on 8/25/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "RateMenu.h"
#import "XSimpleSkinManager.h"
#import "XWebView.h"
#import "SHKFacebook.h"
#import "SHKTwitter.h"

//==============================================================================
//==============================================================================
//==============================================================================
@interface RateMenu (Private)

- (void) backButtonPressed;
- (void) rateButtonPressed;
- (void) faceBookButtonPressed;
- (void) twitterButtonPressed;

@end

//==============================================================================
//==============================================================================
//==============================================================================
@implementation RateMenu

+ (id) scene
{
    CCScene* scene = [CCScene node];
	XLayer* layer = [RateMenu node];
	[scene addChild:layer];
	return scene;
}

//==============================================================================
- (void) loadResources
{
	XSimpleSkinManager* skinManager = [XSimpleSkinManager sharedSimpleSkinManager];
	NSString* resource = [skinManager pathToCurrentSkin:@"UI/RateMenuUI_0"];
	[[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:[resource stringByAppendingPathExtension:@"plist"]
															 textureFile:[resource stringByAppendingPathExtension:@"png"]];
}

//==============================================================================
- (void) configureChilds
{
	// bg
	CCSprite* bg = [CCSprite spriteWithSpriteFrameName:@"RateMenuBg.png"];
	[self addChild:bg z:0];
	bg.anchorPoint = ccp(0.0f,0.0f);
}

//==============================================================================
- (void) configureMenu
{
    CCSprite* normalSprite;
	CCSprite* selectedSprite;
	CCLabelBMFont* lbCaption;
    
	// back
	normalSprite = [CCSprite spriteWithSpriteFrameName:@"ButtonNormal.png"];
	selectedSprite = [CCSprite spriteWithSpriteFrameName:@"ButtonPressed.png"];
	XMenuButton* btBack = [XMenuButton itemFromNormalSprite:normalSprite
											 selectedSprite:selectedSprite
													 target:self
												   selector:@selector(backButtonPressed)];
	btBack.position = ccp(-100, -30);
	lbCaption = [CCLabelBMFont labelWithString:@"Back" fntFile:@"assets/Fonts/button_font.fnt"];
	[btBack setCaption:lbCaption];
    
	// btOptions
	normalSprite = [CCSprite spriteWithSpriteFrameName:@"ButtonNormal.png"];
	selectedSprite = [CCSprite spriteWithSpriteFrameName:@"ButtonPressed.png"];
	XMenuButton* btRate = [XMenuButton itemFromNormalSprite:normalSprite
												selectedSprite:selectedSprite
												  	    target:self
													  selector:@selector(rateButtonPressed)];
	btRate.position = ccp(100, -30);
	lbCaption = [CCLabelBMFont labelWithString:@"Rate" fntFile:@"assets/Fonts/button_font.fnt"];
	[btRate setCaption:lbCaption];
    
    
    lbCaption = [CCLabelBMFont labelWithString:@"Bla-Bla-Bla-Bla-Bla" fntFile:@"assets/Fonts/button_font.fnt"];
    
    // Label
    CCMenuItemLabel *lbMenu = [CCMenuItemLabel itemWithLabel:lbCaption target:nil selector:nil];
    lbMenu.position = ccp(0, 30);
    
	XMenuButton* faceBookButton = [XMenuButton itemFromNormalSprite:[CCSprite spriteWithSpriteFrameName:@"facebookButtonNormal.png"]
                                                     selectedSprite:[CCSprite spriteWithSpriteFrameName:@"facebookButtonPressed.png"]
                                                             target:self
                                                           selector:@selector(faceBookButtonPressed)];
	faceBookButton.position = ccp(-200, 130);
    
	XMenuButton* twitterButton = [XMenuButton itemFromNormalSprite:[CCSprite spriteWithSpriteFrameName:@"twitterButtonNormal.png"]
                                                    selectedSprite:[CCSprite spriteWithSpriteFrameName:@"twitterButtonPressed.png"]
                                                            target:self
                                                          selector:@selector(twitterButtonPressed)];
	twitterButton.position = ccp(-200, 90);
    
    
    // menu
	CCMenu* menu = [CCMenu menuWithItems: lbMenu, btBack, btRate, faceBookButton, twitterButton, nil];
	[self addChild:menu];

}

//==============================================================================
- (void) backButtonPressed
{
    [[CCDirector sharedDirector] popScene];
}

//==============================================================================
- (void) rateButtonPressed
{
    //XWebView* webView = [[XWebView alloc] initWithFrame:CGRectMake(0, 0, 480, 320)];
    //[webView loadUrlByString:@"http://www.cocos2d-iphone.org/"];
    
    XWebView* webView = [[[XWebView alloc] initWithURLString:@"http://www.cocos2d-iphone.org/"] autorelease];
    
    [[[CCDirector sharedDirector] openGLView] addSubview:webView];
    [[[CCDirector sharedDirector] openGLView] setMultipleTouchEnabled:YES];
}

//==============================================================================
- (void) faceBookButtonPressed
{
    SHKItem* textItem = [SHKItem text: @"Test sharing"];
    //[[SHKFacebook alloc]ini shareItem:textItem];
    
    SHKFacebook *face = [[SHKFacebook alloc] init];//[[UIApplication sharedApplication] delegate] window] ];
    face.item = textItem;
    [face share];
}
//==============================================================================
- (void) twitterButtonPressed
{
    SHKItem* textItem = [SHKItem text: @"Test sharing"];
    [SHKTwitter shareItem:textItem];
}

//==============================================================================
//==============================================================================
//==============================================================================
@end
