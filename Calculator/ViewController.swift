//
//  ViewController.swift
//  Calculator
//
//  Created by Kevin Nguyen on 11/19/17.
//  Copyright © 2017 KevinVuNguyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var middleOfTyping: Bool = false
    var firstValue = 0.0, currentPercent = 0.0
    var typeOfOperations: Int = 0
    //1 is +, 2 is -, 3 is /, 4 is *
    
    @IBOutlet weak var display: UILabel!
    @IBOutlet weak var tipLabel: UILabel!
    //This is a property
    
    /*
    @description: Acquires the data from each respective button and increments
     places the value in the UILabel.
     @param: the button type
     @return: none
    */
    @IBAction func UIView(_ sender: UIButton) {
        let digit = sender.currentTitle!
        if middleOfTyping {
            let textCurrentlyInDisplay = display.text!
            display.text = textCurrentlyInDisplay + digit
            updateTipLabel()
        }else{
             display.text = "$" + digit
             updateTipLabel()
            middleOfTyping = true
        }
        //this concatenate the label with a value
    }
    
    func getLabel()->String{
        var withoutDollar = display.text!
        let start = withoutDollar.index(after: withoutDollar.startIndex)
        let end = withoutDollar.index(before: withoutDollar.endIndex)
        let range = start...end
        return String(withoutDollar[range])
    }
    
    /*
     @description: this is the equals button. This determines what type of operations was used then applies this operations to the given numbers.
     @param: Button type
     @return: none
    */
    @IBAction func makeEqual(_ sender: UIButton) {
        
        switch typeOfOperations{
        case 1:
             display.text = "$" + String(firstValue + Double(getLabel())!)
        case 2:
            display.text = "$" + String(firstValue - Double(getLabel())!)
        case 3:
            display.text = "$" + String(firstValue/Double(getLabel())!)
        case 4:
            display.text = "$" + String(firstValue*Double(getLabel())!)
        default:
            display.text = "$0.0"
        }
         middleOfTyping = false
         updateTipLabel()
    }
    
    /*
     @Description: clears the number on the label.
     @param: Button type
     @return: none
     */
    @IBAction func clearButton(_ sender: UIButton) {
        middleOfTyping = false
        display.text = "0.0"
        tipLabel.text = "0.0"
    }
    
    /**
     Operations
     @Description: operations for the tip calculator. Each function gives typeOfOperation a number, which associates their operation: 1 is add, 2 is minus, 3 is division, and 4 is multiplication.
     **/
    
    @IBAction func add(_ sender: UIButton) {
        typeOfOperations = 1
        firstValue = Double(getLabel())!
        middleOfTyping = false
    }
    
    @IBAction func minus(_ sender: UIButton) {
        typeOfOperations = 2
        firstValue = Double(getLabel())!
        middleOfTyping = false
    }
    @IBAction func divide(_ sender: UIButton) {
        typeOfOperations = 3
        firstValue = Double(getLabel())!
        middleOfTyping = false
    }
    
    @IBAction func multiply(_ sender: UIButton) {
        typeOfOperations = 4
        firstValue = Double(getLabel())!
        middleOfTyping = false
    }
    /*
     Percent Income
     @Description: functions that set the percent tip: 0%, 10%, 15%, and 20%. When the user clicks on the percent buttons, the tip label gets updated.
     */
    
    @IBAction func zeroPercent(_ sender: UIButton) {
        currentPercent = 0.0
        updateTipLabel()
    }
    
    @IBAction func tenPercent(_ sender: UIButton) {
        currentPercent = 0.10
        updateTipLabel()
    }
    
    @IBAction func fifteenPercent(_ sender: UIButton) {
        currentPercent = 0.15
        updateTipLabel()
    }
    
    @IBAction func twentyPercent(_ sender: UIButton) {
        currentPercent = 0.20
        updateTipLabel()
    }
    
    /*
     @Description: updates the tip label with the input label plus the tip that's associated with the number.
     */
    func updateTipLabel(){
         tipLabel.text = "$" + String(Double(getLabel())! + (Double(getLabel())!*Double(currentPercent)))
    }
    
    
    
}

