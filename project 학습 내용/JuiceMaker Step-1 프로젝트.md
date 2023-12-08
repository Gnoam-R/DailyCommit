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

## 프로젝트 제출 및 리뷰 관련 학습 내용
- PR 리뷰 작성
    - Loop문인 forEach와 for in의 차이점 확인
        
        `for in`은 컬렉션에 저장되어 있는 요소의 수만큼 반복을 하기 때문에 반복문 안에서 사용이 가능한 `continue, break`를 사용할 수 있습니다. 하지만 `forEach`의 경우 클로저로 작성해서 함수의 파라미터로 넘겨주는 방식이기 때문에 반복문의 기능을 하지 않습니다.
        
    - Class와 Struct에 대한 궁금증
        
        `class A`를 `class B`와 `class C`에서 인스턴스를 생성하는 것과
        `struct AA`를 `class B`와 `class C`에서 사용하는 것은 어떤 차이가 있을까?
        
        class는 주소를 복사하는것이니 struct를 사용해 값을 복사해 전달하는 것보다 class를 사용해 인스턴스를 B, C에 생성하는 것이 훨씬 좋다? 라는 의문이다. 따라서 만약 인스턴스를 2개의 클래스에 적용해야만 하는 필요가 있다면 struct보다 class를 사용하는게 좋다?
        
    - enum에 대한 여러가지 사용 바
        
        enum을 사용하는 다양한 방법들에 대해 공부를 하고 있다.
        
        현재까지 이해한 내용을 정리 하자면 2가지가 있는데  `associate value(연관값)`, `raw value(원시값)`이 있다.
        
        연관 값의 경우 ()를 사용해 다양한 Type을 저장할수 있는 반면 원시 값은 정해진 하나의 타입만을 모든 case에 적용하게 된다.
        
        아래는 연관 값과 원시값에 대한 예시 코드이다.
        
        ```swift
        // Raw value
        enum test1 : Int {
            case aa = 1
            case bb = 2
        }
        // associate value
        enum test2 {
            case aa(Int)
            case bb(String)
          case cc(customType)
        }
        
        func testFunc(input: Int) -> Int {
            if input == 1 {
                return test1.aa
            } else {
                return test2.aa
            }
        }
        ```
        
    - Guard Let과 If let의 차이
        - Guard Let의 경우 조건에 대한 빠른 블록 종료를 수행한다
