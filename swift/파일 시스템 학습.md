
## iOS 파일 시스템 관련 학습 내용 정리

- **Bundle Container**
    - 앱과 모든 리소스가 포함되어 있습니다.
    - 이 디렉토리의 내용은 itunes나 iCloud에 백업되지 않습니다.
- **Data Container**
    - Documents
        - 이 디렉토리에는 사용자 생성 콘텐츠가 저장됩니다.
        - itunes와 iCloud에 의해 백업이 가능하며 사용자에게 노출되고 싶은 파일만 포함되어야 합니다.
        - 사용자가 수정 / 추가 / 삭제 가능 합니다
    - Library
        - 사용자에게 노출하고 싶지 않은 파일에 대해 이 디렉토리를 사용합니다
        - Application Support
            - 애플리케이션 생성 데이터, 관리용 데이터를 저장합니다.
            - 사용자에게 보여지지 않는 사용자 기록을 남기는 공간입니다.
        - Caches
            - 반복 사용 임시 데이터를 저장합니다
            - 디스크 용량 부족시 시스템에서 자동으로 데이터를 삭제합니다
        - Preferences
            - 애플리케이션 설정 데이터 저장
    - tmp
        - 재사용 하지 않는 임시 데이터를 저장합니다
        - 시스템이 주기적으로 데이터를 삭제합니다.
- **iCloud Container**

- SandBox
    - 샌드 박스 구조

    ![Untitled](https://prod-files-secure.s3.us-west-2.amazonaws.com/c6b4dd80-7f00-4276-8157-7d4dc020a261/8ed7c1cd-747f-4c89-ac68-c122da20f658/Untitled.png)
    
    ![Untitled](https://prod-files-secure.s3.us-west-2.amazonaws.com/c6b4dd80-7f00-4276-8157-7d4dc020a261/3dfff54e-d919-4456-8be4-7973d3c06373/Untitled.png)
    
    -
