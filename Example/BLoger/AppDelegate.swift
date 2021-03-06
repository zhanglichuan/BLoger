//
//  AppDelegate.swift
//  BLoger
//
//  Created by ok@linbok.com on 03/26/2019.
//  Copyright (c) 2019 ok@linbok.com. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        // 初始化LOG
        let config = BLogConfig()
        // config.maxMessageSize = 500 // 每条message最大字符限制,会把回车转空格
        BLoger.shared.start(config)
        BLoger.shared.shankShow = true // 摇一摇显示LogView
        
        // 验证日志格式
        BLog()
        BLog_v("Verbose")
        BLog_d("Debug")
        BLog_i("Info")
        BLog_w("Warn")
        BLog_e("Error")
        BLog_g()
        
        BLog("------------启动应用---------------")
        BLog_i(BLoger.shared.fileLogger.currentLogFileInfo.description) // Log文件信息
    
        BLogAutoTask.shared.start()
        BLoger.shared.shankShow = true
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
        BLog("------------切到后台---------------")

    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
        BLog("------------切到前端---------------")

    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

