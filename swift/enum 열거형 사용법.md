
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

- **enum.변수를 사용한 반환 케이스 전달**
    - 아래와 같은 방식으로 사용하면 enum의 케이스와 Int를 반환 가능
    ```swift
    @frozen
    enum Juice: String {
        case strawberry = "딸기쥬스 주문"
        case banana = "바나나쥬스 주문"
        case kiwi = "키위쥬스 주문"
        case pineapple = "파인애플쥬스 주문"
        case strawberryBanana = "딸바쥬스 주문"
        case mango = "망고쥬스 주문"
        case mangoKiwi = "망키쥬스 주문"
        
        /// 쥬스 제조 시 필요한 과일 수량 반환하는 메서드
        var checkFruitQuantity: [Fruit: Int] {
            switch self {
            case .strawberry:
                return [.strawberry: 16]
            case .banana:
                return [.banana: 2]
            case .kiwi:
                return [.kiwi: 3]
            case .pineapple:
                return [.pineapple: 2]
            case .strawberryBanana:
                return [.strawberry: 10, .banana: 1]
            case .mango:
                return [.mango: 3]
            case .mangoKiwi:
                return [.mango: 2, .kiwi: 1]
            }
        }
    }
    ```

## 잘못된 사용 방식 개선

기존 사용방식은 switch case를 통해 열거형의 값을 분류하고 전달하는 방식이였다면 현재는 열거형의 매개변수로 전달하여 let 변수에 값을 저장함으로 따로 swith case문을 사용하지 않아도 되는 코드를 알게 되었습니다.

``` swift
guard let selectedButtonTitle = sender.currentTitle,
    let juice = Juice(rawValue: selectedButtonTitle) else {
    return
}
```