//
//  Hat.swift
//  NiceHats
//
//  Created by Gregg Mojica on 7/28/16.
//  Copyright © 2016 Gregg Mojica. All rights reserved.
//

import UIKit

class Hat: NSObject {
    var name: String?
    var desc: String?
    var color: String?
    var price: Int?
    var img: String?
    
    init (name: String, description: String, color: String, price: Int, img: String) {
        self.name = name
        self.desc = description
        self.color = color
        self.price = price
        self.img = img
    }
}

