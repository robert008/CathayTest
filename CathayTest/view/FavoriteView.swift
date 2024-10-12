//
//  FavoriteView.swift
//  CathayTest
//
//  Created by tinghui Chuang on 2024/10/10.
//

import UIKit

class FavoriteView: UIView {

    var favoList : [FavoriteList] = []
    let iconDict:[String:String] =
    [
        "CUBC":"button00ElementScrollTree",
        "Mobile":"button00ElementScrollMobile",
        "PMF":"button00ElementScrollBuilding",
        "CreditCard":"button00ElementScrollCreditCard",
    ]
    var mScrlV:UIScrollView!
    @IBOutlet var moreV:UIView!

    func initViews(wid:CGFloat){
        setWidth(width: wid)
        
        moreV.setAlignToRight(offset: 24)
        mScrlV = UIScrollView.init(frame: CGRect(x: 0, y: 40, width: wid, height: getHeight() - 40))
        addSubview(mScrlV)
        mScrlV.backgroundColor = CstFunc.getColorBgGrey()
        mScrlV.isHidden = true
    }

    
    func reqFetchFavoriteList(url:String){
        NetworkManager.shared.fetchFavoriteList(from: url) { [self] isSuccess, list, des in
//            print("reqFetchFavoriteList : \(des)")
            if isSuccess {
                favoList = list ?? []
                DispatchQueue.main.async {
                    self.reloadFavoContent()
                }
            }
        }
    }
    
    func reloadFavoContent(){
        if !favoList.isEmpty {
            let baseWid = mScrlV.getHeight()
            
            mScrlV.isHidden = false
            mScrlV.subviews.forEach({ $0.removeFromSuperview() })
            mScrlV.contentSize = CGSize(width: baseWid * CGFloat(favoList.count) , height: baseWid)

            for i in 0..<favoList.count{
                let btn:UIButton = UIButton(type: .custom)
                btn.frame = CGRect(x: baseWid * CGFloat(i), y: 0, width: baseWid, height: baseWid)
                mScrlV.addSubview(btn)
                btn.setMarginAll(offset: 3)
                let item:FavoriteList = favoList[i]
                let transType = item.transType ?? "CUBC"
                let imgStr:String = iconDict[transType]!
                let nickname = item.nickname ?? ""
                btn.setImageAboveTitle(image: UIImage.init(named: imgStr), title: nickname,titleColor: UIColor(red: 85/255, green: 85/255, blue: 85/255, alpha: 1.0),font: UIFont.systemFont(ofSize: 12))
            }
        }
        else {
            mScrlV.isHidden = true

        }

    }
    

}
