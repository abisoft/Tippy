//
//  SettingViewController.swift
//  tipdec5no2
//
//  Created by Mizuho on 12/5/15.
//  Copyright © 2015 Mizuho. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController {

    @IBOutlet weak var segControl: UISegmentedControl!
    
    @IBOutlet weak var tipControl: UISlider!
    
    var lowestTip : Float!
    var midTip : Float!
    var highestTip : Float!
    
    @IBOutlet weak var sliderSlide: UISlider!
    
    @IBOutlet weak var percentageLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let UserDefaults = NSUserDefaults.standardUserDefaults()
         lowestTip = UserDefaults.floatForKey("lowest_tip")
         midTip =  UserDefaults.floatForKey("mid_tip")
         highestTip = UserDefaults.floatForKey("highest_tip")
        
        segControl.setTitle("\(lowestTip)", forSegmentAtIndex: 0)
        segControl.setTitle("\(midTip)", forSegmentAtIndex: 1)
        segControl.setTitle("\(highestTip)", forSegmentAtIndex: 2)

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func sliderSlide(sender: AnyObject) {
        let tipPercentage = tipControl.value
        percentageLabel.text = "\(tipPercentage * 100)%"
        segControl.setTitle("\(tipPercentage * 100)%", forSegmentAtIndex: segControl.selectedSegmentIndex)
        
        if (segControl.selectedSegmentIndex == 0) {
            lowestTip = sliderSlide.value
            //UserDefaults.setFloat(lowestTip,"lowest_tip")
        }
        if (segControl.selectedSegmentIndex == 1) {
            midTip = sliderSlide.value
        }
        if (segControl.selectedSegmentIndex == 2) {
            highestTip = sliderSlide.value
        }
        
        
    }

    @IBAction func segControlTapped(sender: AnyObject) {
        print(segControl.selectedSegmentIndex)
        
        if (segControl.selectedSegmentIndex == 0) {
            sliderSlide.value = lowestTip
        }
        if (segControl.selectedSegmentIndex == 1) {
            sliderSlide.value = midTip
        }
        if (segControl.selectedSegmentIndex == 2) {
            sliderSlide.value = highestTip
        }
        
   
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
