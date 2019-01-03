//
//  HappyHolidayViewController.swift
//  Counting_Days
//
//  Created by Abdullah Alsayari on 11/1/18.
//  Copyright © 2018 Abdullah Alsayari. All rights reserved.
//

import UIKit

class HappyHolidayViewController: UIViewController {

    var happyHolidayText = NSLocalizedString("happyHolidayText", comment: "")
    
    @IBOutlet weak var happyHolidayLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        happyHolidayLabel.text = happyHolidayText
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
