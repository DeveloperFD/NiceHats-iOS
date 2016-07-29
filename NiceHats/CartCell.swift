//
//  CartCell.swift
//  NiceHats
//
//  Created by Gregg Mojica on 7/28/16.
//  Copyright © 2016 Gregg Mojica. All rights reserved.
//

import UIKit

class CartCell: UITableViewCell {
    @IBOutlet var hatName: UILabel!
    @IBOutlet var hatQuantity: UITextField!
    @IBOutlet var hatImg: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
