## 프로토콜 사용 방법에 관하여

- Protocol을 사용해 추상화된 코드를 작성해보았다
- 프로토콜 사용방법을 알게되었고 구상 및 구현에 집중해서 진행함

```swift
import UIKit

var greeting = "Hello, playground"

//Step 1 : 내가 사장이라면, 내 비서는 이런일을 해줬으면 좋겠다 상상하기
//Step 2 : 상상한 것을 프로토콜로 표현해보기
//Step 3 : 비서 프로토콜을 따르는 타입 3개 만들어보기
//Step 4 : 사장 타입 만들어보기

struct Coffee {
    var taste: String = ""
}

protocol Secretary {
    var age: Int { get }
    var name: String { get }
    var hometown: String { get }
    
    func makeCoffeeForMe() -> Coffee
    
}

extension Secretary {
    func driveForMe() {
        print("부아앙")
    }
    func footMassageForMe() {
        print("시원하다")
    }
}

struct OfficeSecretary: Secretary {
    var age: Int
    var name: String
    var hometown: String
    
    func makeCoffeeForMe() -> Coffee {
        Coffee(taste: "굿")
    }
    
    func driveForMe() {
        print("쾅")
    }
    
}

struct BodyGuard: Secretary {

    var age: Int
    var name: String
    var hometown: String
    
    func makeCoffeeForMe() -> Coffee {
        Coffee(taste: "우웩")
    }
    func footMassageForMe() {
        print("발이 부러짐")
    }

}


struct Boss {
    func giveSalary(to: Secretary) {
        to.thanksBoss()
    }
}

```
