//
//  ABCommon.h
//  ABFramework
//
//  Created by Alexander Blunck on 8/27/12.
//  Copyright (c) 2012 Ablfx. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ABCommon : NSObject

//NSNumber Fast Creation
NSNumber* NSNumberInteger(NSInteger aInteger);
NSNumber* NSNumberDouble(double aDouble);
NSNumber* NSNumberFloat(CGFloat aFloat);
NSNumber* NSNumberBOOL(BOOL aBoolean);

//Type Checking
BOOL isNSArray(id object);
BOOL isNSDictionary(id object);
BOOL isClassOfType(id object, Class aClass);

//Toggle
/**
 * Pass in the memory address of a boolean to change said boolean
 * E.g. toggleBoolean(&myBool);
 */
BOOL toggledBoolean(BOOL aBoolean);

@end