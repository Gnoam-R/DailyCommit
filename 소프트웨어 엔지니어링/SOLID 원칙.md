## 🤔 SOLID 원칙

`SOLID` 원칙을 간단하게 말하면 객체 지향 설계에 더 높은 품질의 프로그램을 만들기 위해 지켜야하는 원칙들을 말한다. `SOLID`는 총 5개의 원칙들을 앞 글자만 따서 정리한 단어이다.

`SOLID`를 사용하는 이유는 개발할 때 모든 순간은 아니지만 보다 간편하고 빠른 유지보수를 하는 곳에 대해서 더욱 생산성있고 유연한 대처를 가능하게 해준다.

### 1. SRP(Single Responsibility Principle) - 단일 책임 원칙

- 클래스나 함수 설계 시 단 하나의 책임만을 가져야 한다
- 클래스 내부 함수끼리 강한 결합(하나의 클래스의 많은 메서드와 역할을 같는 경우) 유지 보수 비용 증가
- SRP 대표 위반 사례 Massive View Controller 현상
    - 대 규모 프로젝트 진행시 view와 model이 controller를 통해서 연결되어 controller가 커지는 현상
    - controller를 통해 view와 model간의 관계가 복잡함
    - 당연히 테스트가 힘들고, 파악도 힘들기 때문에 여러 side-Effect를 불러옴
    - 따라서 위 문제를 해결하기 위해서 MVVM, MVP 등 여러 패턴들이 나타나기 시작
```swift
SRP 예시

protocol HP {
    func returnHP() -> double
}
protocol MP {
    func returnMP() -> double
}
protocol Damage {
    func returnDamage() -> double
}
class StartCraft {
    let apiHP: HP
    let apiMP: MP
    let apiDamage: Damage

    init(apiHP: A,
                apiMP: B,
                apiDamage: Damage) {
                self.apiHP = apiHP
                self.apiMP = apiMP
                self.apiDamage = apiDamage
        }
}
```

### 2. OCP(Open-Closed Principle) - 개방, 폐쇄 원칙

- 클래스 기능 확장에 열려있어야 한다
- 기존 구현한 기능들에 대해 변경 없이 클래스를 추가 확장 가능해야 한다
- 즉 새로운 기능 확장에 대해서는 열려있고 구현 완료된 내용에 대해서 변경 없이 진행되어야 한다는 원칙
- 잘 만든 OCP는 인터페이스와 추상화를 잘 해야 된다.
- OCP 위반의 대표적인 예시는 어떤 타입에 대한 반복적인 분기문이다.
- if/switch 문을 대체하는 방법은 2가지가 있음
    - protocol을 만들고 상속 받아 쓰는 방법 - 직접적으로 OCP를 지키는 구조
    - 간단하게 딕셔너리를 활용하는 방법 - OCP를 지키는 구조는 아니지만, 분기문을 없애고 싶을 때 제한적으로 사용하면 좋음
- protocol 상속 받는 코드
    
    ```swift
    // Protocol을 사용하지 않아 만약 makeSound가 dog, cat 모두 변경해줘야 함
    
    class Dog {
        func makeSound() {
            print("멍멍")
        }
    }
    
    class Cat {
        func makeSound() {
            print("야옹")
        }
    }
    
    class Zoo {
        var dogs: [Dog] = [Dog(), Dog(), Dog()]
        var cats: [Cat] = [Cat(), Cat(), Cat()]
        
        func makeAllSounds() {
            dogs.forEach {
                $0.makeSound()
            }
            
            cats.forEach {
                $0.makeSound()
            }
        }
    }
    
    // 프로토콜을 활용하여 구현시 새롭게 클래스가 추가되는 경우에도 기존 매서드 수정이 필요하지 않음
    
    protocol Animal {
        func makeSound()
    }
    
    class Dog: Animal {
        func makeSound() {
            print("멍멍")
        }
    }
    
    class Cat: Animal {
        func makeSound() {
            print("야옹")
        }
    }
    
    class Zoo {
        var animals: [Animal] = []
        
        func makeAllSounds() {
            animals.forEach {
                $0.makeSound()
            }
        }
    }
    ```
    
- 딕셔너리 활용하는 코드
```swift
switch reason {
  case .initializing:
    self.instructionMessage = "Move your phone".localized
  case .excessiveMotion:
    self.instructionMessage = "Slow down".localized
  case .insufficientFeatures:
    self.instructionMessage = "Keep moving your phone".localized
  case .relocalizing:
    self.instructionMessage = "Move your phone".localized
}

//적절한 곳에 딕셔너리 생성
let trackingStateMessages: [TrackingState.Reason : String] 
                         = [.initializing.        : "Move your phone".localized,
                            .excessiveMotion      : "Slow down".localized,
                            .insufficientFeatures : "Keep moving your phone".localized,
                            .relocalizing         : "Move your phone".localized]

//switch문 대체
self.instructionMessage = trackingStateMessages[reason]
```

### 3. LSP(Liskov Substitution Principle) - 리스코프 치환 원칙

- 자식 클래스는 동작시 부모 클래스의 기능을 제한 하면 안됨
- 부모 클래스의 타입에 자식 클래스의 인스턴스를 넣어도 동일 동작이 진행됨
- LSP 원칙을 위반하는 경우는 자식 클래스가 부모 클래스의 기능을 오버라이딩해서 기능을 변경하거나 제한하는 경우 결과값이 다르게 나옴

```swift
// 잘못된 예시
class Rectangle {
    var width: Float = 0
    var height: Float = 0
    
    var area: Float {
        return width * height
    }
}

class Square: Rectangle {
    override var width: Float {
        didSet {
            height = width
        }
    }
}

func printArea(of rectangle: Rectangle) {
	rectangle.height = 3
	rectangle.width = 6
	print(rectangle.area)
}

let rectangle = Rectangle()
printArea(of: rectangle)
// 18

let square = Square()
printArea(of: square)
// 36

// LSP 원칙을 지킨 올바른 예시
protocol Shape {
    var area: Float { get }
}

class Rectangle: Shape {
    let width: Float
    let height: Float
    
    var area: Float {
        return width * height
    }
    
    init(width: Float,
         height: Float) {
        self.width = width
        self.height = height
    }
}

class Square: Shape {
    let length: Float
    
    var area: Float {
        return length * length
    }
    
    init(length: Float) {
        self.length = length
    }
}
```
지나친 LSP는 비효율적이고, 지나친 LSP 위반은 안정성을 해치기에 둘을 잘 사용하는 판단이 중요함

