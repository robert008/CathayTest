//
//  FuncButtonView.swift
//  CathayTest
//
//  Created by tinghui Chuang on 2024/10/10.
//

import UIKit

class FuncButtonView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
        super.init(coder: coder)
        print("init with coder")
        print("width : \(getWidth())")

    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        // 此時 frame 已經設置為最終值
        print("layoutSubviews width : \(getWidth())")

    }
    
    

    
    func initViews(wid:CGFloat){
        setWidth(width: wid)
        
        
        let imgs = ["button00ElementMenuTransfer", "button00ElementMenuPayment", "button00ElementMenuUtility", "button01Scan", "button00ElementMenuQRcode", "button00ElementMenuTopUp"]
        let titles = ["Transfer", "Payment", "Utility", "QR pay Scans...", "My QR code", "Top up"]

        // create buttons
        let baseWid:CGFloat = wid / 3
        let baseHei:CGFloat = getHeight() / 2
        
        for i in 0...5 {
            let r = i / 3
            let c = i % 3

            let btn:UIButton = UIButton(type: .custom)
            btn.frame = CGRect(x: CGFloat(c) * baseWid, y: CGFloat(r) * baseHei, width: baseWid, height: baseHei)
            let img:UIImage! = UIImage.init(named: imgs[i])
            let title:String = titles[i]
            btn.setImageAboveTitle(image: img, title: title,titleColor: UIColor(red: 85/255, green: 85/255, blue: 85/255, alpha: 1.0))
            addSubview(btn)
        }
        
    }

}
