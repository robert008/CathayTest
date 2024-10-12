//
//  NotificationListViewController.swift
//  CathayTest
//
//  Created by tinghui Chuang on 2024/10/9.
//

import UIKit

class NotificationListViewController: UIViewController , UITableViewDataSource , UITableViewDelegate {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return messageList.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell:NotificationCell = tableView.dequeueReusableCell(withIdentifier: "NotificationCell", for: indexPath) as! NotificationCell
////
////        let item:JSON = dataArray[indexPath.row]
//        return cell
//
//    }
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 200
//    }
    

    @IBOutlet var titLabel:UILabel!
    @IBOutlet var backBtn:UIButton!
    @IBOutlet var mTableV:UITableView!

    var messageList:[Messages] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        initViews()
    }
    
    func initViews(){
        titLabel.frame = CGRect(x: 0, y: CstFunc.getStatBarHeight(), width: CstFunc.getWinWidth(), height: 50)
        backBtn.frame = CGRect(x: 0, y: CstFunc.getStatBarHeight(), width: 50, height: 50)
        mTableV.frame = CGRect(x: 0, y: titLabel.getBottom(), width: CstFunc.getWinWidth(), height: CstFunc.getWinHeight() - titLabel.getBottom())
        mTableV.register(UINib(nibName: "NotificationCell", bundle: nil), forCellReuseIdentifier: "NotificationCell")
        mTableV.dataSource = self
        mTableV.delegate = self
    }
    
    @IBAction func pressBackBtn(btn:UIButton){
        self.navigationController?.popViewController(animated: true)
    }
    
    //MARK: table view delegate
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let cell:NotificationCell = tableView.dequeueReusableCell(withIdentifier: "NotificationCell", for: indexPath) as! NotificationCell
        let item:Messages = messageList[indexPath.row]
        cell.setupData(msg: item)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messageList.count
    }


}
