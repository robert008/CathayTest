//
//  AmountView.swift
//  CathayTest
//
//  Created by tinghui Chuang on 2024/10/9.
//

import UIKit

class AmountView: UIView {

    @IBOutlet var eyeBtn:UIButton!
    @IBOutlet var usdLabel:UILabel!
    @IBOutlet var khrLabel:UILabel!
    var savingList : [SavingsList] = []
    var digitList : [DigitalList] = []
    var fdList : [FixedDepositList] = []
    var sumUSD:Double = 0;
    var sumKHR:Double = 0;
    var reqCount = 0
    let animationV = GradientAnimationView()


    func initViews(wid:CGFloat){
        setWidth(width: wid)
        eyeBtn.addTarget(self, action: #selector(didSelectEyeButton), for: .touchUpInside)
        animationV.translatesAutoresizingMaskIntoConstraints = false
        animationV.frame = CGRect(x: 0, y: 0, width: getWidth(), height: getHeight())
    }

    
    func firstLaunchRequest(){
//        let gradientView = GradientAnimationView()
//        gradientView.translatesAutoresizingMaskIntoConstraints = false
//        addSubview(gradientView)
//
//        // 設置約束，使其填滿整個視圖
//        NSLayoutConstraint.activate([
//            gradientView.topAnchor.constraint(equalTo: topAnchor),
//            gradientView.bottomAnchor.constraint(equalTo: bottomAnchor),
//            gradientView.leadingAnchor.constraint(equalTo: leadingAnchor),
//            gradientView.trailingAnchor.constraint(equalTo: trailingAnchor)
//        ])
//
//        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
////            gradientView.stopAnimating()
//        }

        addSubview(animationV)
        reqCount = 0

        //usd
        reqFetchSavingList(url: "https://willywu0201.github.io/data/usdSavings1.json")
        reqFetchDepositList(url: "https://willywu0201.github.io/data/usdFixed1.json")
        reqFetchDigitalList(url: "https://willywu0201.github.io/data/usdDigital1.json")
        
        //khr
        reqFetchSavingList(url: "https://willywu0201.github.io/data/khrSavings1.json")
        reqFetchDepositList(url: "https://willywu0201.github.io/data/khrFixed1.json")
        reqFetchDigitalList(url: "https://willywu0201.github.io/data/khrDigital1.json")

    }

    func secLaunchRequest(){
        //reset sum
        sumKHR = 0
        sumUSD = 0
        reqCount = 0
        addSubview(animationV)

        //usd
        reqFetchSavingList(url: "https://willywu0201.github.io/data/usdSavings2.json")
        reqFetchDepositList(url: "https://willywu0201.github.io/data/usdFixed2.json")
        reqFetchDigitalList(url: "https://willywu0201.github.io/data/usdDigital2.json")
        
        //khr
        reqFetchSavingList(url: "https://willywu0201.github.io/data/khrSavings2.json")
        reqFetchDepositList(url: "https://willywu0201.github.io/data/khrFixed2.json")
        reqFetchDigitalList(url: "https://willywu0201.github.io/data/khrDigital2.json")

    }

    
    func reqFetchSavingList(url:String){
        NetworkManager.shared.fetchSavingList(from: url) { [self] isSuccess, list, des in
            print("reqFetchSavingList : \(des)")
            if isSuccess {
                calSummary(savingList: list, digitalList: nil, depositList: nil)
            }
            reqCount += 1
        }
    }
    
    func reqFetchDepositList(url:String){
        NetworkManager.shared.fetchDepositList(from: url) { [self] isSuccess, list, des in
            print("reqFetchDepositList : \(des)")
            if isSuccess {
                calSummary(savingList: nil, digitalList: nil, depositList: list)
            }
            reqCount += 1
        }
    }

    func reqFetchDigitalList(url:String){
        NetworkManager.shared.fetchDigitalList(from: url) { [self] isSuccess, list, des in
            print("reqFetchDigitalList : \(des)")
            if isSuccess {
                calSummary(savingList: nil, digitalList: list, depositList: nil)
            }
            reqCount += 1
        }
    }

    func calSummary(savingList:[SavingsList]? , digitalList:[DigitalList]? , depositList:[FixedDepositList]?){
    
        if savingList != nil {
            for i in 0..<savingList!.count {
                let item = savingList![i]
                let curr = item.curr
                if curr == "USD" {
                    sumUSD = sumUSD + (item.balance ?? 0)
                }
                else {
                    sumKHR = sumKHR + (item.balance ?? 0)
                }
            }
        }
        
        if digitalList != nil {
            for i in 0..<digitalList!.count {
                let item = digitalList![i]
                let curr = item.curr
                if curr == "USD" {
                    sumUSD = sumUSD + (item.balance ?? 0)
                }
                else {
                    sumKHR = sumKHR + (item.balance ?? 0)
                }
            }

        }
        
        if depositList != nil {
            for i in 0..<depositList!.count {
                let item = depositList![i]
                let curr = item.curr
                if curr == "USD" {
                    sumUSD = sumUSD + (item.balance ?? 0)
                }
                else {
                    sumKHR = sumKHR + (item.balance ?? 0)
                }
            }

        }

        print("sumUSD : \(sumUSD)")
        print("sumKHR : \(sumKHR)")
        DispatchQueue.main.async { [self] in
            self.reloadSummary()
        }

    }
    
    func reloadSummary() {
        if reqCount == 6 {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) { // 只少跑1.5秒
                self.animationV.removeFromSuperview()
            }
        }

        if eyeBtn.isSelected {
            usdLabel.text = "********"
            khrLabel.text = "********"
        }
        else {
            usdLabel.text = formatDouble(sumUSD)
            khrLabel.text = formatDouble(sumKHR)
        }

    }
    
    func formatDouble(_ value: Double) -> String {
        if value == floor(value) {
            return String(format: "%.0f", value)
        } else {
            return String(value)
        }
    }

    @objc func didSelectEyeButton() {
        eyeBtn.isSelected = !eyeBtn.isSelected
        reloadSummary()
    }

    
}


