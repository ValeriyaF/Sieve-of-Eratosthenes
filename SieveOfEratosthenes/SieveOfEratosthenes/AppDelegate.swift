import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        
        let rootViewController = ViewController.init(nibName: nil, bundle: nil)
        let presenter = Presenter(view: rootViewController)
        rootViewController.presenter = presenter
        
        window?.rootViewController = rootViewController
        window?.makeKeyAndVisible()

        return true
    }



}

