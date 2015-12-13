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
    var lowestTip : Float!
    var midTip : Float!
    var highestTip : Float!
    
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
    

    @IBAction func segControlTapped(sender: AnyObject) {
        print(segControl.selectedSegmentIndex)
        
   
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
