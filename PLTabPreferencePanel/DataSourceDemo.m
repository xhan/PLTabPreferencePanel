//
//  DataSourceDemo.m
//  PLTabPreferencePanel
//
//  Created by xhan on 3/23/11.
//  Copyright 2011 Baidu.com. All rights reserved.
//

#import "DataSourceDemo.h"


@implementation DataSourceDemo

- (void)awakeFromNib{
    panelViews = [[NSArray alloc] initWithObjects:firstPanel,secondPanel,thirdPanel, nil];
}

- (int)countOfPreferencePanels
{
    return (int)[panelViews count];
}
- (NSString*)titleForPreferencePanelAt:(int)index
{
    switch (index) {
        case 0:
            return @"Default";
        case 1:
            return @"Middle";
        case 2:
            return @"Last Panel";
        default:
            return nil;
            break;
    }
}
- (NSImage*)imageForPreferencePanelAt:(int)index
{
    switch (index) {
        case 0:
            return [NSImage imageNamed:NSImageNameUser];
        case 1:
            return [NSImage imageNamed:NSImageNameMobileMe];
        case 2:
            return [NSImage imageNamed:NSImageNameAdvanced];
        default:
            return nil;
            break;
    }    
}
- (NSView*)panelViewForPreferencePanelAt:(int)index
{
    return [panelViews objectAtIndex:index];
}

@end
