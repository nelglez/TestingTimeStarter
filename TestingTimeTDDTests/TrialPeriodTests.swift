//
//  TrialPeriodTests.swift
//  TestingTimeTDDTests
//
//  Created by Paul Solt on 1/25/19.
//  Copyright © 2019 Paul Solt. All rights reserved.
//

import XCTest

// Test code in your main module when dynamically linking unit tests
//@testable import TestingTimeTDD


class TrialPeriodTests: XCTestCase {
    
    var date: Date!
    var timeTravelor: TimeTraveler!
    var trial: TrialPeriod!
    
    //This gets called before each individual test.
    override func setUp() {
        super.setUp()
        
        date = Date()
        timeTravelor = TimeTraveler(date: date)
        trial = TrialPeriod(dateGenerator: timeTravelor.generateDate)
    }

    // All test functions start with the word "test"

//    func testArrangeActAssert() {
//        // Arrange
//        let x = 20
//        let y = 40
//        let expected = 60
//
//        // Act
//        let actual = x + y
//
//        // Assert
//        XCTAssertEqual(expected, actual)
//    }
    
    //Make sure we can create a trial period
//    func testTrialPeriodToGetStarted() {
//        //Arrange
//        let expected = Date()
//        let timeTravelor = TimeTraveler(date: expected)
//        let trial = TrialPeriod(dateGenerator: timeTravelor.generateDate)
//
//        //Act
//        let actualDate = trial.dateInstalled
//
//        //Assert
//        XCTAssertEqual(expected, actualDate)
//    }
    
    
    func testTrialPeriodDateInstalledIsToday() {

        XCTAssertEqual(date, trial.dateInstalled)
    }
    
    
    //Testing the duration in days it should be 7 days
    
    func testTrialPeriodDefaultDurationIs7Days() {
       
        XCTAssertEqual(7, trial.durationInDays)
    }
    
    func testTrialPeriodDateExpiredIs7DaysAfterInsalledDate() {
        
        let expected = Calendar.current.date(byAdding: .day, value: 7, to: date)
        XCTAssertEqual(expected, trial.dateExpired)
        
    }
    
    func testTrialPeriodIsNotExpiredOnStart() {
        XCTAssertFalse(trial.isExpired())
    }
    
    func testTrialPeriodExpiredAfter7Days() {
        timeTravelor.timeTravelBy(days: 7)
       XCTAssertTrue(trial.isExpired())
    }
    
}
