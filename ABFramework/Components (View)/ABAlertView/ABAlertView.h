//
//  ABAlertView.h
//  ABFramework
//
//  Created by Alexander Blunck on 11/11/12.
//  Copyright (c) 2012 Ablfx. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ABAlertView : UIAlertView <UIAlertViewDelegate>

//Utility
+(id) showAlertWithTitle:(NSString *)title
                 message:(NSString *)message
                   block:( void (^) (NSInteger selectedIndex) )block
       cancelButtonTitle:(NSString *)cancelButtonTitle
       otherButtonTitles:(NSString *)otherButtonTitles, ... NS_REQUIRES_NIL_TERMINATION;



@end