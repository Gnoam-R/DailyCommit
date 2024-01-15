## 🤔 Notification Center 구현 관련

Notification의 옵저빙 기능 추가
```swift
NotificationCenter.default.addObserver(
    self,
    selector: #selector(self.didDismissDetailNotification(_:)),
    name: NSNotification.Name("ModalDismissNC"),
    object: nil
)
```

Notification을 실행하고자 하는 곳에서 생성
```swift
NotificationCenter.default.post(name: NSNotification.Name("ModalDismissNC"), object: nil, userInfo: nil)
```

실행되는 메서드
```swift
@objc func didDismissDetailNotification(_ notification: Notification) {
    DispatchQueue.main.async { [self] in
        self.tableView.reloadData()
    }
}
```
출처: https://roniruny.tistory.com/152