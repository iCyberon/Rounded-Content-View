//
//  CBXContentView.m
//  Rounded Content View
//
//  Created by Vahagn Mkrtchyan on 2/2/14.
//  Copyright (c) 2014 Cyberon. All rights reserved.
//

#import "CBXContentView.h"

@implementation CBXContentView

- (id)initWithFrame:(NSRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code here.
    }
    return self;
}

- (void)drawRect:(NSRect)dirtyRect
{
	[super drawRect:dirtyRect];

    NSColor* color = [NSColor colorWithCalibratedRed: 0.502 green: 0.502 blue: 0.502 alpha: 1];
    NSBezierPath* roundedRectanglePath = [NSBezierPath bezierPathWithRoundedRect: dirtyRect xRadius: 4 yRadius: 4];
    [[NSColor whiteColor] setFill];
    [roundedRectanglePath fill];
    [color setStroke];
    [roundedRectanglePath setLineWidth: 1];
    [roundedRectanglePath stroke];
}

@end
