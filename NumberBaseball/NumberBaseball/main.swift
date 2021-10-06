//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

// 변수 - 남은 시도횟수, (볼), 스트라이크 횟수, 임의의 정수 3개를 담을 변수

var remainingAttempts: Int = 9

var ballCount: Int

var strikeCount: Int

var targetNumbers: [Int] = generateRandomNumberSet()

var playerNumbers: [Int]


// 임의의 3개 정수 만들고 반환

func generateRandomNumberSet() -> [Int] {
    var numbers: Set<Int> = []
    while numbers.count < 3 {
        let number: Int = Int.random(in: 1...9)
        numbers.insert(number)
    }
    return Array(numbers)
}


func countStrikeAndBallNumber(first: [Int], second: [Int]) -> Int {
    let firstSet = Set<Int>(first)
    let secondSet = Set<Int>(second)
    let count = firstSet.intersection(secondSet).count
    return count
}

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
    strikeCount = 0
    ballCount = 0
    playerNumbers = generateRandomNumberSet()
    print("정답 수 : (targetNumbers[0]) (targetNumbers[1]) (targetNumbers[2])")
    print("임의의 수 : (playerNumbers[0]) (playerNumbers[1]) (playerNumbers[2])")
    
    let count = countStrikeAndBallNumber(first: targetNumbers, second: playerNumbers)
    strikeCount = countStrike(first: targetNumbers, second: playerNumbers)
    ballCount = count - strikeCount
    
    if strikeCount == 3 {
        print("사용자 승리!")
        remainingAttempts = 1
    }
    
    print("(strikeCount) 스트라이크, (ballCount) 볼")
    remainingAttempts = remainingAttempts - 1
    print("남은 기회 : (remainingAttempts)")
}

