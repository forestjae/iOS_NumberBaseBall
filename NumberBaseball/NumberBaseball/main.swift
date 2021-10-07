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

func countMatchingNumbers(target: [Int], player: [Int]) -> Int {
    let target = Set<Int>(target)
    let player = Set<Int>(player)
    let count = target.intersection(player).count
    return count
}

func calculateStrikeCount(target: [Int], player: [Int]) -> Int {
    var count = 0
    for index in 0...2 {
        count += target[index] == player[index] ? 1 : 0
    }
    return count
}

func calculateStrikeAndBall(targetNumbers: [Int], playerNumbers: [Int]) -> (Int, Int) {
    let total: Int = countMatchingNumbers(target: targetNumbers, player: playerNumbers)
    let strikes: Int = calculateStrikeCount(target: targetNumbers, player: playerNumbers)
    let balls = total - strikes
    
    return (strikes, balls)
}

func playInning() -> Int {
    let playerNumbers = generateRandomNumbers()
    print("임의의 수 : \(playerNumbers[0]) \(playerNumbers[1]) \(playerNumbers[2])")
    
    let (strikeCount, ballCount) = calculateStrikeAndBall(targetNumbers: targetNumbers, playerNumbers: playerNumbers)
    print("\(strikeCount) 스트라이크, \(ballCount) 볼")
    
    return strikeCount
}

func receivePlayerNumbers() {
    print("숫자 3개를 띄어쓰기로 구분하여 입력해주세요.\n중복 숫자는 허용하지 않습니다.")
    print("입력 : ", terminator: "")
}

func printRemainingAttempts() {
    remainingAttempts -= 1
    print("남은 기회: \(remainingAttempts)")
    
    guard remainingAttempts != 0 else {
        print("컴퓨터 승리...!")
        return
    }
}

func startGame() {
    while remainingAttempts > 0 {
    
        let strikeCount = playInning()
        
        if strikeCount == 3 {
            print("사용자 승리!")
            return
        }
        printRemainingAttempts()
    }
}

func isValidMenu(_ input: String) -> Bool {
    guard let input = Int(input), input == 1 || input == 2 else { return false }
    return true
}


func receiveMenuNumber() {
    print("1. 게임시작\n2. 게임종료")
    print("원하는 기능을 선택해 주세요 : ", terminator: "")
    guard let menuNumber: String = readLine() else { return }
    
    if isValidMenu(menuNumber) == false {
        print("입력이 잘못되었습니다")
        receiveMenuNumber()
    }
    
    guard let input = Int(menuNumber), input == 1 else { return }
    
    startGame()
    remainingAttempts = 9
    receiveMenuNumber()
}

receiveMenuNumber()


