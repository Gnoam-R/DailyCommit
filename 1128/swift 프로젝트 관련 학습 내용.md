## 에러 처리(Error Handling)란?

- 프로그램 내에서 에러가 발생한 상황에 대해 대응 및 복구를 진행하는 과정
- swift에서 런타임에 에러가 발생한 경우 이를 처리하기 위해  발생(throwing), 감지(catching), 전판(propagating), 조작(manipulating)을 지원한다

## Swift 언어에서 에러 표시

- Error 프로토콜을 따르는 타입의 값으로 표현됨
- 특히 열거형으로 에러를 그룹화 하는데 적합함

## 에러 처리 방법

throw 키워드로 표시된 함수를 throwing function이라고 부르고, 함수가 리턴 값을 명시했다면 → 전에 throws 키워드를 사용한다

```swift
func RSPGame(inRSP: Hand) throws -> Hand
```

## do-catch를 사용한 에러 처리

에러를 처리하는 코드 블럭

```swift
do {
  try 표현식
  결과
} catch 패턴 1 { // 패턴에는 어떤 에러인지 명시
  처리 결과
} catch 패턴 2 where 조건 { // 뒤에 조건을 달고 싶다면 where절 추가
  처리 결과
} catch { // catch 구문 뒤에 에러의 종류를 명시하지 않으면 발생화는 모근 에러를 처리
  처리 결과
}
```

## 프로젝트 진행 사항

- 기존의 optional handling 로직을 throw로 변경
- 가위바위보, 묵찌빠 게임을 하나의 클래스로 분류하는것이 아닌 동작에 대한 결과 값만을 제공하도록 만들고 있음
