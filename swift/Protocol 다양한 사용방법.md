## 프로토콜의 다양한 사용 방법에 관하여

`Human`을 상속받는 `HighSchool`과 `HighSchool`을 상속받는 `University`는 같은 Human을 상속받지만
`HighSchool`은 `University`를 상속 받지 않기 때문에 .대학교를 가져올수 없음

```swift
class Human {
    var 이름 = "폴"
}

class HighSchool: Human {
    var 고등학교 = "폴고등학교"
}

class University: HighSchool {
    var 대학교 = "폴유니버시티"
}

let highschool = HighSchool()
highschool.고등학교
highschool.이름
```

따라서 TypeCasting을 사용하게 되면 아래와 같은 방식으로 구현이 가능합니다.

1. 업케스팅
```swift
let a = highschool as Human
a.이름
```

2. 다운 캐스팅
```swift
let b = highschool as? University
b?.대학교
b?.고등학교
b?.이름
```

그리고 서로 다른 Protocol을 채택 받는 class에서 
```swift
protocol Walkable {
    func walk()
}

protocol Singable {
    func sing()
}


class Human: Singable, Walkable {
    //===================== Walkable 
    func walk() {
        print("walk...")
    }
    //====================== Singable
    func sing() {
        print("sing...")
    }
}
```
Human은 각 프로퍼티에 선언된 함수들을 가져와 선언하고 사용이 가능한데 <br>
다음과 같이 클래스의 참조 타입이 선언되면
```swift
let human: Walkable = Human()
human.sing() // -> X
human.walk() // -> O
```
채택된 타입에 대한 프로퍼티 또는 메서드만을 사용이 가능하게 된다.

