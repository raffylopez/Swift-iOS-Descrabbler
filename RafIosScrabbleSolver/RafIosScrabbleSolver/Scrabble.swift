//
//  Scrabble.swift
//  RafScrabbleSolverCmd_CocoaHere
//
//  Created by Volare on 16/09/2017.
//  Copyright © 2017 Gensys Telerik. All rights reserved.
//

import Foundation

class Scrabble {
    static func getWordScore(forString s:String)->Int {
        var sum = 0
        for i in 0..<s.strlen {
            sum += letterValues[String(s[i]).lowercased()]!
        }
        return sum
    }
    
    static var letterValues = [ "a": 1, "b": 3, "c": 3, "d": 2, "e": 1, "f": 4, "g": 2, "h": 4, "i": 1, "j": 8, "k": 5, "l": 1, "m": 3, "n": 1, "o": 1, "p": 3, "q": 10, "r": 1, "s": 1, "t": 1, "u": 1, "v": 4, "w": 4, "x": 8, "y": 4, "z": 10]
}
