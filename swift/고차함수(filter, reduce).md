### allCases.reduce

enum에서 caseIterable을 채택하게 되면 모든 case에 대해 순회 할 수 있음

```swift
import Foundation

enum School: CaseIterable {
    case elementary
    case middle
    case high
    case college
}

let allCase: [School] = School.allCases
print(allCase)

// [School.elementary, School.middle, School.high, School.college]
```

.reduce의 경우 배열의 순회를 진행하면서 특정 작업을 수행하는 함수를 반환한다

`reduce`는 `caseIterable`에 관련된 기능이 아닌 컬렉션 그 자체에 내장된 메서드인거 같다. 따라서 다른 방식으로 구글링을 해보니 `고차함수`라는 명칭으로 분류된다는 것을 확인함

고차함수에 대해 정리 해보자면 `map`, `filter`, `for in`, `reduce` 등이 있음 추후에 정리를 하겠지만 filter만 간단하게 보자면 

```swift
let stringAttay = ["가수", "대통령", "개발자", "선생님", "의사", "검사", "건물주"]
let threeCountArray = stringAttay.filter { $0.count == 3 }

print(threeCountArray)
// ["대통령", "개발자", "선생님", "건물주"]
```

`$0` : 배열의 각 요소에 반복문?으로 접근한다. 배열의 0번째 요소부터 마지막 요소까지 $0에 적용됨

`.count` : 문자열의 길이

즉 filter는 배열의 각 요소에 접근하여 새로운 컨테이너?(조건문)을 반환한다

즉 저 코드에  `$0.count` 값이 3인 문자열을 리턴하라는 코드가 생략되어 있음

.reduce의 경우는 내부에 컨테이너에서 각 데이터를 합쳐주기 위해서 사용된다.
```swift
let numberArray = [1,2,3,4,5,6,7,8,9,10]
let sum = numberArray.reduce(0) { $0 + $1 }

print(sum)
// 55
```