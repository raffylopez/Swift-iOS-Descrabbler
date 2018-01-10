//
//  globals.swift
//  RafScrabbleSolverCmd_CocoaHere
//
//  Created by Volare on 16/09/2017.
//  Copyright © 2017 Gensys Telerik. All rights reserved.
//

import Foundation

extension String {
    class StringExtensionsError : Error  {}
    subscript(_ start:Bool, _ end:Int)->String? {
        guard
            end <= self.lengthOfBytes(using: .ascii)
            else {
                return "#ERROR"
        }
        return self[self.startIndex..<self.index(self.startIndex, offsetBy:end)]
        //        return "dfdf"
    }
    subscript(_ start:Int, _ end:Bool)->String? {
        guard
            start < self.lengthOfBytes(using: .ascii)
            else {
                return "#ERROR"
        }
        return self[self.index(self.startIndex,offsetBy:start)..<self.index(self.startIndex, offsetBy: self.strlen )]
    }
    subscript(_ start:Int, _ end:Int)->String? {
        guard
            start < self.lengthOfBytes(using: .ascii) &&
                start <= end &&
                end < self.lengthOfBytes(using: .ascii)
            else {
                return "#ERROR"
        }
        return self[self.index(self.startIndex,offsetBy:start)..<self.index(self.startIndex, offsetBy: end + 1)]
        //        return "dfdf"
    }
    var strlen:Int {
        get {
            return self.lengthOfBytes(using: .ascii)
        }
    }
    
    subscript(n:Int)->Character {
        return self[self.index(startIndex, offsetBy: n)]
    }
    
    func stringComponents()->[String] {
        var letters:[String] = []
        for l in 0..<self.strlen {
            letters.append(String(self[l]))
        }
        return letters
    }
    func charComponents()->[Character] {
        var chars:[Character] = []
        for l in 0..<self.strlen {
            chars.append(self[l])
        }
        return chars
    }
    func charComponentsAsSet()->Set<Character> {
        var chars:Set<Character> = []
        for l in 0..<self.strlen {
            chars.insert(self[l])
        }
        return chars
    }
}

extension String {
    static func permute(_ listo: [String])->[[String]] {
        var list:[String] = [String](listo)
        if list.count == 0 {
            return [[]]
        }
        
        var ret:[String] = []
        let target = [String](list[1..<list.count])
        
        for x in permute(target){
            ret = [String](list[0...0] + x)
        }
        
        var ret2:[[String]] = [ret]
        
        for i in 1..<list.count {//
            if list[i] == list[0] {
                continue
            }
            let temp = list[0]
            list[0] = list[i]
            list[i] = temp
            
            let nexttarget = [String](list[1..<list.count])
            for x in permute(nexttarget){
                ret2 = ret2 + [list[0...0] + x]
            }
        }
        return ret2
    }
    
    func getSetOfPermutations(string:String)->Set<String> {
        var cursor = string.startIndex
        var pieces = Set<String>()
        while cursor != string.endIndex {
            let letter = String(string[cursor])
            pieces.insert(letter)
            cursor = string.index(after: cursor)
        }
        let permutations = String.permute([String](pieces))
        let result = permutations.map({each in
            each.joined(separator: "")
        })
        
        return Set(result)
    }
    
    func permuteString()->[String] {
        var cursor = self.startIndex
        var pieces = [String]()
        while cursor != self.endIndex {
            let letter = String(self[cursor])
            pieces.append(letter)
            cursor = self.index(after: cursor)
        }
        let permutations = String.permute(pieces)
        return permutations.map({each in
            each.joined(separator: "")
        })
    }
//    func permuteString(string:String)->[String] {
//        var cursor = string.startIndex
//        var pieces = [String]()
//        while cursor != string.endIndex {
//            let letter = String(string[cursor])
//            pieces.append(letter)
//            cursor = string.index(after: cursor)
//        }
//        let permutations = String.permute(pieces)
//        return permutations.map({each in
//            each.joined(separator: "")
//        })
//    }
}
