## 함수형 프로그래밍

### 1. Closure

- Closure란 ?
    - 코드의 블럭
    - 전달인자, 변수, 상소로 전달이 가능하다
    
    ```swift
    { // (매개변수) -> (반환형) in
    	// 동작
    }
    
    let hello = { () -> void
    	print("hello")
    }
    ```
    
- 함수형 프로그래밍
    - map
    - filter
    - reduce
- 코드

```swift
// 변수나 상수에 할당할 수 있다.

let name = "노움"
let nameClosure: () -> String = {
	return "노움 입니다."
}

// 함수으 반환값으로 사용할 수 있다.
func returnNameString() -> String {
	return name
}

print(nameClosure)

// () -> String 가 반환형
func returnNameStringClosure() -> () -> String {
	return nameClosure
}

// 함수는 이름이 있는 클로저
let result = [17, 3, 88].sorted { left, right in 
	return left < right
}
print(result) // 3, 17, 88

```

map: 컬랙션 배열의 값에 접근하여 형 변환 또는 값 수정을 통해 업데이트 한 배열을 리턴

filter: 컬렉션 배열의 값에 접근하여 값을 비교하여 true인 값 만을 업데이트 한 배열을 리턴

reduce: 컬렉션 배열의 값에 접근하여 모든 요소를 더한 값을 리턴

### 2. 고차함수

- 스위프트 표준 라이브러리에서 제공해주는 함수
    - map
    - reduce
    - filter

```swift
// Map
let numbers = [1, 2, 3, 4, 5] 

let mapResult = numbers.map { number in
	return number * 2
}
print(mapResult)
// [2,4,5,6,10]

// Reduce
let filterResult = numbers.filter { number in
	return number & 2 == 0
}
print("filterResult")
// [2, 4]

// reduce

let reduceResult = numbers.reduce(0) { partialResult, number in
	return parialResult + number
}
// 15
let reduceResult = number.reduce(0) { $0 + $1 }
// 15

let mapResult = numbers.map { $0 * 2}.filter { $0 % 4}

// 4의 배수인 값에 * 2
```


### 고차함수 커스텀 구현

```swift
//
//  main.swift
//  함수형프로그래밍
//
//  Created by Roh on 1/2/24.
//

import Foundation

extension Array {
    func myMap<T>( _ transform: (Element) -> T) -> [T] {
        var result = [T]()
        
        for x in self {
            result.append(transform(x))
        }
        
        return result
    }
    
    func myFilter(_ isIncluded: (Element) -> Bool) -> [Element] {
        var result = [Element]()
        
        for x in self {
            if(isIncluded(x) == true) {
                result.append(x)
            }
        }
        
        return result
    }
//    
    func myReduce(_ initialResult: Element, _ nextPartialResult: (Element, Element) -> Element) -> Element {
        var result = initialResult
        
        for x in self {
            result = nextPartialResult(result, x)
        }
        
        return result
    }
}

let myArray: Array = [1, 2, 3, 4, 5]

let 결과 = myArray.myMap {
    Float($0 + 2)
}
let 결과2 = myArray.myFilter {
    $0 % 2 == 0
}
let 결과3 = myArray.myReduce(0){
    $0 + $1
}

print(myArray)
print(결과)
print(결과2)
print(결과3)

//myArray.myFilter()
//myArray.myReduce()
```



