## 🤔 SceneDelegate **

SceneDelegate에서 의존성을 ContactListView에 부여하는 방식
```swift
class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let contactListStorage = ContactListStorage()
        더미데이터(Storage: contactListStorage)
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)

        let firstViewController = storyBoard.instantiateViewController(identifier: "ContactListView") { coder in
            return ContactListView.init(coder: coder, contactListStorage: contactListStorage)
        }
        
        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = firstViewController
        window.makeKeyAndVisible()
        self.window = window
    }
}
```