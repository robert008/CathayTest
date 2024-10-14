//
//  BottomView.swift
//  CathayTest
//
//  Created by tinghui Chuang on 2024/10/12.
//

import UIKit

class BottomView: UIView {

    
    func initViews(wid:CGFloat){
        setWidth(width: wid)
        frame = CGRect(x: 0, y: CstFunc.getWinHeight() - getHeight() - 30, width: wid, height: getHeight())
        setMargin(left: 30, right: 30, top: 0, bottom: 0)
        cornorAndShadow(radius: getHeight() / 2)
        createBtn()
    }
    
    func createBtn(){
        let wid = getWidth() / 4
        let imgNmArr:[String] = ["icTabbarHomeActive","icTabbarAccountDefault","icTabbarLocationActive","group"]
        let titleArr:[String] = ["Home","Account","Location","Service"]
        for i in 0...3 {
            let btn:UIButton = UIButton(type: .custom)
            btn.frame = CGRect(x: CGFloat(i) * wid, y: 0, width: wid, height: getHeight())
            let img:UIImage = UIImage(named: imgNmArr[i])!
            
            let tit:String = titleArr[i]
            var color:UIColor = .black
            if i == 0 {
                color = .orange
            }
            btn.setImageAboveTitle(image: img, title: tit ,titleColor: color ,font: UIFont.systemFont(ofSize: 10) )
            btn.imageView?.contentMode = .scaleAspectFit
            addSubview(btn)
        }
    }
}
