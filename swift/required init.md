## required Init

[Swift) 초기화(Initializers) 이해하기 (5/6) - Required initializer](https://babbab2.tistory.com/171)

필수 생성자로 슈퍼 클래스에서 정의를 해주는 경우 서브 클래스가 슈퍼 클래스를 상속 받지 않는 한 서브 클래스에서 반드시 구현 해줘야 한다.

위 글 `초기화 이해하기(5/6)`을 요약해서 설명하자면 

1. uiViewController와 같은 메서드에서 지정 생성자 `init` 을 사용하기 위해서는 `required init?` 을 사용해야 된다.
2. 이유는? 부모의 모든 생성자를 상속 받는 경우 부모에 선언되어 있는 `required init(name:)`을 상속 받음, 하지만 자식 클래스에서 지정 생성자를 구현시 상속 조건과는 맞지 않아 `required init(name:)`을 상속 받을 수 없다. 따라서 자식 클래스에서 필수로 정의 해줘야 함
3. NSCoder은 storyBoard 와 같은 UI VIew xml에서 데이터를 가져와 ViewController에서 코드로 조작? 가능하게 해주는 것이기 때문에 아래와 같이 가져와 사용된다.

```swift
required init?(coder aDecoder: NSCoder) {
    super.init(coder: coder)
}
```