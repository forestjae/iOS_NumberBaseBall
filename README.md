### iOS 커리어 스타터 캠프

## 숫자야구 게임

<img width="261" alt="스크린샷 2021-10-07 오후 9 54 42" src="https://user-images.githubusercontent.com/57553889/136388141-8ea1b905-dfdf-413a-9a3f-694e156c0e9f.png">

[[STEP 1] PR](https://github.com/yagom-academy/ios-number-baseball/pull/57)

## 1. 고민한 점

- **Side-effect를 줄이는 노력을 했습니다.**
파라미터와 리턴값을 최대한 활용하고, 불필요한 전역변수는 제거하였습니다. 전역변수가 여러 곳에서 수정한다면 참조한 변수에 예상치 못한 값 변경이 있을 때 에러 또는 의돛 않으 상황이 발생할 수 있기 때문입니다.

- **함수의 단위를 고민하였습니다.**
하나의 함수가 여러 기능을 가지고 있으면 코드의 흐름을 파악하기 어렵습니다. 또, 함수의 길이가 길어질수록 가독성이 떨어집니다. 반대로 함수가 너무 작은 기능만 가지고 있다면 함수의 존재의의가 없어지게 됩니다. 

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



