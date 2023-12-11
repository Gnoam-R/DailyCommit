## 쥬스 프로젝트 step-2

### IBAction이 끊어지지 않아 오류가 발생

- IBAction으로 묶어서 코드에 전달하게 되면 코드를 지운다 하더라도 묶어논 액션이 사라지지 않은 오류가 나타난다
- 해결 방법은 다음과 같다 main의 controller의 첫번째 버튼을 컨트롤 클릭을 누르고 맥 밑에 있는 액션을 제거하면 성공이다. 아래는 방법을 찾은 블로그이다.

[[Xcode 오류] terminating with uncaught exception of type NSException](https://velog.io/@rubyy/Xcode-오류-terminating-with-uncaught-exception-of-type-NSException)

### 다수의 버튼을 IB Action 하나로 사용하는 방법

- 다수의 UIButton이 존재하는 경우 각각의 버튼에 IBAction을 만들게 되면 너무 많은 버튼 액션이 만들어지게 될 우려가 있는데 동일한 기능을 하는 버튼의 경우 하나의 버튼으로 묶어서 사용할 수 있는 방법이 있음

[UI Button - 비슷한 여러 버튼이 있을 때 Tag 기능으로 코드 라인 줄이기](https://g1embed.tistory.com/8)

```swift
guard let mvToStoreViewController = self.storyboard?.instantiateViewController(withIdentifier: "View Controller") else {return}
        self.navigationController?.pushViewController(mvToStoreViewController, animated: true)
```

## collection에 value를 가져올때 옵셔널로 반환됨

```swift
var FruitValue = self.store.fruits[fruit]
```

![Untitled](https://prod-files-secure.s3.us-west-2.amazonaws.com/c6b4dd80-7f00-4276-8157-7d4dc020a261/fce53f6f-708f-4d24-929c-56e006e0b36e/Untitled.png)

이유를 잘 모르겠다.  모든 컬랙션은 다 value를 가져올때 옵셔널 처리를 진행해야되는거 같음
