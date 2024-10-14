//
//  TopBarView.swift
//  CathayTest
//
//  Created by tinghui Chuang on 2024/10/10.
//

import UIKit

class TopBarView: UIView {
    @IBOutlet var notificationBtn:UIButton!
    var messageList:[Messages] = []

    func initViews(wid:CGFloat){
        setWidth(width: wid)
        notificationBtn.setAlignToRight(offset: 24)
    }
    
    func reqFetchNotificationList(url:String){
        NetworkManager.shared.fetchNotificationList(from: url) { [self] isSuccess, list, des in
            print("reqFetchNotificationList : \(des)")
            if isSuccess {
                messageList = list ?? []
                DispatchQueue.main.async {
                    self.reloadNotificationSts()
                }
            }
        }
    }
    
    func reloadNotificationSts(){
        if messageList.isEmpty {
            notificationBtn.setImage(UIImage(named: "iconBell01Nomal"), for: .normal)
        }
        else {
            notificationBtn.setImage(UIImage(named: "iconBell02Active"), for: .normal)
        }
    }

    
}
