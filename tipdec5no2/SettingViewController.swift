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
    
    let userDefaults = NSUserDefaults.standardUserDefaults()
    
    @IBOutlet weak var sliderSlide: UISlider!
    
    @IBOutlet weak var percentageLabel: UILabel!
   
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    
        
        //NS User default
        let UserDefaults = NSUserDefaults.standardUserDefaults()
         lowestTip = UserDefaults.floatForKey("lowest_tip")
         midTip =  UserDefaults.floatForKey("mid_tip")
         highestTip = UserDefaults.floatForKey("highest_tip")
        
        segControl.setTitle(self.formatPercentage(lowestTip), forSegmentAtIndex: 0)
        segControl.setTitle(self.formatPercentage(midTip), forSegmentAtIndex: 1)
        segControl.setTitle(self.formatPercentage(highestTip), forSegmentAtIndex: 2)

        
    }

    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    //Changing slider values as it slides
    @IBAction func sliderSlide(sender: AnyObject) {
        let tipPercentage = tipControl.value
        
        //percentageLabel.text = "\(tipPercentage * 100)%"
    
        let titleText = self.formatPercentage(tipPercentage);
        
        percentageLabel.text = titleText;
        
        
        segControl.setTitle(titleText, forSegmentAtIndex: segControl.selectedSegmentIndex);
        
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
    
    
    //Transferring values from the slider to the 
    //segmented control

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
    
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        
        //let defaults = NSUserDefaults.standardUserDefaults()
        
        userDefaults.setFloat(lowestTip, forKey: "lowest_tip")
        userDefaults.setFloat(midTip, forKey: "mid_tip")
        userDefaults.setFloat(highestTip, forKey: "highest_tip")
        userDefaults.synchronize()
        
        }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        print("view did disappear")
    }
  
    func formatPercentage(value: Float) -> String {
        return String(format: "%.0f%%", value * 100);
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
