## Notification Center 사용법

### 1. 데이터 전달 이벤트 정의

데이터를 전달할 이벤트를 정의하고, 필요한 데이터를 함께 전달한다. 이 이벤트는 Notification에 의해서 식별됨

```swift
extension Notification.Name {
    static let secret = Notification.Name("shh")
}
```

### 2. 데이터를 보내는 뷰 컨트롤러에서 이벤트 발송

데이터를 보내는 뷰컨트롤러에서 NotificationCenter를 사용해서 이벤트를 발송한다.

```swift
class Master {
    func callPassword() {
        print("마스터: 벽면에 쓰여있는 암호를 읊어봐.")
        // NotificationCenter로 Post하기 (발송하기)
        NotificationCenter.default.post(name: Notification.Name.secret, object: nil, userInfo: [NotificationKey.password: "!@#$"])
    }
}
```

### 3. 데이터를 받는 뷰 컨트롤러에서 이벤트 수신

데이터를 받는 뷰컨트롤러에서 NotificationCenter를 사용하여 이벤트를 수신하고 데이터를 처리합니다.

```swift
class Friend {
    let name: String
    
    init(name: String) {
        self.name = name
        // NotificationCenter에 Observer 등록하기
        NotificationCenter.default.addObserver(self, selector: #selector(answerToMaster(notification:)), name: Notification.Name.secret, object: nil)
    }
    @objc func answerToMaster(notification: Notification) {
        // notification.userInfo 값을 받아온다.
        guard let object = notification.userInfo?[NotificationKey.password] as? String else {
            return
        }
        print("\(name): 암호는 \(object)")
    }
}
```
