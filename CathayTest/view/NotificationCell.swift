//
//  NotificationCell.swift
//  CathayTest
//
//  Created by tinghui Chuang on 2024/10/12.
//

import UIKit

class NotificationCell: UITableViewCell {
    @IBOutlet var titLabel:UILabel!
    @IBOutlet var tmLabel:UILabel!
    @IBOutlet var descLabel:UILabel!
    @IBOutlet var dotV:UIView!


    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setWidth(width: CstFunc.getWinWidth())
        titLabel.frame = CGRect(x: 30, y: titLabel.getTop(), width: CstFunc.getWinWidth() - 30, height: titLabel.getHeight())
        tmLabel.frame = CGRect(x: 30, y: titLabel.getBottom(), width: CstFunc.getWinWidth() - 30, height: tmLabel.getHeight())
        descLabel.frame = CGRect(x: 30, y: tmLabel.getBottom(), width: CstFunc.getWinWidth() - 30, height: descLabel.getHeight())

        dotV.cornored(radius: dotV.getHeight() / 2)

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
        
    func setupData(msg:Messages) {
        titLabel.text = msg.title
        tmLabel.text = msg.updateDateTime
        descLabel.text = msg.message
        dotV.isHidden = msg.status ?? false
    }
    
}
