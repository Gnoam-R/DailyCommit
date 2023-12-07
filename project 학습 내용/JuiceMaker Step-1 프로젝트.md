## 프로젝트 관련

`Recipe`에 rawValue 값으로 String을 넣고 `takeOrder` 함수에서 이를 매개변수로 받는다.

입력 받은 문자열을 `,` 로 구분하여 string seperate type으로 형변환 되어 단일 레시피인 경우 복수의 재료를 가지는 레시피인 경우로 나누어 처리한다.

이때 `frutsStock`에 저장된 과일의 수량과 만들고자 하는 레시피의 재료 수량을 비교하여 과일 재료의 수량이 부족한 경우 Error로 처리한다.

```swift
enum Recipe: String {
    case strawberry = "strawberry"
    case banana = "banana"
    case kiwi = "kiwi"
    case pineapple = "pineapple"
    case strawberryBanana = "strawberry,banana"
    case mango = "mango"
    case mangoKiwi = "mango,kiwi"
}

func takeOrder(_ kind: Recipe) throws {
        let arr = kind.rawValue.split(separator: ",")
        if arr.count == 1 {
            guard let fruitsStock = store.fruits[String(arr[0])],
                  let recipe = store.recipes[String(arr[0])],
                    fruitsStock >= recipe[0]
            else {
                throw Errors.orderFail(kind)
            }
            store.fruits[String(arr[0])] = fruitsStock - recipe[0]
        } else {
            try arr.enumerated().forEach { index, fruit in
                guard let fruitsStock = store.fruits[String(fruit)],
                      let recipe = store.recipes[kind.rawValue],
                      fruitsStock >= recipe[index] else {
                    throw Errors.orderFail(kind)
                }
                store.fruits[String(fruit)] = fruitsStock - recipe[index]
            }
        }
    }
```
