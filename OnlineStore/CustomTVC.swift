//
//  CustomTVC.swift
//  OnlineStore
//
//  Created by Apple's on 17/04/18.
//  Copyright © 2018 Aadil. All rights reserved.
//

import UIKit

class CustomTVC: UITableViewCell {
    
    
    @IBOutlet weak var nameLbl: UILabel!
    
    @IBOutlet weak var quantityLbl: UILabel!
    
    @IBOutlet weak var costLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
