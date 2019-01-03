//
//  ViewController.swift
//  Counting_Days
//
//  Created by Abdullah Alsayari on 10/28/18.
//  Copyright © 2018 Abdullah Alsayari. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
//    localization initilization
    
    var dayTextValue : String = NSLocalizedString("dayTextValue", comment: "")
    var testmodeTextValue : String = NSLocalizedString("testmodeTextValue", comment: "")
    var alertActionTitle : String = NSLocalizedString("alertTextTitle", comment: "")
    var alertActionMessage : String = NSLocalizedString("alertTextMessage", comment: "")
    var resetButtonText : String = NSLocalizedString("resetText", comment: "")
    var selectHolidayText: String = NSLocalizedString("selectHolidayText", comment: "")
    var resetWarningTitle: String = NSLocalizedString("resetWarningTitleText", comment:"")
    var resetWarningText: String = NSLocalizedString("resetWarningText", comment:"")
    var resetWarningYes: String = NSLocalizedString("resetAlertYes", comment:"")
    var resetWarningNo: String = NSLocalizedString("resetAlertNo", comment:"")
    
//    end of localization initilization
    
    // cellindex for the selected row from the popup
    var cellIndex = -1
    var holidays : [String] = ["Christmas", "Kwanza", "Chanukah"]
    
    // button collection
    @IBOutlet var flipButtons: [UIButton]!
    
    // reset and select buttons outlets
    @IBOutlet weak var selectHolidayButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    
    
    // initilizing image array
    let images : [UIImage] = [#imageLiteral(resourceName: "HH2"), #imageLiteral(resourceName: "HH"), #imageLiteral(resourceName: "HH_image"), #imageLiteral(resourceName: "HH3"), #imageLiteral(resourceName: "HH4")]
    
    // initilizing the day array
    var days : [day] = [day(open:false), day(open: false), day(open:false), day(open: false), day(open:false), day(open: false), day(open:false), day(open: false), day(open:false), day(open: false), day(open:false), day(open: false), day(open:false), day(open: false), day(open:false), day(open: false), day(open:false), day(open: false), day(open:false), day(open: false), day(open:false), day(open: false), day(open:false), day(open: false)]
    
//    var isOpen : [Bool] = [false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false]
    
    // fuction for closing the days and making their values false
    func resetdays(){
        for index in 0...23{
            days[index].open = false
        }
        for fbutton in flipButtons{
            fbutton.setBackgroundImage(nil, for: .normal)
            fbutton.backgroundColor = UIColor.white
            fbutton.setTitle(dayTextValue + " \(fbutton.tag+1)", for: .normal)
            fbutton.setTitleColor(UIColor.blue, for: UIControlState.normal)
            UIView.transition(with: fbutton, duration: 0.3, options:UIViewAnimationOptions.transitionFlipFromRight, animations: nil, completion: nil)
        }
    }
    
    @IBAction func restButton(_ sender: Any) {
//        resetdays()
        
        let resetAlert = UIAlertController(title: resetWarningTitle, message: resetWarningText, preferredStyle: .alert)
        let okayAlertAction = UIAlertAction(title: resetWarningYes, style: .default) {action in
            // put a function to reset the days on agreeing
            self.resetdays()
        }
        let cancelAlertAction = UIAlertAction(title: resetWarningNo, style: .cancel, handler: nil)
        
        resetAlert.addAction(okayAlertAction)
        resetAlert.addAction(cancelAlertAction)
        
        self.present(resetAlert, animated: true, completion: nil)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "PopupSegue" {
           let popupVC = segue.destination as! TablePopViewController
            popupVC.saveSelect = saveSelect
        }
    }
    
    func saveSelect(_ selectedCell: Int) -> Void {
//        testmodeLabel.text = ( "Test Mode: \( String(selectedCell) )")
        
        if selectedCell != -1 {
            if holidays[selectedCell] == "Christmas"{
                self.title = "Christmas"
                view.backgroundColor = UIColor.brown
            }
            else if holidays[selectedCell] == "Kwanza"{
                self.title = "Kwanza"
                view.backgroundColor = UIColor.blue
            }
            else if holidays[selectedCell] == "Chanukah"{
                self.title = "Chanukah"
                view.backgroundColor = UIColor.red
            }
        }
        else{
            view.backgroundColor = UIColor.white
        }
        
    }

    @IBOutlet weak var testmodeLabel: UILabel!
    
    
    var testMode = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        selectHolidayButton.setTitle(selectHolidayText, for: .normal)
        resetButton.setTitle(resetButtonText, for: .normal)
        
//        for index in 0...23{
//            if days[index].open {
//                flipButtons[index].setBackgroundImage(#imageLiteral(resourceName: "HH_image.jpg"), for: .normal)
//                flipButtons[index].setTitle("", for: .normal)
//            }
//        }
        
        testmodeLabel.text = testmodeTextValue
        
        for fbutton in flipButtons{
            fbutton.setBackgroundImage(nil, for: .normal)
            fbutton.backgroundColor = UIColor.white
            fbutton.setTitle(dayTextValue + " \(fbutton.tag+1)", for: .normal)
            fbutton.setTitleColor(UIColor.blue, for: UIControlState.normal)
        }

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func openDay(open: Bool, flipButton: UIButton){
        if(!open){ // if the card is not open
            let randomIndex = arc4random_uniform(5)
//            var image : UIImage = images[Int(randomIndex)]
            days[flipButton.tag].open = true
            flipButton.setBackgroundImage(images[Int(randomIndex)], for: .normal)
            flipButton.setTitle("", for: .normal)
            UIView.transition(with: flipButton, duration: 0.3, options: UIViewAnimationOptions.transitionFlipFromRight, animations: nil, completion: nil)
        }
        else{ // if the card is open
            days[flipButton.tag].open = false
            flipButton.setBackgroundImage(nil, for: .normal)
            flipButton.backgroundColor = UIColor.white
            flipButton.setTitle( dayTextValue + " \(flipButton.tag+1)", for: .normal)
            flipButton.setTitleColor(UIColor.blue, for: UIControlState.normal)
            UIView.transition(with: flipButton, duration: 0.3, options: UIViewAnimationOptions.transitionFlipFromRight, animations: nil, completion: nil)
        }

    }
    
    @IBAction func testMode(_ sender: UISwitch) {
        testMode = sender.isOn
        if(!sender.isOn){
            for index in 0...23{
                days[index].open = false
            }
            for fbutton in flipButtons{
                fbutton.setBackgroundImage(nil, for: .normal)
                fbutton.backgroundColor = UIColor.white
                fbutton.setTitle("day \(fbutton.tag+1)", for: .normal)
                fbutton.setTitleColor(UIColor.blue, for: UIControlState.normal)
                UIView.transition(with: fbutton, duration: 0.3, options:UIViewAnimationOptions.transitionFlipFromRight, animations: nil, completion: nil)
            }
        }
    }
  
    @IBAction func onClick(_ sender: Any) {
        guard  let flipButton = sender as? UIButton else {
            return
        }
        
        if !testMode{ // checking if the test mode switch is on
            // if so then check if it is the first day
           if flipButton.tag == 0{
                // then check if the card is open or not (then do the proper animation based on the condtion)
                // if open already switch to text, otherwise switch to pic.
            openDay(open: days[flipButton.tag].open , flipButton: flipButton )

            }
           else { // if this is not the first card
                if (days[flipButton.tag - 1].open){ // if the previous card is open
                    // runs the same code for first card the checks whether or not it is open
                    openDay(open: days[flipButton.tag].open , flipButton: flipButton )
                }
                else{ // if the previous card is NOT open
                    // show alert
                    let consecutiveAlert = UIAlertController(title: alertActionTitle, message: alertActionMessage, preferredStyle: .alert)
                    let okayAlertAction = UIAlertAction(title: "Okay", style: .cancel, handler: nil)
                    consecutiveAlert.addAction(okayAlertAction)
                    self.present(consecutiveAlert, animated: true, completion: nil)
                }
            }
            
        } // end of !testMode condition
            
        else{ // if this is not in the test mode, you can open and close cards in no particular order.
            openDay(open: days[flipButton.tag].open , flipButton: flipButton )
        }
        
    }


}

