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

typealias Clock = () -> Date

class TrialPeriod {
    var dateInstalled: Date
    var dateGenerator: Clock
    
    init(dateGenerator: @escaping Clock){
        self.dateInstalled = dateGenerator()//Generate a date installed
        self.dateGenerator = dateGenerator
    }
}


class TrialPeriodTests: XCTestCase {

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
    func testTrialPeriodToGetStarted() {
        //Arrange
        let expected = Date()
        let timeTravelor = TimeTraveler(date: expected)
        let trial = TrialPeriod(dateGenerator: timeTravelor.generateDate)

        //Act
        let actualDate = trial.dateInstalled
        
        //Assert
        XCTAssertEqual(expected, actualDate)
    }
}
