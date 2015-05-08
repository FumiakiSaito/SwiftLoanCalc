//
//  TopViewController.swift
//  SwiftLoanCalc
//
//  Created by Fumiaki Saito on 2015/05/09.
//  Copyright (c) 2015年 mycompany. All rights reserved.
//

import UIKit

class TopViewController: UIViewController, UITextFieldDelegate {

    var periodMonth = 12

    @IBOutlet weak var priceTextField: UITextField!
    @IBOutlet weak var paymentTextField: UITextField!
    
    @IBAction func changePeriod(sender: UISegmentedControl) {

        switch sender.selectedSegmentIndex {
        case 0:
            self.periodMonth = 12
        case 1:
            self.periodMonth = 24
        case 2:
            self.periodMonth = 36
        case 3:
            self.periodMonth = 48
        case 4:
            self.periodMonth = 60
        case 5:
            self.periodMonth = 72
        default:
            println("error")
        }
        
        println(self.periodMonth)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.priceTextField.delegate = self
        paymentTextField.text = "0"
        
    }

    // 計算するボタン押下
    @IBAction func calcButton(sender: UIButton) {

        if priceTextField.text != "" {
            
            var price = priceTextField.text.toInt()!
            var payment = calc(price, periodMonth: self.periodMonth)
            
            paymentTextField.text = payment.description
        }
    }

    func calc(price: Int, periodMonth: Int) -> Int {
        return price / periodMonth
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
