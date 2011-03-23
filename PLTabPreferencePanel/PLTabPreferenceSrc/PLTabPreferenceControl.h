//
//  PLTabPreferenceControl.h
//  PLTabPreferencePanel
//
//  Created by xhan on 3/23/11.
//  Copyright 2011 Baidu.com. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface PLTabPreferenceControl : NSWindowController<NSToolbarDelegate> {
@private
    
    IBOutlet NSToolbar *toolbar;

    //preference panel views
    
    IBOutlet NSView *firstPanel;
    
    IBOutlet NSView *secondPanel;
    IBOutlet NSView *thirdPanel;
    
    NSArray* prefViews;
}

@end
