//
//  main.swift
//  SimpleDomainModel
//
//  Created by Xiaowen Feng on 4/18/16.
//  Copyright © 2016 Ted Neward. All rights reserved.
//

import Foundation


public func testMe() -> String {
    return "I have been tested"
}

public class TestMe {
    public func Please() -> String {
        return "I have been tested"
    }
}

// a description that returns a human-readable version of the objects
protocol CustomStringConvertible {
    var description: String { get }
    
}


////////////////////////////////////
// Money
//
public struct Money : CustomStringConvertible, Mathemmatics {
    public var amount : Double
    public var currency : String
    public var  description : String {
        return "\(currency)\(amount)"
    }
    
    let eRates = ["USD" : 1, "GBP" : 0.5, "EUR" : 1.5, "CAN" : 1.25]
    
    // initilize a new Money objext
    init (amount: Double, currency: String) {
        self.currency = currency
        self.amount = amount
    }
    
    // convert the money object to the given currency
    public func convert(to: String) -> Money {
        let rate = eRates[to]! / eRates[self.currency]!
        return Money(amount: rate * self.amount, currency: to)
        
    }
    
    public func add(to: Money) -> Money {
        if to.currency == self.currency {
            return Money(amount: to.amount + self.amount, currency: self.currency)
        } else {
            let m = self.convert(to.currency)
            return Money(amount: m.amount + to.amount, currency: to.currency)
        }
    }
    
    public func sub(from: Money) -> Money {
        if from.currency == self.currency {
            return Money(amount: from.amount - self.amount, currency: self.currency)
        } else {
            let m = from.convert(self.currency)
            return Money(amount: m.amount - self.amount, currency: self.currency)
        }
    }
    
}

// a mathematical operation protocol on Money object
protocol Mathemmatics {
    func add(to: Money) -> Money
    func sub(from: Money) -> Money
}

// add four new extension properties, USD, EUR, GBP, CAN
// returning a new Money object
extension Double {
    var USD : Money { return Money(amount: self, currency: "USD")}
    var EUR : Money { return Money(amount: self, currency: "EUR")}
    var GBP : Money { return Money(amount: self, currency: "GBP")}
    var CAN : Money { return Money(amount: self, currency: "CAN")}
}


////////////////////////////////////
// Job
//
public class Job :CustomStringConvertible {
    public var title : String
    public var type: JobType
    public var description: String {
        switch type {
        case let .Hourly(rate):
            return "Title: \(title), salary: \(rate) per hour"
        case let .Salary(amt):
            return "Title: \(title), salary: \(amt) per year"
        }
    }
    
    public enum JobType {
        case Hourly(Double)
        case Salary(Int)
    }
    
    public init(title : String, type : JobType) {
        self.title = title
        self.type = type
    }
    
    // caculate total income if the income is hourly, return the salary if it's annual
    public func calculateIncome(hours: Int) -> Int {
        switch type {
        case let .Hourly(rate):
            return Int(Double(hours) * rate)
        case let .Salary(amt):
            return amt
        }
    }
    
    // apply a raise of a given amount to the current salary
    public func raise(amt : Double) {
        switch type {
        case let .Hourly(rate): self.type = .Hourly(amt + rate)
        case let .Salary(total): self.type = .Salary(Int(amt) + total)
        }
    }
    
}


////////////////////////////////////
// Person
//
public class Person : CustomStringConvertible {
    public var firstName : String = ""
    public var lastName : String = ""
    public var age : Int = 0
    public var description: String {
        var str = "firstName:\(self.firstName) lastName:\(self.lastName) age:\(self.age)"
        
        if let job = self.job?.title {
            str += (" job:\(job)")
        }
        
        if let spouse = spouse {
            str += (" spouse:\(spouse.firstName) \(spouse.lastName)")
        }
        print(str)
        return str
    }
    
    // a person can have a job if he/she is over 16
    private var _job : Job?
    public var job : Job? {
        get { return _job}
        set(value) {
            if age >= 16 {
                _job = value!
            }
        }
    }
    
    // a person can have a spouse if he/she is over 21
    private var _spouse : Person?
    public var spouse : Person? {
        
        get { return _spouse}
        set(value) {
            if age >= 18 {
                _spouse = value!
            }
        }
    }
    
    public init(firstName : String, lastName: String, age : Int) {
        self.firstName = firstName
        self.lastName = lastName
        self.age = age
        _job = nil
        _spouse = nil
    }
    
}

////////////////////////////////////
// Family
//

public class Family : CustomStringConvertible {
    private var members : [Person] = []
    public var description: String {
        var str : String = "Family members include: "
        for person in members {
            str += person.firstName + " "
        }
        return str
    }
    
    public init(spouse1: Person, spouse2: Person) {
        if spouse1.spouse == nil && spouse2.spouse == nil {
            spouse1.spouse = spouse2
            spouse2.spouse = spouse1
            members.append(spouse1)
            members.append(spouse2)
        }
    }
    
    // add a child to the family if at least one of the family members is over 21
    public func haveChild(child: Person) -> Bool {
        var over21 = false
        for person in members {
            if person.age >= 21 {
                over21 = true
            }
        }
        if over21 {
            self.members.append(child)
        }
        print(description)
        return over21
    }
    
    // calculate the total family income
    public func householdIncome() -> Int {
        var incomes = 0
        for person in members {
            if person.job != nil {
                
                // for hourly, 40 hours/week, 50 weeks/year 40
                incomes += (person.job?.calculateIncome(40 * 50))!
            }
        }
        
        return incomes
    }
}






