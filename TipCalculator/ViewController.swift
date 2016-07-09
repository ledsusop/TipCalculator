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
    
    let defaults = NSUserDefaults.standardUserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        print("view did appear")
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        tipController.selectedSegmentIndex = defaults.integerForKey("default_tip_percentage")
        self.computeTip()
        print("view will appear")
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        print("view did disappear")
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        print("view will disappear")
    }
    
    func computeTip() {
        let billAmount = NSString(string: billTextField.text!).doubleValue
        let tipPercentages = [0.18,0.20,0.22]
        let tipPercentage = tipPercentages[tipController.selectedSegmentIndex]
        let tipAmount = billAmount * tipPercentage
        let totalAmount = billAmount + tipAmount
        
        tipLabel.text = String(format: "$%.2f",tipAmount)
        totalLabel.text = String(format: "$%.2f",totalAmount)
    }
    

    @IBAction func onBillEditChanged(sender: AnyObject) {
        self.computeTip()
    }
    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }

}

