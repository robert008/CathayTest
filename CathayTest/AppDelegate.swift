//
//  AppDelegate.swift
//  CathayTest
//
//  Created by tinghui Chuang on 2024/10/9.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var mWindow: UIWindow!
    var navi:UINavigationController!
    var firstVC:FirstViewController!


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        mWindow = UIWindow.init(frame: UIScreen.main.bounds)
        firstVC = FirstViewController.init(nibName: "FirstViewController", bundle: nil)
        navi = UINavigationController.init(rootViewController: firstVC!)
        navi.navigationBar.isHidden = true
        mWindow.rootViewController = navi
        navi.interactivePopGestureRecognizer?.isEnabled = false

        mWindow.makeKeyAndVisible()

        return true
    }


}

