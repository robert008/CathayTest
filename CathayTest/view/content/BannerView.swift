//
//  BannerView.swift
//  CathayTest
//
//  Created by tinghui Chuang on 2024/10/10.
//

import UIKit

class BannerView: UIView , UIScrollViewDelegate{

    var bannerList : [BannerList] = []
    var mScrlV:UIScrollView!
    var pageControl:UIPageControl!
    var emptyLabel:UILabel!
    var timer:Timer!

    func initViews(wid:CGFloat){
        setWidth(width: wid)
        
        emptyLabel = UILabel.init(frame: CGRect(x: 0, y: 0, width: wid, height: getHeight()))
        emptyLabel.textAlignment = .center
        emptyLabel.backgroundColor = UIColor.init(hexString: "#cccccc")
        emptyLabel.cornored()
        emptyLabel.text = "AD"
        emptyLabel?.layer.masksToBounds = true
        emptyLabel.setMargin(left: 10, right: 10, top: 20, bottom: 20)
        emptyLabel.textColor = .white
        addSubview(emptyLabel)
        
        mScrlV = UIScrollView.init(frame: CGRect(x: 0, y: 0, width: wid, height: getHeight()))
        addSubview(mScrlV)
        mScrlV.isPagingEnabled = true
        mScrlV.delegate = self
        
        pageControl = UIPageControl()
        pageControl.frame = CGRect(x: 0, y: getHeight() - 30, width: getWidth(), height: 30)
        pageControl.numberOfPages = 0
        pageControl.currentPage = 0
        
        mScrlV.isHidden = true
        pageControl.isHidden = true
        pageControl?.addTarget(self, action: #selector(pageChanged), for: .valueChanged)
        
        addSubview(pageControl!)
        
    }
    
    func reloadBannerContent(){
        
        if !bannerList.isEmpty {
            let baseWid = getWidth()
            emptyLabel.isHidden = true
            mScrlV.isHidden = false
            mScrlV.subviews.forEach({ $0.removeFromSuperview() })
            mScrlV.contentSize = CGSize(width: baseWid * CGFloat(bannerList.count) , height: getHeight())
            pageControl.isHidden = false

            for i in 0..<bannerList.count{
                let imgV:UIImageView  = UIImageView.init(frame: CGRect(x: CGFloat(i) * baseWid, y: 0, width: baseWid, height: getHeight()));
                imgV.setMarginAll(offset: 5)
                imgV.backgroundColor = .clear
                mScrlV.addSubview(imgV)
                let item:BannerList = bannerList[i]
                imgV.downloaded(from: item.linkUrl ?? "")
            }
            pageControl.numberOfPages = bannerList.count
            startTimer()
        }
        else {
            emptyLabel.isHidden = false
            mScrlV.isHidden = true
            pageControl.isHidden = true
            stopTimer()
        }
    }
    
    //MARK: network request

    func reqFetchBannerList(){
        let url = "https://willywu0201.github.io/data/banner.json"
        NetworkManager.shared.fetchBannerList(from: url) { [self] isSuccess, list, des in
//            print("reqFetchBannerList : \(des)")
            if isSuccess {
                bannerList = list ?? []
                DispatchQueue.main.async {
                    self.reloadBannerContent()
                }
            }
        }
    }

    //MARK: page control

    @objc func pageChanged() {
        setScrollPageOffset(page: pageControl!.currentPage)
    }

    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let page = Int(round(scrollView.contentOffset.x/scrollView.frame.width))
        pageControl?.currentPage = page
        let offset = CGPoint(x: CGFloat(page)*scrollView.frame.width, y: 0)
        scrollView.setContentOffset(offset, animated: true)
    }
    
    func setScrollPageOffset(page:Int){
        let offset = CGPoint(x: (mScrlV?.frame.width)! * CGFloat(page), y: 0)
        mScrlV?.setContentOffset(offset, animated: true)
    }

    //MARK: timer
    
    func startTimer(){
        stopTimer()
        timer = Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(fireTimer), userInfo: nil, repeats: true)
    }
    
    func stopTimer(){
        if timer != nil {
            timer.invalidate()
            timer = nil
        }
    }
    
    @objc func fireTimer(){
        print("fire timer")
        if !bannerList.isEmpty {
            print("current page \(pageControl!.currentPage)")
            print("bannerList count \(bannerList.count)")
            if pageControl!.currentPage >= (bannerList.count - 1) {
                setScrollPageOffset(page: 0)
                pageControl.currentPage = 0
            }
            else {
                let page = pageControl!.currentPage + 1
                pageControl.currentPage = page
                setScrollPageOffset(page: page)
            }
        }
    }
    
}
