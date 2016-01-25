//
//  Employee.m
//  TuiEx
//
//  Created by Chris Mitchelmore on 25/01/2016.
//  Copyright © 2016 Chris Mitchelmore. All rights reserved.
//

#import "Employee.h"

@implementation Employee

- (instancetype)initWithId:(NSString *)empId salary:(NSNumber *)salary age:(NSNumber *)age designation:(NSString *)designation rating:(NSNumber *)rating
{
    self = [super init];
    if (self) {
        _empId = empId;
        _salary = salary;
        _age = age;
        _designation = designation;
        _rating = rating;
    }
    return self;
}


+ (NSNumber *)averageSalarayForEmployees:(NSArray *)employees
{
//    NSInteger totalSalary = 0;
//    for (Employee *employee in employees) {
//        totalSalary += [employee.salary integerValue];
//
//    }
//    return @(totalSalary/employees.count);
    return [employees valueForKeyPath:@"@avg.salary"];
}

+ (NSNumber *)minimumAgeForEmployees:(NSArray *)employees
{
    NSInteger minimumAge = [((Employee*)employees.firstObject).age integerValue];
    for (Employee *employee in employees) {
        minimumAge = MIN(minimumAge, [employee.age integerValue]);
        
    }
    return @(minimumAge);
}

+ (NSNumber *)maximumRatingForEmployees:(NSArray *)employees
{
    NSInteger maximumRating = [((Employee*)employees.firstObject).rating integerValue];
    for (Employee *employee in employees) {
        maximumRating = MAX(maximumRating, [employee.rating integerValue]);
        
    }
    return @(maximumRating);
}
@end
