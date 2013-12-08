//
//  ABCalendarPickerDefaultTeacherKitDaysProvider.m
//  ABCalendarPickerDemo
//
//  Created by Mourad on 12/8/13.
//  Copyright (c) 2013 Anton Bukov. All rights reserved.
//

#import "ABCalendarPickerDefaultTeacherKitDaysProvider.h"

@implementation ABCalendarPickerDefaultTeacherKitDaysProvider
- (NSString*)labelForDate:(NSDate*)date andColumn:(NSInteger)column
{
    NSUInteger day = [self.calendar ordinalityOfUnit:NSDayCalendarUnit inUnit:NSMonthCalendarUnit forDate:date];
    return [NSString stringWithFormat:@"%@\n%i", [self columnName:column], day, nil];
}
-(NSDate*)dateForLongPrevAnimation
{
    return nil;
}
-(NSDate*)dateForLongNextAnimation
{
    return nil;
}
-(BOOL)navigateBetweenMonthsAndWeeksOnly
{
    return YES;
}
@end
