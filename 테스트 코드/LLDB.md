- ViewController.swift 파일의 23번째 줄에 브레이크 포인트를 설정하려면 입력해야 하는 LLDB 명령어는?
    
    ▶️ br s --file ViewController.swift --line 23
    
- `changeTextColor`라는 심볼에 브레이크 포인트를 설정하기 위해 입력해야 하는 LLDB 명령어는?
    
    ▶️ breakpoint set --name changeTextColor
    
- LLDB의 특정 명령어의 별칭을 설정해줄 수 있는 명령어는 무엇일까요?
    
    ▶️ command alias 별명 "줄이고 싶은 Command”
    
- Breakpoint Navigator를 통해 `titleLabel`의 `text`가 `"두 번째 뷰 컨트롤러!"`인 경우에만 작동을 일시정지하고 `titleLabel`의 `text`를 출력하는 액션을 실행하도록 설정해보세요
    
    ▶️ breakpoint set --file ViewController.swift --line 19 -c titleLabel.text == “두 번째 뷰 컨트롤러!” -C po titleLabel.text
    
    ![image](https://github.com/Gnoam-R/DailyCommit/assets/67363759/7ac17598-b0fc-4647-a1ad-d9f5a5934398)
    
- 오류(Error) 혹은 익셉션(Exception)이 발생한 경우 프로세스의 동작을 멈추도록 하는 방법에 대해 알아봅시다
    
    ▶️  Exception Breakpoint 생성하기!!!!! 
    
    [Swift Error and Exception Breakpoints](https://cocoacasts.com/debugging-applications-with-xcode-swift-error-and-exception-breakpoints)
    
- View Controller의 뷰 위에는 사용자 눈에 보이지 않는 뷰가 있습니다. 이 뷰의 오토레이아웃 제약을 확인해서 알려주세요
    
    ▶️  expression self.emptyView
    
    po self.view
    
    - 결과 !!!!!!!!!!!!!!!!!!!!!!
        
        ```swift
        expression self.emptyView
        (UIView?) $R0 = 0x00007fdca5e07370 {
          baseUIResponder@0 = {
            baseNSObject@0 = {
              isa = UIView
            }
          }
          _constraintsExceptingSubviewAutoresizingConstraints = 0x0000600002bd4720 1 element
          _cachedTraitCollection = some {
            some = 0x00006000019bde00 {
              baseNSObject@0 = {
                isa = UITraitCollection
              }
              _clientDefinedTraits = 0x0000000000000000
              _environmentWrapper = 0x0000000000000000
              _tintColor = some {
                some = 0x00006000030c1a00 {
                  baseUIDynamicColor@0 = {
                    baseUIColor@0 ={...}
                  }
                  _cuiColorName = 7
                  _cachedColor = 0x0000000000000000
                  _cachedThemeKey = 0
                }
              }
            }
          }
          _animationInfo = 0x0000000000000000
          _layerRetained = 0x0000000000000000
          _subviewCache = 0x0000000000000000
          _window = 0x0000000000000000
          _gestureRecognizers = 0x0000000000000000
          _viewDelegate = 0x0000000000000000
          _layoutEngineWidth = 0
          _unsatisfiableConstraintsLoggingSuspensionCount = 0
          _pseudo_id = 22
          _retainCount = 0
          _draggingSourceDelegate = 0x0000000000000000
          _layer = some {
            some = 0x00006000025b39c0 {
              baseNSObject@0 = {
                isa = CALayer
              }
            }
          }
          _intermediateLayer = 0x0000000000000000
          _intermediateLayerRetained = 0x0000000000000000
          _privateSubviews = 0x0000000000000000
          _effectHost = 0x0000000000000000
          _captureGroupName = 0x0000000000000000
          _tintAdjustmentDimmingCount = 0
          _layoutSubviewsCount = 0
          _imminentLayoutSubviewsCount = 0
          _countOfFocusedAncestorTrackingViewsInSubtree = 0
          _layoutMarginsGuide = 0x0000000000000000
          _minXVariable = 0x0000000000000000
          _minYVariable = 0x0000000000000000
          _boundsWidthVariable = 0x0000000000000000
          _boundsHeightVariable = 0x0000000000000000
          _layoutEngine = 0x0000000000000000
          _stashedLayoutVariableObservations = 0x0000000000000000
          _internalConstraints = 0x0000000000000000
          _safeAreaLayoutGuide = 0x0000000000000000
          _keyboardLayoutGuide = 0x0000000000000000
          _readableContentGuide = 0x0000000000000000
          __preferedContentsFormat = 0
          __lastNotifiedTraitCollection = some {
            some = 0x00006000019bde00 {...}
          }
          __alignmentRectOriginCache = 0x0000000000000000
        }
        ```
        
- 디버그 모드로 실행중인 상태에서 사용자 눈에 보이지 않는 뷰의 색상을 파란색으로 변겅해보세요
    
    ```
    expression self.emptyView
    expression $R0!.backgroundColor = UIColor.systemBlue
    continue
    ```
    
![image](https://github.com/Gnoam-R/DailyCommit/assets/67363759/503561cc-0aef-471d-a6ab-332a7b16f7f6)
    
    짠  
    
- LLDB의 `v`, `po`, `p` 명령어의 차이에 대해 알아봅시다
    - `po`: Print object description of “words”해당 유형의 인스턴스에 대한 객체 설명이 반환. top-level description은 기본값을 제공하지만 CustomDebugStringConvertible 프로토콜을 채택하여 customize도 가능
    - `p`: Evaluate the expression “words”임의의 표현식을 평가주어진 프롬포트에서 컴파일되는 모든 것을 주석에 인수로 전달할 수 있음
    - `v`: Display the variable “words”
- 두 번째 뷰 컨트롤러의 뷰가 화면에 표시된 상태에서, 두 번째 뷰 컨트롤러 까지의 메모리 그래프를 캡쳐해보세요

![image](https://github.com/Gnoam-R/DailyCommit/assets/67363759/83035995-43b5-44ac-8dd9-a5b188087648)