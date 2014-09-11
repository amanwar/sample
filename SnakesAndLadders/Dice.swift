//
//  Dice.swift
//  SnakesAndLadders
//
//  Created by atul on 10/09/14.
//  Copyright (c) 2014 LM. All rights reserved.
//

import Foundation

public class Dice {
    var sides: Int
    var generator: Int {
        get {
            return (Int(arc4random_uniform(6))+1)
        }
    }

    public init(sides: Int) {
        self.sides = sides
    }
    
    public init() {
        self.sides = 6
    }
    
    public func roll() -> Int {
        return generator
    }
}