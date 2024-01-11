## 🤔 **~= 연산자**

- 대상이 특정 범위에 속하는지 범위를 체크하는 연산자
- ~= 연산자의 우변이 좌변 안에 속하는지
```swift
// 숫자 5가 0~10 사이일 떄 10을 곱해주는 코드
var n = 5
if 0..<10 ~= n {
  n *= 10
}

print(n) // 50

// func에서 매개변수로 입력된 string 값을 찾는 코드

func checkLowercase(str: String) -> Bool {
  if "a"..."z" ~= str {
    // str contain lowercased alpabet
    return true
  } else {
    // Not found lowercased alpabet
    return false
  }
}

checkLowercase(str: "a") // true
checkLowercase(str: "aA") // true
checkLowercase(str: "A") // false
```