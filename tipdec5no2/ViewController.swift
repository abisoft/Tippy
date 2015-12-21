//
//  ViewController.swift
//  tipdec5no2
//
//  Created by Mizuho on 12/5/15.
//  Copyright © 2015 Mizuho. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipLable: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipcontrol: UISegmentedControl!
    @IBOutlet weak var totalLabel: UILabel!
    
    var lowestTip: Float!
    var midTip: Float!
    var highestTip: Float!
    
    let userDefaults = NSUserDefaults.standardUserDefaults()
    
    
    override func viewDidLoad() {
        tipLable.text = "$0.00"
        totalLabel.text = "$0.00"
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        
        lowestTip = userDefaults.floatForKey("lowest_tip");
        midTip = userDefaults.floatForKey("mid_tip");
        highestTip = userDefaults.floatForKey("highest_tip");
        
        tipcontrol.setTitle(self.formatPercentage(lowestTip), forSegmentAtIndex: 0)
        tipcontrol.setTitle(self.formatPercentage(midTip), forSegmentAtIndex: 1)
        tipcontrol.setTitle(self.formatPercentage(highestTip), forSegmentAtIndex: 2)
        userDefaults.synchronize()
        
        print("view will appear")
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func onEditingChanged(sender: AnyObject)
    {
    
        var tipPercentages = [0.18, 0.2, 0.22]
        let tipPercentage = tipPercentages[tipcontrol.selectedSegmentIndex]
        let billAmount = billField.text!._bridgeToObjectiveC().doubleValue
        
        let tip = billAmount * tipPercentage
        let total = billAmount + tip
    
        tipLable.text = "\(tip)"
        totalLabel.text = "\(total)"
        
        tipLable.text = String(format: "$%.0f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        
        
        }

    @IBAction func onTap(sender: AnyObject) {
        
        view.endEditing(true)
    }
    
    func formatPercentage(value: Float) -> String {
        return String(format: "%.0f%%", value * 100);
    
}

}



