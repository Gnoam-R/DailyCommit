
> Optional로 싸인 값을 꺼내오는 방법에는 무엇이 있는지 함께 찾아봅니다.
> 
> 
> ## 1
> 
- Force Unwrapping(강제 추출), [공식문서 링크](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/thebasics#Force-Unwrapping) → @Effie
- Optional Binding(옵셔널 바인딩, if let / guard let / ~~case let~~), [공식문서 링크](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/thebasics#Optional-Binding) → @샘[Sam]
- Implicitly Unwrapped Optionals(IUO), [공식문서 링크](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/thebasics/#Implicitly-Unwrapped-Optionals)
- Providing a Fallback Value(대체값 제공, feat. nil-coalescing operator), [공식문서 링크](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/thebasics#Providing-a-Fallback-Value)

## 2

> 여러가지 방법 중 하나의 방법씩 선택해 정독합니다.
> 

## 3

> 공식 문서의 코드가 아닌, 나만의 예제 코드 만들어 봅니다. (ChatGPT 사용은 지양합니다)
> 

### Effie: Force Unwrapping(강제 추출)

```swift
struct Cat {
        let name: String = "Navi"
}

var maybeCat: Cat? = Cat()

print(maybeCat!.name) // Navi

maybeCat = nil

print(maybeCat!.name) // !!error!!
```

### Sam: Optional Binding(옵셔널 바인딩, if let / guard let / case let)

### if let

```swift
// if let 바인딩

let optionalNumber = Optional(10)
let number = 10

print("추출 하기 전 : \(String(describing: optionalNumber))")

if let num = optionalNumber {
    print("추출 성공 : \(num)")
} else {
    print("바인딩에 실패")
}
```

### guard let 바인딩

```swift
// guard let 바인딩

func test() {
    let optionalNumber: Int? = 3

    guard let number = optionalNumber else {
        return
    }
    print("optionalNumber : \(optionalNumber)")
    print("number : \(number) ")
}

test()
```

### 노움: Implicitly Unwrapped Optionals(IUO)

```swift
func main() {
        let optionFruit : String = "orange"
    let unwrappedOptionFruit : String = "apple"
    let optionTwoFruit : String? = optionFruit
    let unwrappedTwoOptionFruit : String! = unwrappedOptionFruit

        // 옵셔널 바인딩을 사용하게 되면 !를 사용해서 강제적으로 추출함
    print(optionTwoFruit!)
        // IUO를 사용하면 해당 변수를 사용할때 마다 !연산자를 사용할 필요가 없음
    print(unwrappedTwoOptionFruit)
    if unwrappedTwoOptionFruit == "apple" {
        print("check 1")
    }
    else {
        print("check 2")
    }
}
```

### Dan: Providing a Fallback Value(대체값 제공, feat. nil-coalescing operator)

```swift
var 옵셔널: String?
var 기본값 = "기본값"

print("현재 저장된 값은 어떤 값인가요? \(옵셔널 ?? 기본값)")

// 여기에서 ?? 기호를 nil-coalescing operator(닐 병합 연산자)라고 부른다.
// 옵셔널 변수에 값이 있다면 값을 출력하고, nil 인 경우에는 기본값을 대신 출력해준다.
// 옵셔널 != nil ? 옵셔널 : 기본값
// 위 구문의 축약표현(shorthand) 이라고 할 수 있다.

// 응용판 (모바일게임을 생각해보자)
var 아이디: String?
var 기본아이디 = "user10342"

func printUserId (userId: String?) {
    print(userId ?? 기본아이디)
}

printUserId(userId: 아이디)
```

### Effie: case let

case let 은 옵셔널 바인딩은 아니고 바인딩인 것 같아요!

- 예시 코드
    
    ```swift
    import Foundation
    
    enum Animal {
      case cat(name: String)
      case dog(name: String)
    }
    
    let animal: Animal = Animal.cat(name: "Navi")
    
    switch animal {
    case .cat(let abc):
      break
    case .dog(let dogName):
      print(dogName)
    }
    
    if case let .cat(catName) = animal {
      print(catName)
    }
    ```
    
- 참고 자료
    - [https://velog.io/@haze5959/Swift-놓치기-쉬운-특이한-문법편](https://velog.io/@haze5959/Swift-%EB%86%93%EC%B9%98%EA%B8%B0-%EC%89%AC%EC%9A%B4-%ED%8A%B9%EC%9D%B4%ED%95%9C-%EB%AC%B8%EB%B2%95%ED%8E%B8)

## 4

> 예제코드를 활용해 팀원에게 번갈아 설명합니다.
> 

## 심화

> Optional로 싸인 값과 그냥 값을 == 연산자로 비교할 수 있는 근거를 찾아봅니다.
> 

- 에피
    
    [https://developer.apple.com/documentation/swift/optional/==(_:_:)-m6x#:~:text=You can also,FromString%3A](https://developer.apple.com/documentation/swift/optional/==(_:_:)-m6x#:~:text=You%20can%20also,FromString%3A)
    
    > You can also use this operator to compare a non-optional value to an optional that wraps the same type. The non-optional value is wrapped as an optional before the comparison is made. In the following example, the `numberToMatch` constant is wrapped as an optional before comparing to the optional `numberFromString`:
    > 
    
    ```swift
    let numberToMatch: Int = 23
    let numberFromString: Int? = Int("23")      // Optional(23)
    if numberToMatch == numberFromString {
        print("It's a match!")
    }
    // Prints "It's a match!"
    ```
    
    문서에도 나와있지만
    
    ```swift
    static func == (lhs: Wrapped?, rhs: Wrapped?) -> Bool
    ```
    
    이 시그니처를 봤을 때 연산자의 우측 피연산자가 옵셔널인걸 알 수 있어요. 
    
    피연산자로 값이 복사될 때 옵셔널로 래핑되기 때문에 옵셔널 간 비교가 되는 게 아닐까 싶습니다.
    
    ```swift
    var optional: Int?
    
    print(type(of: optional))  // Optional<Int>
    
    optional = 10
    
    print(type(of: optional))  // Optional<Int>
    
    if let unwrapped = optional {
        print(type(of: unwrapped))  // Int
    }
    ```
