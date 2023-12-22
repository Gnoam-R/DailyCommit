## 프로토콜 사용 방법에 관하여

- 각기 다른 프로토콜을 typealias를 통해 하나의 type으로 묶어 버리는 방법
- 위 방법의 장점으로 하나의 type만 사용하여 여러 type의 프로퍼티와 매서드를 적용할 수 있다.

```swift
protocol PromptDisplayable {
    func displayPrompt(_ prompt: String)
}

protocol InputGettable {
    func getInput() throws -> String
}

protocol OuputDisplayble {
    func displayOutput(_ output: String)
}

protocol HandGameErrorDisplayble {
    func displayRPSError(_ error: HandGameError)
}

typealias IO = InputGettable & PromptDisplayable & OuputDisplayble & HandGameErrorDisplayble
```
