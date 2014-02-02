//
//  CBXWindow.m
//  Rounded Content View
//
//  Created by Vahagn Mkrtchyan on 2/2/14.
//  Copyright (c) 2014 Cyberon. All rights reserved.
//
#define WINDOW_FRAME_PADDING 4

#import "CBXWindow.h"

@implementation CBXWindow

- (id)initWithContentRect:(NSRect)contentRect
                styleMask:(NSUInteger)windowStyle
                  backing:(NSBackingStoreType)bufferingType
                    defer:(BOOL)deferCreation
{
    self = [super
            initWithContentRect:contentRect
            styleMask:windowStyle | NSTexturedBackgroundWindowMask | NSTitledWindowMask
            backing:bufferingType
            defer:deferCreation];

    return self;
}

- (void)setContentSize:(NSSize)newSize
{
	NSSize sizeDelta = newSize;
	NSSize childBoundsSize = [childContentView bounds].size;
	sizeDelta.width -= childBoundsSize.width;
	sizeDelta.height -= childBoundsSize.height;
	
	NSView *frameView = [super contentView];
	NSSize newFrameSize = [frameView bounds].size;
	newFrameSize.width += sizeDelta.width;
	newFrameSize.height += sizeDelta.height;
	
	[super setContentSize:newFrameSize];
}

//
// setContentView:
//
- (void)setContentView:(NSView *)aView
{
	if ([childContentView isEqualTo:aView])
	{
		return;
	}
	
	NSRect bounds = [self frame];
	bounds.origin = NSZeroPoint;
    
	NSView *frameView = [super contentView];
	if (!frameView)
	{
		frameView = [[NSView alloc] initWithFrame:bounds];
		
		[super setContentView:frameView];
	}
	
	if (childContentView)
	{
		[childContentView removeFromSuperview];
	}
	childContentView = aView;
	[childContentView setFrame:[self contentRectForFrameRect:bounds]];
	[childContentView setAutoresizingMask:NSViewWidthSizable | NSViewHeightSizable];
	[frameView addSubview:childContentView];
}

//
// contentView
//
- (NSView *)contentView
{
	return childContentView;
}

//
// canBecomeKeyWindow
//
- (BOOL)canBecomeKeyWindow
{
	return YES;
}

//
// canBecomeMainWindow
//
- (BOOL)canBecomeMainWindow
{
	return YES;
}

//
// contentRectForFrameRect:
//
- (NSRect)contentRectForFrameRect:(NSRect)windowFrame
{
	windowFrame.origin = NSZeroPoint;
    NSRect frame = NSInsetRect(windowFrame, WINDOW_FRAME_PADDING, WINDOW_FRAME_PADDING);
    frame.size.height -= 24; // Makes the top margin a little bit bigger
	return frame;
}

//
// frameRectForContentRect:styleMask:
//

+ (NSRect)frameRectForContentRect:(NSRect)windowContentRect styleMask:(NSUInteger)windowStyle
{
    NSRect frame = NSInsetRect(windowContentRect, WINDOW_FRAME_PADDING, WINDOW_FRAME_PADDING);
    frame.size.height += 24;
    return NSInsetRect(windowContentRect, -WINDOW_FRAME_PADDING, -WINDOW_FRAME_PADDING);
}

@end
