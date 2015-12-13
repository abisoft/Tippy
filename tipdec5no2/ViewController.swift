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
    

    
    override func viewWillAppear(animated: Bool) {
             super.viewWillAppear(animated)
        print("view will appear")}
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        print("view did appear")
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillAppear(animated)
        print("view will disappear")
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        print("view did disappear")
    }
    
    
    override func viewDidLoad() {
        tipLable.text = "$0.00"
        totalLabel.text = "$0.00"
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func onEditingChanged(sender: AnyObject)
    {
    
        var tipPercentages = [0.18, 0.2, 0.22]
        var tipPercentage = tipPercentages[tipcontrol.selectedSegmentIndex]
        let billAmount = billField.text!._bridgeToObjectiveC().doubleValue
        
        let tip = billAmount * tipPercentage
        let total = billAmount + tip
    
        tipLable.text = "\(tip)"
        totalLabel.text = "\(total)"
        
        tipLable.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        }

    @IBAction func onTap(sender: AnyObject) {
        
        view.endEditing(true)
    }
}




