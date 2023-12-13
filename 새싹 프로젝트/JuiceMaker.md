# JuiceMaker

## 🤔 쥬스 메이커 입력 데이터 처리 로직

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

### 🤔 의문점 및 문제점

하나의 레시피에서 2개 이상의 과일 재료를 사용하는 것에 대한 처리를 하기 위해서 `Recipe` 의 rawValue를 문자열로 작업했다.  때문에 레시피에 대한 다양한 처리(예를 들면 화면에 나타나는 Alert의 text는 한글) 를 지원하기 힘들다

화면에 rawValue를 통한 한글 text출력에 대한 해결 방법으로는 기존 `Recipe` 에 아래와 같은 코드를 추가함

```swift
enum Recipe: String {
    case strawberry = "strawberry"
    case banana = "banana"
    case kiwi = "kiwi"
    case pineapple = "pineapple"
    case strawberryBanana = "strawberry,banana"
    case mango = "mango"
    case mangoKiwi = "mango,kiwi"
    
    var recipeName: String {
        switch self {
        case .strawberry:
            return "딸기"
        case .banana:
            return "바나나"
        case .kiwi:
            return "키위"
        case .pineapple:
            return "파인애플"
        case .strawberryBanana:
            return "딸바"
        case .mango:
            return "망고"
        case .mangoKiwi:
            return "망키"
        }
    }
}
```

## 😀 JuiceMaker 뷰 대응

처음으로 StoryBoard를 사용해 View를 가지고 연결하는 작업을 진행했다.  이 프로젝트를 하면서 깨달은 몇가지 내용을 정리해 보려고 한다

- 다수의 버튼을 하나의 IBAction func에 묶어내는 방법
    1. 버튼에 Tag 값(정수)를 설정하여 실제 버튼이 눌렀을 때 매개변수로 전달받음
    2. 하나의 func에 버튼 Action연결
    3. 각각의 버튼 Tag값에 따라 다른 결과 실행
    4. 예시 코드
    
    ```swift
    @IBAction func juiceMakeBtnTapped(_ choice: UIButton) {
        var selectedRecipe : Recipe
        switch choice.tag {
        case 0:
            selectedRecipe = Recipe.strawberryBanana
        case 1:
            selectedRecipe = Recipe.mangoKiwi
        case 2:
            selectedRecipe = Recipe.strawberry
        case 3:
            selectedRecipe = Recipe.banana
        case 4:
            selectedRecipe = Recipe.pineapple
        case 5:
            selectedRecipe = Recipe.kiwi
        case 6:
            selectedRecipe = Recipe.mango
        default:
            selectedRecipe = Recipe.mango
        }
    }
    ```
    
- Seg를 사용한 모달 화면 전환
    
    ```swift
    private func moveFruitStore() {
        self.performSegue(withIdentifier: "moveToStock", sender: "")
    }
    ```
    
- Alert 화면 출력
    
    제목, 메시지, 액션 버튼(yes, no), ActionHandler가 필요하며 애니메이션의 유무를 넣을수 있다.
    
    ```swift
    let alert = UIAlertController(title: title,
                                          message: message,
                                          preferredStyle: preferedStyle)
    let completeAction = UIAlertAction(title: completeTitle, style: .default) { action in
        completionHandler?()
    }
    alert.addAction(completeAction)
    currentVC.present(alert, animated: true, completion: nil)
    ```
    

## 😃 프로젝트 제출 및 리뷰 관련 학습 내용

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

## 🫢 동작 화면
