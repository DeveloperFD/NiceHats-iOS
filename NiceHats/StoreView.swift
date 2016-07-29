//
//  ViewController.swift
//  NiceHats
//
//  Created by Gregg Mojica on 7/28/16.
//  Copyright © 2016 Gregg Mojica. All rights reserved.
//

import UIKit

class StoreView: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    @IBOutlet var collectionView: UICollectionView!
    
    let reuseIdentifier = "cell" // also enter this string as the cell identifier in the storyboard
    
    var hats = [
        Hat(name: "Red Hat", description: "Are you a Red Sox fan but don't want to pay for an offical hat? Then this one is for you!", color: "red", price: 5, img: "red"),
        Hat(name: "Blue Hat", description: "Our classic blue for the Dodgers and Blue Jays fans on a budget.", color: "blue", price: 6, img: "blue"),
        Hat(name: "Red Hat", description: "Show your A's pride without spending an arm and a leg!", color: "green", price: 7, img: "green")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
    }

    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.hats.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! HatsCell
        
        cell.myLabel.text = self.hats[indexPath.item].name
        cell.descLabel.text = self.hats[indexPath.item].desc
        cell.price.text = "$\(self.hats[indexPath.item].price!)"
        cell.hat.image = UIImage(named: self.hats[indexPath.item].img!)
    
        cell.layer.borderWidth = 2
        cell.layer.borderColor = UIColor.blackColor().CGColor
        
        return cell
    }
    
    @IBAction func addToCart(sender: AnyObject) {
    }
    
    // MARK: - UICollectionViewDelegate protocol
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        print("You selected cell #\(indexPath.item)!")
        
        if (self.hats[indexPath.item].color == "red") {
            NSUserDefaults.standardUserDefaults().setObject(self.hats[indexPath.item].color, forKey: "red")
        }
        
        if (self.hats[indexPath.item].color == "blue") {
            NSUserDefaults.standardUserDefaults().setObject(self.hats[indexPath.item].color, forKey: "blue")
        }
        
        if (self.hats[indexPath.item].color == "green") {
            NSUserDefaults.standardUserDefaults().setObject(self.hats[indexPath.item].color, forKey: "green")
        }
        
        self.performSegueWithIdentifier("showCart", sender: self)
    }
}

