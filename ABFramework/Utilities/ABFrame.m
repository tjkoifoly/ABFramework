//
//  ABFrame.m
//  ABFramework
//
//  Created by Alexander Blunck on 1/12/13.
//  Copyright (c) 2013 Ablfx. All rights reserved.
//

#import "ABFrame.h"

@implementation ABFrame

#pragma mark - CGRect
//CGRect for one CGRect centered in another
CGRect CGRectCenteredInCGRect (CGRect rect, CGRect rectToCenterIn) {
    return CGRectChangingOrigin(rect,
                                (rectToCenterIn.size.width-rect.size.width)/2,
                                (rectToCenterIn.size.height-rect.size.height)/2
                                );
}

//CGRect for one CGRect centered horizontally in another
CGRect CGRectCenteredHorizontally(CGRect rect, CGRect rectToCenterIn, CGFloat originY) {
    return CGRectChangingOrigin(rect,
                                (rectToCenterIn.size.width-rect.size.width)/2,
                                originY
                                );
}

//CGRect for one CGRect centered vertically in another
CGRect CGRectCenteredVertically(CGRect rect, CGRect rectToCenterIn, CGFloat originX) {
    return CGRectChangingOrigin(rect,
                                originX,
                                (rectToCenterIn.size.height-rect.size.height)/2
                                );
}

//Adjust only Origin values of a CGRect
CGRect CGRectChangingOrigin (CGRect rect, CGFloat originX, CGFloat originY) {
    return CGRectMake(originX, originY, rect.size.width, rect.size.height);
}

//Adjust only X Origin value of a CGRect
CGRect CGRectChangingOriginX (CGRect rect, CGFloat originX) {
    return CGRectChangingOrigin(rect, originX, rect.origin.y);
}

//Adjust only X Origin value of a CGRect
CGRect CGRectChangingOriginY (CGRect rect, CGFloat originY) {
    return CGRectChangingOrigin(rect, rect.origin.x, originY);
}


//Adjust only Size values of a CGRect
CGRect CGRectChangingSize (CGRect rect, CGFloat sizeWidth, CGFloat sizeHeight) {
    return CGRectMake(rect.origin.x, rect.origin.y, sizeWidth, sizeHeight);
}

//Adjust only Size values of a CGRect with a CGSize
CGRect CGRectChangingCGSize(CGRect rect, CGSize size) {
    return CGRectChangingSize(rect, size.width, size.height);
}

//Adjust only Width Size value of a CGRect
CGRect CGRectChangingSizeWidth (CGRect rect, CGFloat sizeWidth) {
    return CGRectChangingSize(rect, sizeWidth, rect.size.height);
}

//Adjust only Height Size value of a CGRect
CGRect CGRectChangingSizeHeight (CGRect rect, CGFloat sizeHeight) {
    return CGRectChangingSize(rect, rect.size.width, sizeHeight);
}



//Offset only Origin values of a CGRect
CGRect CGRectOffsetOrigin (CGRect rect, CGFloat originXBy, CGFloat originYBy)
{
    return CGRectChangingOrigin(rect, rect.origin.x+originXBy, rect.origin.y+originYBy);
}

//Offset only X Origin of a CGRect
CGRect CGRectOffsetOriginX (CGRect rect, CGFloat originXBy)
{
    return CGRectOffsetOrigin(rect, originXBy, 0);
}

//Offset only Y Origin of a CGRect
CGRect CGRectOffsetOriginY (CGRect rect, CGFloat originYBy)
{
    return CGRectOffsetOrigin(rect, 0, originYBy);
}



//Offset only Size values of a CGRect
CGRect CGRectOffsetSize (CGRect rect, CGFloat sizeWidthBy, CGFloat sizeHeightBy)
{
    return CGRectChangingSize(rect, rect.size.width+sizeWidthBy, rect.size.height+sizeHeightBy);
}

//Offset only Width Size of a CGRect
CGRect CGRectOffsetSizeWidth (CGRect rect, CGFloat sizeWidthBy)
{
    return CGRectOffsetSize(rect, sizeWidthBy, 0);
}

//Offset only Height Size of a CGRect
CGRect CGRectOffsetSizeHeight (CGRect rect, CGFloat sizeHeightBy)
{
    return CGRectOffsetSize(rect, 0, sizeHeightBy);
}



//Returns zeroed CGRect for an imageName (located in bundle)
+(CGRect) frameForImageName:(NSString*)imageName
{
    UIImage *image = [UIImage imageNamed:imageName];
    return CGRectMake(0, 0, image.size.width, image.size.height);
}

@end
