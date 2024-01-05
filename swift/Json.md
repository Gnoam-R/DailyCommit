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