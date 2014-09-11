//
//  SnakesAndLadders.swift
//  SnakesAndLadders
//
//  Created by atul on 10/09/14.
//  Copyright (c) 2014 LM. All rights reserved.
//

import Foundation

protocol DiceGame {
    var dice: Dice { get }
    func play()
}

protocol DiceGameDelegate {
    func updateGame(newPosition: Int) -> ()
}

public class SnakesAndLadders: DiceGame {
    let dice = Dice()
    let finalSquare = 25
    var square = 0
    var board: [Int]
    var delegate: DiceGameDelegate?
    
    public init() {
        board = [Int](count: finalSquare + 1, repeatedValue: 0)
        board[03] = +08; board[06] = +11; board[09] = +09; board[10] = +02
        board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08
    }
    
    public func play() {
        square = 0
        var noOfRolls = 0
        println("Game started")
        gameLoop: while square != finalSquare {
            sleep(2)
            let diceRoll = dice.roll()
            noOfRolls += 1
            println("dice rolled as \(diceRoll)")
            switch square + diceRoll {
            case finalSquare:
                delegate?.updateGame(finalSquare)
                break gameLoop
            case let newSquare where newSquare > finalSquare:
                continue gameLoop
            default:
                square += diceRoll
                square += board[square]
                delegate?.updateGame(square)
            }
        }
        println("Game ended after \(noOfRolls)")
    }
}