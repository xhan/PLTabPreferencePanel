//
//  DataSourceDemo.h
//  PLTabPreferencePanel
//
//  Created by xhan on 3/23/11.
//  Copyright 2011 Baidu.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PLTabPreferenceControl.h"

@interface DataSourceDemo : NSObject<PLTabPreferenceDelegate> {
@private
    IBOutlet NSView *firstPanel;
    IBOutlet NSView *secondPanel;
    IBOutlet NSView *thirdPanel;
    
    NSArray* panelViews;
}

@end
