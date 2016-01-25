//
//  TuiExTests.m
//  TuiExTests
//
//  Created by Chris Mitchelmore on 25/01/2016.
//  Copyright © 2016 Chris Mitchelmore. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Employee.h"

@interface TuiExTests : XCTestCase

@end

@implementation TuiExTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testEmployeeInitializedCorrectly
{
    Employee *employee = [[Employee alloc] initWithId:@"1" salary:@(100) age:@(30) designation:@"First" rating:@(53)];
    
    XCTAssert([employee.empId isEqualToString:@"1"], @"Incorrect initialization");
    XCTAssert([employee.salary isEqualToNumber:@(100)], @"Incorrect initialization");
}

- (void)testEmployeeAverageSalaray
{
    Employee *employee = [[Employee alloc] initWithId:@"1" salary:@(100) age:@(30) designation:@"First" rating:@(53)];
    Employee *employee2 = [[Employee alloc] initWithId:@"1" salary:@(200) age:@(30) designation:@"First" rating:@(53)];
    
    NSNumber *averageSalary = [Employee averageSalarayForEmployees:@[employee, employee2]];
    XCTAssert([averageSalary isEqualToNumber:@(150)], @"Salaray average failed");
}


- (void)testEmployeeMinimumAge
{
    Employee *employee = [[Employee alloc] initWithId:@"1" salary:@(100) age:@(30) designation:@"First" rating:@(53)];
    Employee *employee2 = [[Employee alloc] initWithId:@"1" salary:@(200) age:@(30) designation:@"First" rating:@(53)];
    Employee *employee3 = [[Employee alloc] initWithId:@"1" salary:@(200) age:@(60) designation:@"First" rating:@(53)];
    
    NSNumber *minimumAge = [Employee minimumAgeForEmployees:@[employee, employee2, employee3]];
    XCTAssert([minimumAge isEqualToNumber:@(30)], @"Incorrect minimum age");
    
    minimumAge = [Employee minimumAgeForEmployees:@[employee3]];
    XCTAssert([minimumAge isEqualToNumber:@(60)], @"Incorrect minimum age");
}



- (void)testEmployeeMaxRating
{
    Employee *employee = [[Employee alloc] initWithId:@"1" salary:@(100) age:@(30) designation:@"First" rating:@(53)];
    Employee *employee2 = [[Employee alloc] initWithId:@"1" salary:@(200) age:@(30) designation:@"First" rating:@(100)];
    Employee *employee3 = [[Employee alloc] initWithId:@"1" salary:@(200) age:@(60) designation:@"First" rating:@(-3)];
    
    NSNumber *maximumRating = [Employee maximumRatingForEmployees:@[employee, employee2, employee3]];
    XCTAssert([maximumRating isEqualToNumber:@(100)], @"Incorrect max rating should be 100 is %@", maximumRating);
    
    maximumRating = [Employee maximumRatingForEmployees:@[employee3]];
    XCTAssert([maximumRating isEqualToNumber:@(-3)], @"Incorrect max rating should be -3 is %@", maximumRating);
}
@end
