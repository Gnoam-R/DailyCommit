
## Player의 optional 보장

- RSPApp의 객체를 생성하지 않는 방법
    
    Player 클래스를 optional로 구현하지 않는다면? + 이니셜라이저로 player 클래스를 초기화 하지 않는다면
    
    이라고 생각하니 RSPApp을 객체로 생성하지 않고 코드를 구현하면 어떻게 될까? 라는 생각이 들었다
    
    그래서 RSPApp.run()으로 가위바위보 게임을 동작시키기 위해서는 run은 static이어야 된다.
    
    ```swift
    static func run () {
            while isRunning {
                // TODO: 플레이어가 정상적으로 승리한 경우 또는 종료 키를 입력한 경우 isRunning = false
                print(menuMessage)
                guard let input = promptInput(),
                      let inputToInt = Int(input),
                      let menu = Menu(rspInput: inputToInt)
                else {
                    continue
                }
                processMenu(menu)
            }
        }
    
    // MARK: 기존 코드
    
    //let startGame = RSPApp()
    //startGame.run()
    //
    RSPApp.run()
    ```
    
- lazy 프로퍼티로 구현하는 방법
    
    위 static과 마찬가지로 optional로 구현하지 않기 위해서 아래와 같이 구현하게 되었다.
    
    lazy property를 사용하면 user의 경우에는 hand값을 반드시 가져와야 하기 때문에 변수를 생성하여 userPlayer가 사용되기 전에 hand 값이 저장됨
    

```swift
var userPlayer: Player {
        get {
            print("userPlayer :", hand)
            return Player(self.hand, isPlayer: true)
        }
    }
var pcPlayer: Player {
      get {
          let random = Hand.randomizeHand()
          print("pcPlayer :", random)
          return Player(random, isPlayer: false)
      }
}

private func processMenu(_ menu: Menu) {
        switch menu {
        case .rsp(let hand):
            // hand를 유저, pc player 객체에 저장
            self.hand = hand

                        // userPlayer인스턴스와 pcPlayer 인스턴스는 실제 사용될때 초기화되어 사용
            userPlayer
            pcPlayer

```

## 또 optional에 관한 문제

이번에는 class의 initializer에 effie가 공유한 아주 클린한 코드를 적용해 봤음

```swift
class Player {
    var hand: Hand
    var isUser: Bool
    
    static func randomizeHand() -> Hand {
        return Hand.allCases.randomElement() ?? .rock
    }
    
    init?(hand: Hand?) {
        guard let hand else {
            self.isUser = false
            self.hand = Self.randomizeHand()
            return nil
        }
        self.isUser = true
        self.hand = hand
    }
}
```

아래 코드를 보면 hand를 매개변수로 받고 optional 채크를 통해서 사용자 플레이어인지 혹은 pc플레이어인지를 구분해낸다.

여기서 문제점은 player를 리턴할때 nil을 리턴하는것 때문에 RSPApp에서 이를 정상적인 동작을 유도하기 위해서는 init될때 return 값이 nil이 아니게 하거나 혹은 받는 player 객체를 옵셔널로 할것

- optional로 한경우

```swift
var userPlayer: Player? {
    get {
        guard let player = Player(hand: self.hand) else {
            return nil
        }
        return player
    }
}
```

- optional로 하지 않은 경우

```swift
var userPlayer: Player {
    get {
        return Player(hand: self.hand)
    }
}
var pcPlayer: Player {
    get {
        return Player(hand: nil)
    }
}

init(hand: Hand?) {
    guard let hand else {
        self.isUser = false
        self.hand = Self.randomizeHand()
        return
    }
    self.isUser = true
    self.hand = hand
}
```

위 방법으로 구현하니 정상적으로 동작되어 최종적으로 optional로 하지 않고 lazy 프로퍼티의 방식으로 코드를 구현하게 되었다
