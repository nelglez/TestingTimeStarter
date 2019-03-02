//
//  TrialPeriod.swift
//  TestingTimeTDD
//
//  Created by Nelson Gonzalez on 3/2/19.
//  Copyright © 2019 Paul Solt. All rights reserved.
//

import Foundation

typealias Clock = () -> Date

class TrialPeriod {
    
    static let defaultDuration = 7
    
    var dateInstalled: Date
    var dateGenerator: Clock
    var durationInDays: Int
    var dateExpired: Date {
        return Calendar.current.date(byAdding: .day, value: TrialPeriod.defaultDuration, to: dateInstalled)!
    }
    
    
    
    init(dateGenerator: @escaping Clock = Date.init){
        self.dateInstalled = dateGenerator()//Generate a date installed
        self.dateGenerator = dateGenerator
        self.durationInDays = TrialPeriod.defaultDuration
    }
    
    func isExpired() -> Bool {
        let currentDate = dateGenerator()
        if currentDate >= dateExpired {
            return true
        }
        return false
    }
}
