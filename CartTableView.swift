//
//  CartTableView.swift
//  NiceHats
//
//  Created by Gregg Mojica on 7/28/16.
//  Copyright © 2016 Gregg Mojica. All rights reserved.
//

import UIKit

class CartTableView: UITableViewController {
    var cart = [
        Cart(hatType: "red", quantity: 0, price: 5),
        Cart(hatType: "blue", quantity: 0, price: 6),
        Cart(hatType: "green", quantity: 0, price: 7),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
    
    override func viewDidLayoutSubviews() {
        let cell  = tableView.dequeueReusableCellWithIdentifier("cartCell") as? CartCell!
        cell!.hatQuantity.becomeFirstResponder()
        cell!.hatQuantity.resignFirstResponder()
    }
    
    // MARK: - Table view data source
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cart.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell  = tableView.dequeueReusableCellWithIdentifier("cartCell") as? CartCell!
        
        cell!.hatName.text = capFirstLetter(self.cart[indexPath.row].hatType as AnyObject! as! String!)
        cell!.hatImg.image = UIImage(named:self.cart[indexPath.row].hatType as AnyObject! as! String! )
                
        cell!.layer.borderWidth = 1
        cell!.layer.borderColor = UIColor.blackColor().CGColor
    
        return cell!
    }
    
    @IBAction func checkOut(sender: AnyObject) {
        var cartZero = 0;
        
        for i in 0..<tableView.numberOfRowsInSection(0)  {
            let cell = tableView.cellForRowAtIndexPath(NSIndexPath(forItem: i, inSection: 0))
            if cell != nil {
                let cartCell = cell as! CartCell
                if (cartCell.hatQuantity.text == "0") {
                    cartZero += 1
                }
            }
        }
        
        if (cartZero == 3) {
            let alert = UIAlertController(title: "No Items in Cart", message: "You haven't Selected Any Items. Please add items and try again.", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
        }
        
        self.performSegueWithIdentifier("showBilling", sender: self)
    }
    
    
    func capFirstLetter(stringToBeCapd:String)->String{
        let capString = stringToBeCapd.substringFromIndex(stringToBeCapd.startIndex).capitalizedString
        return capString
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if (segue.identifier == "showBilling") {
            var price = 0;
            for i in 0..<tableView.numberOfRowsInSection(0)  {
                let cell = tableView.cellForRowAtIndexPath(NSIndexPath(forItem: i, inSection: 0))
                if cell != nil {
                    let cartCell = cell as! CartCell
                    if (cartCell.hatQuantity.text == "") {
                        cartCell.hatQuantity.text = "0"
                    }
                    
                    if (cartCell.hatQuantity.text != "0") {
                        price += Int(cartCell.hatQuantity.text!)! * self.cart[i].price!
                    }
                }
            }
        
            if let vc: PaymentTable = segue.destinationViewController as? PaymentTable {
                vc.cartTotal = price
            }
        }
    }
}
