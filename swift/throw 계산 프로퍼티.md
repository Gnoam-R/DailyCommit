## 🤔 계산 프로퍼티에 throw 값 적용하기

```swift
struct SampleFile {
    let url: URL
    var data: Data {
        get throws {
            try Data(contentsOf: url)
        }
    }
}
```

get throws를 사용해 특정 상황에 대한 에러를 표출햘 수 얬음

```swift
var check: Bool {
    get throws {
        switch self {
        case .name(let name):
            if name.isEmpty { throw ContactListError.ContactNameIsValid }
            else { return true }
        }
    }
}
```
출처: https://www.avanderlee.com/swift/throwing-properties/