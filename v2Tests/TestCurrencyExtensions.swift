//
//  TestCurrencyExtensions.swift
//  SimpleDomainModel
//
//  Created by Xiaowen Feng on 4/18/16.
//  Copyright © 2016 Ted Neward. All rights reserved.
//


import XCTest

import SimpleDomainModel

class TestCurrencyExtensions: XCTestCase {

    func testUSD() {
        let tenUSD = 10.USD
        XCTAssert(tenUSD.amount == 10.0)
        XCTAssert(tenUSD.currency == "USD")
    }
    func testCAN() {
        let tenCAN = 10.CAN
        XCTAssert(tenCAN.amount == 10.0)
        XCTAssert(tenCAN.currency == "CAN")
    }
    
    func testEUR() {
        let twoEUR = 2.0.EUR
        XCTAssert(twoEUR.amount == 2.0)
        XCTAssert(twoEUR.currency == "EUR")
    }
    
    func testGBP() {
        let fiveGBP = 10.USD.convert("GBP")
        XCTAssert(fiveGBP.amount == 5.0)
        XCTAssert(fiveGBP.currency == "GBP")
        
    }
}

