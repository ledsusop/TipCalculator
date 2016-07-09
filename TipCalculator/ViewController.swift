//
//  ViewController.swift
//  TipCalculator
//
//  Created by Ledesma Usop Jr. on 7/9/16.
//  Copyright © 2016 codepath. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipController: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onBillEditChanged(sender: AnyObject) {
        let billAmount = NSString(string: billTextField.text!).doubleValue
        let tipPercentages = [0.18,0.20,0.22]
        let tipPercentage = tipPercentages[tipController.selectedSegmentIndex]
        let tipAmount = billAmount * tipPercentage
        let totalAmount = billAmount + tipAmount
        
        tipLabel.text = String(format: "$%.2f",tipAmount)
        totalLabel.text = String(format: "$%.2f",totalAmount)
    }
    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }

}

