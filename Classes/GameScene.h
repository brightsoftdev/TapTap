//
//  GameScene.h
//  TapTapRevolution
//
//  Created by Malaar on 18.06.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "XLayer.h"
#import "XButton.h"
#import "Level.h"


typedef enum GameMode
{
	modeNone,
	modeRelax,
	modeHighlighting
	
} GameMode;

@interface GameScene : XLayer <ButtonDelegate>
{
	NSMutableArray* buttons;
	NSMutableArray* levels;

	NSMutableArray* highlightedButtons;
	NSMutableArray* pressedButtons;

	int currentLevelIndex;
	Level* currentLevel;
	int correctTapCount;
	
	float currentTime;
	float relaxTime;
	
	GameMode gameMode;
	
	int pressedCount;
}

+ (id) scene;

@end
