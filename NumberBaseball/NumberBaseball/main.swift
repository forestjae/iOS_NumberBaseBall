//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation


var remainingAttempts: Int = 9

var targetNumbers: [Int] = generateRandomNumbers()

func generateRandomNumbers() -> [Int] {
    var radomNumbers: Set<Int> = []
    while radomNumbers.count < 3 {
        let number: Int = Int.random(in: 1...9)
        radomNumbers.insert(number)
    }
    return Array(radomNumbers)
}

func countMatchingNumbers(of target: [Int], and userNumbers: [Int]) -> Int {
    let targetSet = Set<Int>(target)
    let playerSet = Set<Int>(userNumbers)
    let count = targetSet.intersection(playerSet).count
    return count
}

func countStrike(of target: [Int], and userNumbers: [Int]) -> Int {
    var count = 0
    for index in 0...2 {
        if target[index] == userNumbers[index] {
            count += 1
        }
    }
    return count
}

func compareNumbers() {
    let userNumbers: [Int] = generateRandomNumbers()
    print("임의의 수 : \(userNumbers[0]) \(userNumbers[1]) \(userNumbers[2])")
    
    let totalCount = countMatchingNumbers(of: targetNumbers, and: userNumbers)
    let strikeCount: Int = countStrike(of: targetNumbers, and: userNumbers)
    let ballCount: Int = totalCount - strikeCount
    print("\(strikeCount) 스트라이크, \(ballCount) 볼")
    
    if strikeCount == 3 {
        print("사용자 승리!")
        return
    }
}

func printResult() {
    while remainingAttempts > 0 {
        compareNumbers()
        remainingAttempts -= 1
        let result = remainingAttempts == 0 ? "컴퓨터 승리...!\n" : ""
        
        print("남은 기회 : \(remainingAttempts)\n", terminator: result)
    }
}

printResult()



