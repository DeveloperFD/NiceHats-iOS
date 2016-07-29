//
//  Cart.swift
//  NiceHats
//
//  Created by Gregg Mojica on 7/28/16.
//  Copyright © 2016 Gregg Mojica. All rights reserved.
//

import UIKit

class Cart: NSObject {
    var hatType: String?
    var quantity: Int?
    var price: Int?
    
    
    init (hatType: String, quantity: Int, price: Int) {
        self.hatType = hatType
        self.quantity = quantity
        self.price = price
    }
}
