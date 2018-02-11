//
//  AlgorithmsModel.swift
//  Algorithms
//
//  Created by Arun George on 2/11/18.
//  Copyright © 2018 GJ. All rights reserved.
//

import Foundation

struct AlgorithmsModel {
    func palindrome(text: String) -> Bool {
        for character in text {
            print("character: \(character)")
        }
        var palindrome = true
        for i in 0..<text.count {
            let forwardIndex = text.index(text.startIndex, offsetBy: i)
            let backwardIndex = text.index(text.endIndex, offsetBy: -i-1)
            if text[forwardIndex] != text[backwardIndex] {
                palindrome = false
                break
            }
        }
        return palindrome
    }
    
    func pangram(text: String) -> String {
        var alphabetArray = [Int](repeating: 0, count: 26)
        let lowercaseText = text.lowercased()
        for character in lowercaseText.utf8 {
            let indexValue = Int(character) - 97
            if indexValue < 0 || indexValue > 25 { continue }
            alphabetArray[indexValue] = 1
        }
        var missingLetters: String = ""
        for i in 0..<alphabetArray.count {
            if alphabetArray[i] == 0 {
                let asciiValue = i + 97
                let character = Character(UnicodeScalar(asciiValue)!)
                let stringValue = String(character)
                missingLetters += stringValue + " "
            }
        }
        return missingLetters
    }
}
