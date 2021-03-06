//
//  UIView+ABFramework.h
//  ABFramework
//
//  Created by Alexander Blunck on 2/13/13.
//  Copyright (c) 2013 Ablfx. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (ABFramework)

//Frame
-(CGFloat) right; //Returns X Point of the right edge of View
-(CGFloat) left; //Returns X Point of the left edge of View
-(CGFloat) top; //Returns Y Point of the top edge of View
-(CGFloat) bottom; //Returns Y Point of the bottom edge of View
-(CGFloat) width;
-(CGFloat) height;

//Visibility
-(void) toggleVisibility;
-(void) setVisible;
-(void) setInvisible;
-(void) setVisible:(BOOL)visible;
-(void) setInvisible:(BOOL)invisible;

//Recursion
-(void) enumerateAllSubviews:(void(^)(UIView *subview))block;

//Universal Access
+(UIView*) topWindowView;
+(UIView*) topView;

-(UIImage*) renderCGRect:(CGRect)frame;

@end
