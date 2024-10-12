//
//  FirstViewController.swift
//  CathayTest
//
//  Created by tinghui Chuang on 2024/10/9.
//

import UIKit

class FirstViewController: UIViewController {
    
    
    var mScrlV:UIScrollView!
    @IBOutlet var contV:UIView!
    @IBOutlet var amountV:AmountView!
    @IBOutlet var fbContV:FuncButtonView!
    @IBOutlet var bannerContV:BannerView!
    @IBOutlet var favoContV:FavoriteView!
    @IBOutlet var topContV:TopBarView!
    @IBOutlet var btmV:BottomView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        initViews()
        firstLaunchRequest()
    }
    
    func initViews(){
        
        view.backgroundColor = CstFunc.getColorBgGrey()
        contV.backgroundColor = CstFunc.getColorBgGrey()
        mScrlV = UIScrollView.init(frame: CGRect(x: 0, y: CstFunc.getStatBarHeight(), width: CstFunc.getWinWidth(), height: CstFunc.getWinHeight()))
        mScrlV.contentSize = CGSize.init(width: CstFunc.getWinWidth(), height: contV.getHeight())
        view.addSubview(mScrlV)
        mScrlV.refreshControl = UIRefreshControl()
        mScrlV.refreshControl?.addTarget(self, action:#selector(didPullRefreshControl),for: .valueChanged)
        mScrlV.addSubview(contV)
        contV.setWidth(width: mScrlV.getWidth())
        contV.backgroundColor = CstFunc.getColorBgGrey()
        
        // set content view init width
        topContV.initViews(wid: mScrlV.getWidth())
        fbContV.initViews(wid: mScrlV.getWidth())
        favoContV.initViews(wid: mScrlV.getWidth())
        bannerContV.initViews(wid: mScrlV.getWidth())
        amountV.initViews(wid: mScrlV.getWidth())
        
        view.addSubview(btmV)
        btmV.initViews(wid: mScrlV.getWidth())
        
        topContV.notificationBtn.addTarget(self, action: #selector(didPressNotifiBtn), for: .touchUpInside)
        
    }
    
    @objc func didPressNotifiBtn() {
        let vc:NotificationListViewController = NotificationListViewController.init(nibName: "NotificationListViewController", bundle: nil)
        vc.messageList = topContV.messageList
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func didPullRefreshControl() {
        DispatchQueue.main.async { [self] in
            mScrlV.refreshControl?.endRefreshing()
            bannerContV.reqFetchBannerList()
            favoContV.reqFetchFavoriteList(url:  "https://willywu0201.github.io/data/favoriteList.json")
            topContV.reqFetchNotificationList(url: "https://willywu0201.github.io/data/notificationList.json")

            amountV.secLaunchRequest()
        }
    }
    
    
    func firstLaunchRequest() {
        topContV.reqFetchNotificationList(url: "https://willywu0201.github.io/data/emptyNotificationList.json")
        favoContV.reqFetchFavoriteList(url:  "https://willywu0201.github.io/data/emptyFavoriteList.json")
        amountV.firstLaunchRequest()
    }
    

}
