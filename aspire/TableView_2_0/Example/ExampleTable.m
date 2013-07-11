//
//  ExampleTableView.m
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

#import "ExampleTable.h"
#import "ExampleCell.h"
#import "SimpleAudioEngine.h"
#import "cocos2d.h"

@implementation ExampleTable

//provide data to your table
//telling cell size to the table
-(Class)cellClassForTable:(SWTableView *)table {
    return [ExampleCell class];
}

-(CGSize)cellSizeForTable:(SWTableView *)table
{
    return [ExampleCell cellSize];
}

//providing CCNode object for a cell at a given index
-(SWTableViewCell *)table:(SWTableView *)table cellAtIndex:(NSUInteger)idx {
    SWTableViewCell *cell;
    cell = [table dequeueCell];
    
    /*
     
    //configure the sprite.. do all kinds of super cool things you can do with cocos2d.
    CCSprite *temp = [CCSprite node];
    
    CGSize size = [ExampleCell cellSize];
    
    CCSprite *mainBack = [CCSprite spriteWithFile:@"county_menu_cellbg.pvr.gz"];
    mainBack.anchorPoint = ccp(0.5,0.5);
    mainBack.position = ccp(size.width*.5,size.height*.5);
    [temp addChild:mainBack z:0];
    
    NSString *cellString;// = [NSString stringWithFormat:@"Cell %d", idx];
        
    switch (idx) {
        case 0:
            cellString = @"Alexander";
            break;
        case 1:
            cellString = @"Ashe";
            break;
        case 2:
            cellString = @"Burke";
            break;
        case 3:
            cellString = @"Catawba";
            break;
        case 4:
            cellString = @"Camden";
            break;
        case 5:
            cellString = @"Cherokee";
            break;
        case 6:
            cellString = @"Chowan";
            break;
        case 7:
            cellString = @"Davidson";
            break;
        case 8:
            cellString = @"Davie";
            break;
        case 9:
            cellString = @"Haywood";
            break;
        case 10:
            cellString = @"Hertford";
            break;
        case 11:
            cellString = @"Johnston";
            break;
        case 12:
            cellString = @"Lincoln";
            break;
        case 13:
            cellString = @"Madison";
            break;
        case 14:
            cellString = @"Mitchell";
            break;
        case 15:
            cellString = @"Montgomery";
            break;
        case 16:
            cellString = @"Northampton";
            break;
        case 17:
            cellString = @"Pasquotank";
            break;
        case 18:
            cellString = @"Person";
            break;
        case 19:
            cellString = @"Pitt";
            break;
        case 20:
            cellString = @"Robeson";
            break;
        case 21:
            cellString = @"Rowan";
            break;
        case 22:
            cellString = @"Rutherford";
            break;
        case 23:
            cellString = @"Sampson";
            break;
        case 24:
            cellString = @"Stanly";
            break;
        case 25:
            cellString = @"Union";
            break;
        case 26:
            cellString = @"Warren";
            break;
        case 27:
            cellString = @"Wayne";
            break;
        case 28:
            cellString = @"Wilson";
            break;
    }
        
    temp.anchorPoint = CGPointZero;
    
     */
    
    if (!cell)
    { //there is no recycled cells in the table
        cell = [[ExampleCell new] autorelease]; // create a new one
        cell.anchorPoint = CGPointZero;
    } else {
        [cell removeAllChildrenWithCleanup:YES];
    }

    /*
    [cell addChild:temp z:0 tag:-2];
    
    CCLabelBMFont *label = [CCLabelBMFont labelWithString:cellString fntFile:@"county-menu-24.fnt"];
    label.anchorPoint = ccp(0.5,0.5);
    label.position = ccp(size.width/2, size.height/2);
    label.tag = 123;
    [cell addChild:label];
     
     */
    
    return cell;
}
-(NSUInteger)numberOfCellsInTableView:(SWTableView *)table {
    //return a number
    return 29;
}

-(void)table:(SWTableView *)table cellTouched:(SWTableViewCell *)cell
{
}

@end
