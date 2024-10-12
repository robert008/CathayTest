//
//  Constant.swift
//  WellDoneExpress
//
//  Created by admin on 2020/2/27.
//  Copyright © 2020 robert. All rights reserved.
//

import Foundation

import UIKit
//import JGProgressHUD
//22.6497659,120.3465168


struct Cst {

    static let kAppUid = "kAppUid"
    static let kUserAccount = "kUserAccount"
    static let kUserPassword = "kUserPassword"
    static let kUserCompany = "kUserCompany"
    static let kUserName = "kUserName"
    static let kUserCarLicense = "kUserCarLicense"
    static let kUserSavePwd = "kUserSavePwd"
    static let kUserPushToken = "kUserPushToken"

}

class CstFunc
{
    static func genApiCode() ->String {
        var string = ""
        
        let formatter = DateFormatter()
        formatter.dateFormat = "MMdd"
        let dtString = formatter.string(from: Date.init())
        let paraInt = 2895
        let dtInt:Int = Int(dtString) ?? 0
        let total = String(paraInt * dtInt)
        let range = total.index(total.endIndex, offsetBy: -5) ..< total.endIndex
        let subStr = total[range]
        string = String.init(subStr)
        return string
    }
    
    static func getWinWidth() -> CGFloat {
        return UIScreen.main.bounds.size.width;
    }
    
    static func getWinHeight() -> CGFloat {
        return UIScreen.main.bounds.size.height;
    }
    
    static func checkDeiviceTypeX() -> Bool {
        let offsetTop:CGFloat = UIApplication.shared.keyWindow!.safeAreaInsets.top 
            
        if offsetTop > 20 {
            return true
        }
        
        return false
    }
    
    static func getStatBarHeight() -> CGFloat {
        if (self.checkDeiviceTypeX()) 
        {
            return 50
        }
        return 20
    }
    
    static func getViewContentHeight() -> CGFloat {
        if (self.checkDeiviceTypeX()) 
        {
            return self.getWinHeight() - 50
        }
        return self.getWinHeight() - 20
    }
    
    static func getColorYellow() -> UIColor {
        return UIColor.init(hexString: "fdb813")
    }

    static func getColorPurple() -> UIColor {
        return UIColor.init(hexString: "7d328f")
    }
    
    static func getColorBgGrey() -> UIColor {
        return UIColor.init(red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
    }

    
    static func date2String(_ date:Date, dateFormat:String = "yyyy-MM-dd HH:mm:ss") -> String {
        let formatter = DateFormatter()
        formatter.locale = Locale.init(identifier: "zh_CN")
        formatter.dateFormat = dateFormat
        let date = formatter.string(from: date)
        return date
    }
    
    static func string2Date(_ string:String, dateFormat:String = "yyyy-MM-dd HH:mm:ss") -> Date {
        let formatter = DateFormatter()
        formatter.locale = Locale.init(identifier: "zh_CN")
        formatter.dateFormat = dateFormat
        let date = formatter.date(from: string)
        return date!
    }
    
//    func showProgress(v:UIView) {
//        AppDelegate.shareDelegate().proHUD.show(in: v)
//    }
//    func dismissProgress() {
//        AppDelegate.shareDelegate().proHUD.dismiss()
//    }

}
