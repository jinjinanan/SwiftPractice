//
//  XXFunction.swift
//  Practice
//
//  Created by 陈林波 on 2020/9/24.
//

import Foundation
import UIKit


func fetchtimeInterval() -> String {
    let date = Date.init()
    return String.init(date.timeIntervalSince1970)
}

func fetchCurrentLanuage() -> String {
    return "en"
}

func fetchAppVersion() -> String {
    return "2.0.0"
}

func fetchOSType() -> String {
    return "2"
}

func fetchOSVersion() -> String {
    return UIDevice.current.systemVersion
}

func fetchUUID() -> String {
    return UIDevice.current.identifierForVendor?.uuidString ?? ""
}

func fetchPhoneType() -> String {
    return "iOS"
}

func fetchPhoneOsVersion() -> String {
    return "iOS\(fetchOSVersion())"
}

func fetchUTC() -> String
{
    String.init(TimeZone.current.secondsFromGMT())
}



/**
// app包名
// */
//func appPackageName() -> String? {
//    return Bundle.main.object(forInfoDictionaryKey: "CFBundleExecutable") as? String
//}
//
///**
// 包装控制器名称
// 主要用于字符串装控制器
// */
//func mapAppPackageName(_ target:String) -> String? {
//    if target.isEmpty {
//        return appPackageName()
//    }
//    var packageName = appPackageName()
//    packageName = packageName?.replacingOccurrences(of: "-", with: "_")
//    return packageName! + "." + target
//}
