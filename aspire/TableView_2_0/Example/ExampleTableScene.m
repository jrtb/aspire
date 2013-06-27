//
//  ExampleTableScene.m
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

#import "ExampleTableScene.h"


@implementation ExampleTableScene

+(id) scene
{
    CCScene *scene = [CCScene node];
	ExampleTableScene *layer = [ExampleTableScene node];
	[scene addChild: layer];
	return scene;
}

-(id) init
{
    if (( self = [super init]))
    {
        CGSize size = [[CCDirector sharedDirector] winSize];
        
        exampleTable = [[ExampleTable alloc] init];

        CGSize tSize = CGSizeMake(160, 150);
        myTable = [SWTableView viewWithDataSource:exampleTable size:tSize];
        myTable.position = ccp(size.width/4 - tSize.width/2, size.height/2 - tSize.height/2);
        myTable.delegate = exampleTable; //set if you need touch detection on cells.
        myTable.verticalFillOrder = SWTableViewFillTopDown;
        myTable.direction = SWScrollViewDirectionVertical;
        [myTable reloadData];
        [self addChild:myTable];
        
        
        CGSize mSize = CGSizeMake(320, 150);
        myMultiTable = [SWMultiColumnTableView viewWithDataSource:exampleTable size:mSize];
        myMultiTable.position = ccp(size.width/1.25f - mSize.width/2, size.height/2 - mSize.height/2);
        myMultiTable.delegate = exampleTable; //set if you need touch detection on cells.
        myMultiTable.verticalFillOrder = SWTableViewFillTopDown;
        myMultiTable.direction = SWScrollViewDirectionVertical;
        [myMultiTable reloadData];
        [self addChild:myMultiTable];
    }
    return self;
}

-(void) drawRect:(CGPoint)fPoint toPoint:(CGPoint)tPoint width:(int)width color:(ccColor4B)bc
{
    glLineWidth(width);
    ccDrawColor4B(bc.r, bc.g, bc.b, bc.a);
    ccDrawRect(fPoint, tPoint);
}

-(void) draw
{
    CGSize size = CC_SIZE_POINTS_TO_PIXELS(myTable.boundingBox.size);
    ccColor4B col = ccc4(220, 20, 20, 255);
    CGPoint origin = CC_POINT_POINTS_TO_PIXELS(myTable.boundingBox.origin);
    [self drawRect:origin toPoint:ccpAdd(origin, ccp(size.width, size.height)) width:2 color:col];


    CGSize msize = CC_SIZE_POINTS_TO_PIXELS(myMultiTable.boundingBox.size);
    ccColor4B mcol = ccc4(20, 20, 220, 255);
    CGPoint morigin = CC_POINT_POINTS_TO_PIXELS(myMultiTable.boundingBox.origin);
    [self drawRect:morigin toPoint:ccpAdd(morigin, ccp(msize.width, msize.height)) width:2 color:mcol];
}

@end
