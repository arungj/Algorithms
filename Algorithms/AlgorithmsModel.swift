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
            if String(text[forwardIndex]).uppercased() !=
                String(text[backwardIndex]).uppercased() {
                palindrome = false
                break
            }
        }
        return palindrome
    }
    
    func pangram(text: String) -> String {
        // Initialize with all 0s.
        var alphabetArray = [Int](repeating: 0, count: 26)
        let lowercaseText = text.lowercased()
        
        // Fill '1' if character is found.
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
                missingLetters += String(character) + " "
            }
        }
        return missingLetters
    }
    
    func find(sum: Int, in array: [Int]) -> (Int, Int)? {
        var start = 0
        var end = array.count - 1
        while start < end {
            let currentSum = array[start] + array[end]
            if currentSum == sum {
                return (array[start], array[end])
            } else if currentSum < sum {
                start += 1
            } else {
                end -= 1
            }
        }
        return nil
    }
}
