//
//  Employee.h
//  TuiEx
//
//  Created by Chris Mitchelmore on 25/01/2016.
//  Copyright © 2016 Chris Mitchelmore. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Employee : NSObject


@property (nonatomic, copy, readonly) NSString *empId;
@property (nonatomic, strong, readonly) NSNumber *salary; // in £
@property (nonatomic, strong, readonly) NSNumber *age;
@property (nonatomic, copy, readonly) NSString *designation;
@property (nonatomic, strong, readonly) NSNumber *rating;

- (instancetype)initWithId:(NSString *)empId salary:(NSNumber *)salary age:(NSNumber *)age designation:(NSString *)designation rating:(NSNumber *)rating;

+ (NSNumber *)averageSalarayForEmployees:(NSArray *)employees;
+ (NSNumber *)minimumAgeForEmployees:(NSArray *)employees;
+ (NSNumber *)maximumRatingForEmployees:(NSArray *)employees;
@end
