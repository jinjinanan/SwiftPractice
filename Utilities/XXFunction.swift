//
//  XXFunction.swift
//  Practice
//
//  Created by 陈林波 on 2020/9/24.
//

import Foundation
import UIKit
import RxSwift
import Moya
import HandyJSON



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

func DLog(_ items: Any..., separator: String = " ", terminator: String = "\n")
{
    
    #if DEBUG
    
    print(items, separator: separator, terminator: terminator)
    
    #endif
    
    
}





