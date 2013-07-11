//
//  CountyScene.m
//
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//
//  Created by Martin Rehder on 06.05.13.
//

//http://www.cocos2d-iphone.org/forums/topic/table-view/page/6/

#import "CountyScene.h"
#import "SimpleAudioEngine.h"
#import "SWTableViewCell.h"
#import "AppDelegate.h"

@implementation CountyScene

+(id) scene
{
    CCScene *scene = [CCScene node];
	CountyScene *layer = [CountyScene node];
	[scene addChild: layer];
	return scene;
}

-(id) init
{
    if (( self = [super init]))
    {
        
        printf("county scene loading\n");
        
        CGSize size = [[CCDirector sharedDirector] winSize];
        
        CCSprite *mainBack = [CCSprite spriteWithFile:@"county_menu_bg.pvr.gz"];
        mainBack.anchorPoint = ccp(0.5,1.0);
        mainBack.position = ccp(size.width*.5,size.height);
        [self addChild:mainBack z:0];

        exampleTable = [[ExampleTable alloc] init];

        CGSize tSize = CGSizeMake(230, 230);
        myTable = [SWTableView viewWithDataSource:exampleTable size:tSize];
        myTable.position = ccp(45, 45);
        //myTable.delegate = self; //set if you need touch detection on cells.
        myTable.verticalFillOrder = SWTableViewFillTopDown;
        myTable.direction = SWScrollViewDirectionVertical;
        [myTable reloadData];
        [self addChild:myTable];
                
        CCSprite *aSmall = [CCSprite spriteWithFile:@"home_button.pvr.gz"];
        aSmall.color = ccGRAY;
        
        CCMenuItemSprite *itemA = [CCMenuItemSprite itemWithNormalSprite:[CCSprite spriteWithFile:@"home_button.pvr.gz"]
                                                          selectedSprite:aSmall
                                                                  target:self
                                                                selector:@selector(closeAction:)];
        
        CCMenu  *menuA = [CCMenu menuWithItems:itemA, nil];
        [menuA setPosition:ccp(size.width-29,size.height-28)];
        [self addChild:menuA z:70];

        printf("got here\n");
    }
    return self;
}

- (void) closeAction: (id)sender
{
    //myTable.delegate = nil;

    AppController *delegate  = (AppController*) [[UIApplication sharedApplication] delegate];
    
    //if (![appDelegate muted]) {
    [[SimpleAudioEngine sharedEngine] playEffect:@"click2.caf"];
    //}
    
    [delegate setScreenToggle:INTRO];
    
    [delegate replaceTheScene];
}

-(void) drawRect:(CGPoint)fPoint toPoint:(CGPoint)tPoint width:(int)width color:(ccColor4B)bc
{
    glLineWidth(width);
    ccDrawColor4B(bc.r, bc.g, bc.b, bc.a);
    ccDrawRect(fPoint, tPoint);
}

//touch detection here
-(void)table:(SWTableView *)table cellTouched:(SWTableViewCell *)cell
{
    NSLog(@"Cell touched at index %d",cell.idx);
    
    [[SimpleAudioEngine sharedEngine] playEffect:@"click2.caf"];

    //cellTouched = cell;
    
    CCLabelBMFont *label = (CCLabelBMFont*)[cell getChildByTag:123];
    
    label.color = ccc3(170, 170, 170);
    
    AppController *delegate  = (AppController*) [[UIApplication sharedApplication] delegate];

    //[delegate setSelectedCounty:label.string];

    [self schedule:@selector(buttonPressed:) interval:0.1];
    
}

- (void) buttonPressed: (id) sender
{
    [self unschedule:@selector(buttonPressed:)];

    //CCLabelBMFont *label = (CCLabelBMFont*)[cellTouched getChildByTag:123];
    
    //label.color = ccWHITE;
    
    //myTable.delegate = nil;
    
    //[cellTouched release];
    //cellTouched = nil;
    
    AppController *delegate  = (AppController*) [[UIApplication sharedApplication] delegate];

    [delegate setScreenToggle:INTRO];
    
    [delegate replaceTheScene];
    
}
    
     
-(void) draw
{
    /*
    CGSize size = CC_SIZE_POINTS_TO_PIXELS(myTable.boundingBox.size);
    ccColor4B col = ccc4(0, 0, 0, 255);
    CGPoint origin = CC_POINT_POINTS_TO_PIXELS(myTable.boundingBox.origin);
    [self drawRect:origin toPoint:ccpAdd(origin, ccp(size.width, size.height)) width:2 color:col];
     */
}

- (void)dealloc {
	
	NSLog(@"releasing CountyNode elements");
	
    [self unscheduleAllSelectors];
    
    [exampleTable release];

    myTable.delegate = nil;
    [self removeChild:myTable];
    
    [self removeAllChildrenWithCleanup:YES];
    
    [[CCDirector sharedDirector] purgeCachedData];
    
    [CCSpriteFrameCache purgeSharedSpriteFrameCache];
    [CCTextureCache purgeSharedTextureCache];
    
    [[CCSpriteFrameCache sharedSpriteFrameCache] removeSpriteFrames];
    [[CCTextureCache sharedTextureCache] removeAllTextures];
    
    [super dealloc];
}

@end
