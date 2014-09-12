//
//  SnakesAndLaddersTests.swift
//  SnakesAndLaddersTests
//
//  Created by atul on 10/09/14.
//  Copyright (c) 2014 LM. All rights reserved.
//

import UIKit
import XCTest
import SnakesAndLadders

class SnakesAndLaddersTests: XCTestCase {
    var dice = Dice()
    var snakesAndLadders = SnakesAndLadders()
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testDiceRoll() {
        // This is an example of a functional test case.
        for i in 1...200 {
            let rollResult = dice.roll()
            XCTAssertGreaterThan(rollResult, 0, "Dice roll should be greater than 0")
            XCTAssertLessThan(rollResult, 7, "Dice roll should be less than 7")
        }
    }
    
    func testPerformanceSnakesAndLadders() {
        // This is an example of a performance test case.
        self.measureBlock() {
            // Put the code you want to measure the time of here.
//            self.snakesAndLadders.play()
        }
    }
    
}
