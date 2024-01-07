# Json

- sonDecoder
    - JsonDecoder의 decode기능을 사용하기 위해서 입력되는 jsonData와 변환 하고 싶은 자료형을 매개변수로 입력받음

```swift
let stringData =
    """
    [
        {
            "name": "알버트 아인슈타인",
            "occupation": "이론 물리학자",
            "birthplace": "독일",
            "works": "상대성 이론"
        },
        {
		]
		"""
// jsonData의 Data형식(utf-8)로 변환
guard let jsonData = stringData.data(using: .utf8) else {
    return
}

let decoder = JSONDecoder()
// JsonData에 []를 넣었는데 JsonData의 값이 배열로 이루어져 있기 때문에 자료형을 맞춰줘야 하는 필요가 있음
let object = try decoder.decode([JsonData].self, from: jsonData)

print(object)


/* 결과
Optional([tableView.JsonData(name: "알버트 아인슈타인", occupation: "이론 물리학자", birthplace: "독일", works: "상대성 이론"), tableView.JsonData(name: "마하트마 간디", occupation: "독립 운동 지도자", birthplace: "인도", works: "비폭력 저항"), tableView.JsonData(name: "마더 테레사", occupation: "로마 가톨릭 수녀", birthplace: "알바니아", works: "가난한 이들 돕기")])
*/
```


## 질문

1. gitignore란 무엇이고 왜 사용하셨나요?

.DS_Store는 어떤것이길래 gitignore에 추가해주셧나요?

```swift
프로젝트의 디렉토리 내에 존재하는 특정 파일들을 git에 업로드 하지 않는 기능 입니다.

.DS_Store는 맥에서 시스템 os가 finder로 파일에 접근하게 될때 생기는 파일이라고 알고 있습니다

프로젝트와는 별개의 파일이기 때문에 gitignore에 추가하게 되었습니다.
```

1. 다른 부분과는 맞지 않는 컨벤션으로 보여져요 ㅎㅎ 의도하신 부분인가요?

```swift
컨벤션이라는게 네이밍 관점이라면 아뇨 의도하지 않았고 네이밍 변경에 대한 생각이 부족했습니다
MainController라는 네이밍으로 변경해도 괜찮을거 같네요
```

1. 

ViewController는 현재 상속하고 있는 부분이 없어보여요. 다른부분과 다르게 final키워드를 사용하지 않는 이유가 있을까요?

또한 final 키워드에 대해서 설명해주시고, Performance 적인 부분에 있어서도 설명해주세요

```swift
final 키워드를 사용하는게 맞는 것 같습니다.
final은 유일한 클래스를 생성하기 위한 키워드로 붙이게 되면 다른 클래스에서 상속 받을 수 없습니다
성능 면에서는 final 키워드를 사용한 클래스가 런타임 시점에서 이점을 가지게 됩니다
final, private는 static Dispath로 컴파일 시기에 이미 호출이 정의된 메서드로 일반적인 Dinamic Dispath와는 달리 런타임 시기에서 호출이 정의되지 않기 때문입니다
 

```

[[iOS][Swift] Final 키워드에 관한 문법적 의미와 성능적 관점](https://itllbegone.tistory.com/10)

1. 

contacListStorage를 내부에서 들고 있는 형태를 가지네요?

D.I (Dependency Injection)에 대해서 공부해보시면 좋을 것 같아요.

D.I의 방법에대해 공부해보시고 저한테 소개해주시면 좋을 것 같아요.