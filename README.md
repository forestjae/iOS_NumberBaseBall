### iOS 커리어 스타터 캠프

## 숫자야구 게임
개요 : 컴퓨터와 간단한 숫자야구 게임을 하는 콘솔 앱. 
<img width="270" alt="스크린샷 2022-02-17 오후 7 31 12" src="https://user-images.githubusercontent.com/76479760/154457688-3be6fee3-f170-44bc-b066-14bae5611efe.png">

[[STEP 1] PR](https://github.com/yagom-academy/ios-number-baseball/pull/57). 
[[STEP 2] PR](https://github.com/yagom-academy/ios-number-baseball/pull/63)

## 1. 고민한 점

- **Side-effect를 줄이는 노력을 했습니다.**   
파라미터와 리턴값을 최대한 활용하고, 불필요한 전역변수는 제거하였습니다. 전역변수가 여러 곳에서 참조된다면 참조한 예상치 못한 값 변경이 있을 때 에러 또는 의도치 않은 상황이 발생할 수 있기 때문입니다.

- **함수의 단위를 고민하였습니다.**  
하나의 함수가 여러 기능을 가지고 있으면 코드의 흐름을 파악하기 어렵습니다. 또, 함수의 길이가 길어질수록 가독성이 떨어집니다. 반대로 함수가 너무 작은 기능만 가지고 있다면 함수의 존재의의가 없어지게 됩니다.

- **효율적인 설계를 고려하였습니다.**  
처음에 스텝 1 기준으로 순서도를 작성하고, 스텝2를 진행하기 전에 스텝2 내용을 반영하여 순서도를 다시 그렸습니다. 스텝 2의 코딩을 진행하면서, 기존 설계가 스텝 1 기준으로만 맞춰져 있었기 때문에 많은 코드를 리팩토링 할 수 밖에 없었습니다. 최초 설계의 중요성을 느낄 수 있었습니다. 

- **코드 컨벤션을 일관성 있게 준수하려 노력했습니다.**  
의미없는 개행을 삭제하고, 각 요소의 이름들을 코드의 부분만 보더라도 어떤 역할을 수행하는지 이해할 수 있도록 명명하려 노력했습니다.

## 2. 새로 알게 된 점

- **네이밍**

```swift
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
```
한 이닝을 진행하는 함수를 playInning이라고 명명했는데, 승리조건을 판단하기 위해 playInning 함수는 스트라이크의 개수를 반환값으로 갖습니다. **let strikeCount = playInning()** 부분에서, 함수명과 변수명이 직관적으로 매칭이 잘 안되기 때문에 가독성이 떨어지게 되었습니다. 이러한 현상을 해소하기 위해서 함수를 더 낮은 기능 단위로 분리하여 함수의 이름을 구체적으로 명명했습니다.

- **함수의 단위**
```swift
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

```
해당 함수는 메뉴를 입력받고 -> 올바른 입력인지 확인 후 -> 게임을 시작 -> 다시 메뉴 입력받기 순서로 동작하는 함수입니다. 위 함수가 여러가지 기능을 하고있고, 그 때문에 기능을 나타내는 이름을 짓기 어려웠는데요. 함수의 기능을 더 낮은 단위로 쪼개고, 그 함수들을 부품처럼 조립해서 쓴다는 개념으로 접근하니 좀 더 수월해졌습니다.


## 3. 해결하지 못한 점

- **들여쓰기 최대 2번 조건**

```swift
func calculateStrikeCount(target: [Int], player: [Int]) -> Int {
    var count = 0
    for index in 0...2 {
        count += target[index] == player[index] ? 1 : 0
    }
    return count
}
 ```
스트라이크 개수를 계산하는 함수에서 들여쓰기 조건을 만족하기 위해 물음표 연산자를 사용하였는데, 조건식의 축약이기 때문에 프로젝트 요구사항에서 의도한 바를 완벽하게 만족시키지 못한 꼼수라고 느껴졌습니다. 함수를 분리하여 작은 단위로 쪼개려하면, count 변수가 전역변수가 될 수 밖에 없는 상황이 발생하여 결국 다른 방법을 찾지 못하였습니다. 



