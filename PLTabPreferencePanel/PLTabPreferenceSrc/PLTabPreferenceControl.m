//
//  PLTabPreferenceControl.m
//  PLTabPreferencePanel
//
//  Created by xhan on 3/23/11.
//  Copyright 2011 Baidu.com. All rights reserved.
//

#import "PLTabPreferenceControl.h"


@implementation PLTabPreferenceControl

- (id)initWithWindow:(NSWindow *)window
{
    self = [super initWithWindow:window];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

- (void)dealloc
{
    [super dealloc];
}

- (void)windowDidLoad
{
    [super windowDidLoad];
    NSLog(@"window loaded");
    // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
    
    //this method only will be called if window is loaded by it's nib file
}


- (void)awakeFromNib{
//    NSLog(@"awaked");
    
    [toolbar setDelegate:self];
    prefViews = [[NSArray alloc] initWithObjects:firstPanel,secondPanel,thirdPanel, nil];
}

/////////////////////////////////////////////
#pragma TabPreference methods
- (void)switchPanel:(id)sender
{
    NSView *viewToShow = [prefViews objectAtIndex:[sender tag]];
	NSWindow* theWin = [self window];
    
	if (viewToShow && ([theWin contentView] != viewToShow)) {
		
		[toolbar setSelectedItemIdentifier:[sender itemIdentifier]];
		
		NSRect newFrame = [theWin frameRectForContentRect:[viewToShow bounds]];
		NSRect oldFrame = [theWin frame];
		
		newFrame.origin = oldFrame.origin;
		newFrame.origin.y -= (newFrame.size.height - oldFrame.size.height);
		
		[theWin setContentView:viewToShow];
		[theWin setFrame:newFrame display:YES animate:YES];
        
		[theWin setTitle:[sender label]];
		
//		[ud setInteger:[sender tag] forKey:kUDKeySelectedPrefView];
	}
}


/////////////////////////////////////////////
#pragma toolbar delegates
- (NSArray *)toolbarAllowedItemIdentifiers:(NSToolbar *)toolbar
{
	return [NSArray arrayWithObjects:@"1",@"2",@"3",nil];
}

- (NSArray *)toolbarDefaultItemIdentifiers:(NSToolbar *)atoolbar
{
	return [self toolbarAllowedItemIdentifiers:toolbar];
}
- (NSArray *)toolbarSelectableItemIdentifiers:(NSToolbar *)atoolbar
{
	return [self toolbarAllowedItemIdentifiers:toolbar];
}

- (NSToolbarItem *)toolbar:(NSToolbar *)toolbar itemForItemIdentifier:(NSString *)itemIdentifier willBeInsertedIntoToolbar:(BOOL)flag
{
	NSToolbarItem *item = nil;
	
	if ([itemIdentifier isEqualToString:@"1"]) {
		item = [[NSToolbarItem alloc] initWithItemIdentifier:itemIdentifier];
		[item setLabel:@"1"];
		[item setImage:[NSImage imageNamed:NSImageNamePreferencesGeneral]];
		[item setTag:0];
		
	} else if ([itemIdentifier isEqualToString:@"2"]) {
		item = [[NSToolbarItem alloc] initWithItemIdentifier:itemIdentifier];
		[item setLabel:@"2"];
		[item setImage:[NSImage imageNamed:NSImageNameEveryone]];
		[item setTag:1];
		
	} else if ([itemIdentifier isEqualToString:@"3"]) {
		item = [[NSToolbarItem alloc] initWithItemIdentifier:itemIdentifier];
		[item setLabel:@"3"];
		[item setImage:[NSImage imageNamed:NSImageNameMobileMe]];
		[item setTag:2];
		
	} else {
		return nil;
	}
    
	[item setTarget:self];
	[item setAction:@selector(switchPanel:)];
	[item setAutovalidates:NO];
    
	return [item autorelease];
}


@end
