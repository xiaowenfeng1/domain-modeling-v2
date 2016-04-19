//
//  TestMathematics.swift
//  SimpleDomainModel
//
//  Created by Xiaowen Feng on 4/18/16.
//  Copyright © 2016 Ted Neward. All rights reserved.
//


import XCTest

import SimpleDomainModel

class TestMathematics: XCTestCase {
    func testAddOperation() {
        let tenUSD = 10.0.USD
        let protocolAdd = tenUSD.add(tenUSD)
        XCTAssert(protocolAdd.amount == 20.0)
    }

    func testSubtractOperation() {
        let tenCAN = 10.CAN
        let tenUSD = 10.0.USD
        let protocolSub = tenCAN.sub(tenUSD)
        XCTAssert(protocolSub.amount == 2.5)
    }
    

}
 
 

