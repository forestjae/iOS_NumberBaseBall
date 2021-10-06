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

func countMatchingNumbers(of target: [Int], and playerNumbers: [Int]) -> Int {
    let firstSet = Set<Int>(target)
    let secondSet = Set<Int>(playerNumbers)
    let count = firstSet.intersection(secondSet).count
    return count
}

func calculateStrikeCount(of target: [Int], and playerNumbers: [Int]) -> Int {
    var count = 0
    for index in 0...2 {
        if target[index] == playerNumbers[index] {
            count += 1
        }
    }
    return count
}

print("정답 : \(targetNumbers[0]) \(targetNumbers[1]) \(targetNumbers[2])")


func compareNumbers() {
    let playerNumbers: [Int] = generateRandomNumbers()
    print("임의의 수 : \(playerNumbers[0]) \(playerNumbers[1]) \(playerNumbers[2])")
    
    let totalCount = countMatchingNumbers(of: targetNumbers, and: playerNumbers)
    let strikeCount: Int = calculateStrikeCount(of: targetNumbers, and: playerNumbers)
    let ballCount: Int = totalCount - strikeCount
    print("\(strikeCount) 스트라이크, \(ballCount) 볼")
    if strikeCount == 3 {
        print("사용자 승리!")
        remainingAttempts = 0
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



