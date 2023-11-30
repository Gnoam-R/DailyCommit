
## Enum 열거형 심화

- **raw value(원시값)**
    - 열거형의 **case** 는 모두 독립적인 값이지만 내부에 또 다른 값을 저장할 수 있습니다. 이것을 원시값(**raw value**)이라고 합니다. 열거형을 정의할 때 원시값 저장은 필수사항이 아닙니다.
    - 선언 시점에 저장한 원시값은 나중에 바꿀수 없습니다.
        
        ```swift
        enum Hand: Int {
            case rock = 2
            case scissor = 1
            case paper = 3
        }
        ```
        

- **Associate Values(연관값)**
    - 원시 값의 단점인 모든 case가 같은 Type의 값을 받을  수 밖에 없는 단점을 해결
    - 선언 방식에 대한 예시
    
    ```swift
    enum Menu {
        case rsp(userHand: Hand)
        case mgb(userHand: Hand)
    }
    ```
    

- **Associate Values(연관값) 사용법 심화**
    - 연관값을 통해 case의 enum이 호출될때 값 전달이 가능
    - 아래와 같은 방식으로 구현 가능

```swift
// menu의 생성
enum Menu {
    case rsp(userHand: Hand)
    case mgb(userHand: Hand)
    case exit
    
    init(input: Int, game isMGB: Bool) throws {
        if let hand = Hand(rawValue: input), isMGB {
            self = .mgb(userHand: hand)
        }
        else if let hand = Hand(rawValue: input){
            self = .rsp(userHand: hand)
        }
        else if input == 0 {
            self = .exit
        } else {
            throw ErrorHandling.InvalidInputError
        }
    }
}

// menu init
let menu = try Menu(input: intUserInput, game: isMGB)

// menu call
private func processMenu(_ menu: Menu) {
        switch menu {
        case .rsp(let userHand):
            RSPGame(userHand)
        case .mgb(let userHand):
            MGBGame(userHand)
        case .exit:
            message.output(.exit)
        }
    }
```
