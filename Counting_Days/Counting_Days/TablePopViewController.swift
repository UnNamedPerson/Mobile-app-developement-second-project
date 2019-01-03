//
//  TablePopViewController.swift
//  Counting_Days
//
//  Created by Abdullah Alsayari on 10/31/18.
//  Copyright © 2018 Abdullah Alsayari. All rights reserved.
//

import UIKit

class TablePopViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
//    var delegate :
    
    var saveSelect: ( (_ selectedCell: Int) -> () )?

    var cellSelected = -1
    var holidays : [String] = ["Christmas", "Kwanza", "Chanukah"]

    @IBOutlet weak var popupTabelView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        popupTabelView.dataSource = self
        popupTabelView.delegate = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return holidays.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = popupTabelView.dequeueReusableCell(withIdentifier: "Cell") else {
            fatalError("Expected UITableViewCell")
        }
        cell.textLabel?.text = holidays[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        cellSelected = indexPath.row
        
        saveSelect!(cellSelected)
        
        dismiss(animated: true, completion: nil)
    }


}
