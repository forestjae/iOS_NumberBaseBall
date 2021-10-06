//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

// 변수 - 남은 시도횟수, (볼), 스트라이크 횟수, 임의의 정수 3개를 담을 변수

var remainingAttempts: Int = 9

var targetNumbers: [Int] = generateRandomNumbers()

var playerNumbers: [Int]


// 임의의 3개 정수 만들고 반환

func generateRandomNumbers() -> [Int] {
    var numbers: Set<Int> = []
    while numbers.count < 3 {
        let number: Int = Int.random(in: 1...9)
        numbers.insert(number)
    }
    return Array(numbers)
}

// 두 배열의 일치하는 숫자의 개수
func countStrikeAndBallNumber(first: [Int], second: [Int]) -> Int {
    let firstSet = Set<Int>(first)
    let secondSet = Set<Int>(second)
    let count = firstSet.intersection(secondSet).count
    return count
}

// 순서까지 일치하는 숫자의 개수
func countStrike(first: [Int], second: [Int]) -> Int {
    var count = 0
    for index in 0...2 {
        if first[index] == second[index] {
            count += 1
        }
    }
    return count
}




while remainingAttempts > 0 {
    var strikeCount: Int = 0
    var ballCount: Int = 0
    
    playerNumbers = generateRandomNumbers()
    print("정답 : \(targetNumbers[0]) \(targetNumbers[1]) \(targetNumbers[2])")
    print("임의의 수 : \(playerNumbers[0]) \(playerNumbers[1]) \(playerNumbers[2])")
    
    let totalCount = countStrikeAndBallNumber(first: targetNumbers, second: playerNumbers)
    strikeCount = countStrike(first: targetNumbers, second: playerNumbers)
    ballCount = totalCount - strikeCount
    
    if strikeCount == 3 {
        print("사용자 승리!")
        remainingAttempts = 1
    }
    
    print("\(strikeCount) 스트라이크, \(ballCount) 볼")
    remainingAttempts = remainingAttempts - 1
    print("남은 기회 : \(remainingAttempts)\n")
}

