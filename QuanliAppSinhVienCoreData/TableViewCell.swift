//
//  TableViewCell.swift
//  QuanliAppSinhVienCoreData
//
//  Created by Boss on 4/17/19.
//  Copyright © 2019 Boss. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var photo: UIImageView!
    @IBOutlet weak var lbname: UITextField!
    
    @IBOutlet weak var lbage: UITextField!
     var indexPath:IndexPath?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
