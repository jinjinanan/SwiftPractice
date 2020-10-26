//
//  XXTabBarController.swift
//  Practice
//
//  Created by 陈林波 on 2020/9/24.
//

import UIKit
//import KakaJSON
//
//struct Cat:Convertible {
//    var name: String = ""
//    var weight: Double = 0.0
//}
//
//let json: [String: Any] = [
//    "name": "Miaomiao",
//    "weight": 6.66
//]

class XXTabBarController: UITabBarController {

    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.setupBaseViewController()
    }
    

    func setupBaseViewController()
    {
        
        self.buildChildVC(childVCCls: ViewController.self, title: "UI", imageName: "me", selectedImageName: "bookhoom_click")
        self.buildChildVC(childVCCls: XXBaseViewController.self, title: "算法", imageName: "bookshop", selectedImageName: "bookshop_click")
    }
    
    func buildChildVC(childVCCls:AnyClass,title:String,imageName:String,selectedImageName:String)
    {
        if let type = childVCCls as? XXBaseViewController.Type
        {
            let instance = type.init()
            instance.tabBarItem = UITabBarItem.init(title: title, image: UIImage.init(named: imageName), selectedImage: UIImage.init(named:selectedImageName))
            let nav : XXNavigationViewController = XXNavigationViewController.init(rootViewController: instance)
            self.addChild(nav)
        }
        
    }

}

/**
 app包名
 */
func appPackageName() -> String? {
    return Bundle.main.object(forInfoDictionaryKey: "CFBundleExecutable") as? String
}

/**
 包装控制器名称
 主要用于字符串装控制器
 */
func mapAppPackageName(_ target:String) -> String? {
    if target.isEmpty {
        return appPackageName()
    }
    var packageName = appPackageName()
    packageName = packageName?.replacingOccurrences(of: "-", with: "_")
    return packageName! + "." + target
}
