//
//  ABViewController.m
//  ABCalendarPickerDemo
//
//  Created by Антон Буков on 19.02.13.
//  Copyright (c) 2013 Anton Bukov. All rights reserved.
//

#import <EventKit/EventKit.h>
#import <ABCalendarPicker/ABCalendarPicker.h>
#import "ABViewController.h"

@interface ABCalendarPickerDefaultTeacherKitDaysProvider : ABCalendarPickerDefaultDaysProvider

@end


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
@end

@interface ABCalendarPickerDefaultTeacherKitWeekDaysProvider : ABCalendarPickerDefaultWeekdaysProvider

@end


@implementation ABCalendarPickerDefaultTeacherKitWeekDaysProvider
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
@end

@interface ABViewController () <ABCalendarPickerDelegateProtocol,ABCalendarPickerDataSourceProtocol>
@property (assign, nonatomic) IBOutlet ABCalendarPicker *calendarPicker;
@end

@implementation ABViewController


- (IBAction)todayTapped:(id)sender
{
    [self.calendarPicker setDate:[NSDate date] andState:ABCalendarPickerStateDays animated:YES];
}

#pragma mark - ABCalendarPicker delegate and dataSource

- (NSInteger)calendarPicker:(ABCalendarPicker*)calendarPicker
      numberOfEventsForDate:(NSDate*)date
                    onState:(ABCalendarPickerState)state
{
    if (state != ABCalendarPickerStateDays
        && state != ABCalendarPickerStateWeekdays)
    {
        return 0;
    }
    
    return 0;
}

- (void)calendarPicker:(ABCalendarPicker *)calendarPicker
          dateSelected:(NSDate *)date
             withState:(ABCalendarPickerState)state
{
    NSLog(@"%@",date);
}

#pragma mark -

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.calendarPicker.delegate = self;
    self.calendarPicker.dataSource = self;
    [self.calendarPicker setDaysProvider:[[ABCalendarPickerDefaultTeacherKitDaysProvider alloc]init]];
    [self.calendarPicker setWeekdaysProvider:[[ABCalendarPickerDefaultTeacherKitWeekDaysProvider alloc] init]];
    self.calendarPicker.calendar.firstWeekday = 1;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
