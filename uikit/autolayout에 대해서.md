## 오늘 학습 내용

- Auto Layout 예습
    - 내가 이해한 바로는 뷰에 적용된 제약 조건(constraint), Priority를 기반으로 뷰의 위치가 동적으로 할당되는 것을 Auto Layout이라고 부른다.
    - 상위 뷰에 Constraint로 연결하여 사용함.
    - 뷰 간의 우선순위에 따라 우선 순위가 낮은 뷰의 Constraint가 무시되어 사용될수 있음. 만약 우선 순위가 같고 Constraint가 정상적인 경우가 아니면 충돌 발생
    - Content compression, hugging은 뷰가 외부에 압력(설정한 크기보다 작아질수 있는 힘)에 버티는 힘과 늘어나지(설정한 크기보다 커질 수 있는 힘)않는 힘이다.
