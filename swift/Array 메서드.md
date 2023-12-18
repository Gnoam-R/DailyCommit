## 배열 안전하게 조회하기

### `indices`

- Collection 타입의 프로퍼티이다
- Collection의 유효 범위를 갖고 있는 프로퍼티
- 예외처리가 필요하지 않음
```swift
let arr = [1, 2, 3, 4, 5]

for i in 0...5 {
	print(arr[i])
}
```
