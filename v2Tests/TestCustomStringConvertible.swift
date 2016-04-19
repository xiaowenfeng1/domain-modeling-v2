//
//  TestCustomStringConvertible.swift
//  SimpleDomainModel
//
//  Created by Xiaowen Feng on 4/18/16.
//  Copyright © 2016 Ted Neward. All rights reserved.
//


import XCTest

import SimpleDomainModel

class TestCustomStringConvertible: XCTestCase {
     
     func testMoneyDescr() {
        let tenUSD = 10.0.USD
        XCTAssert(tenUSD.description == "USD10.0")
     }
     
     func testJobDescr() {
        let professor = Job(title: "professor", type: Job.JobType.Salary(1000))
        let student = Job(title: "student",type: Job.JobType.Hourly(15.0))
        XCTAssert(professor.description == "Title: professor, salary: 1000 per year")
        XCTAssert(student.description == "Title: student, salary: 15.0 per hour")
     }
     
     func testPersonDecr() {
        let alex = Person(firstName: "Alex", lastName: "Brown", age: 45)
        XCTAssert(alex.description == "firstName:Alex lastName:Brown age:45")
     }
    
    func testPersonDecrWithJob() {
        let alex = Person(firstName: "Alex", lastName: "Brown", age: 45)
        let professor = Job(title: "professor", type: Job.JobType.Salary(1000))
        alex.job = professor
        XCTAssert(alex.description == "firstName:Alex lastName:Brown age:45 job:professor")
        
    }
    
    func testPersonDecrWithSpouse() {
        let alex = Person(firstName: "Alex", lastName: "Brown", age: 45)
        let wife = Person(firstName: "April", lastName: "Brown", age: 40)
        let _ = Family(spouse1: alex, spouse2: wife)
        XCTAssert(alex.description == "firstName:Alex lastName:Brown age:45 spouse:April Brown")
    }
     
     func testFamilyDescr() {
         let alex = Person(firstName: "Alex", lastName: "Brown", age: 45)
         let son = Person(firstName: "Nick", lastName: "Brown", age: 18)
         let wife = Person(firstName: "April", lastName: "Brown", age: 40)
         let family = Family(spouse1: alex, spouse2: wife)
         family.haveChild(son)
         XCTAssert(family.description == "Family members include: Alex April Nick ")
     }
}

 
