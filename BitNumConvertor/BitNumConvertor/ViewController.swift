//
//  ViewController.swift
//  BitNumConvertor
//
//  Created by Hei Wa Zeal Yim on 2017-01-19.
//  Copyright © 2017 Zeal Yim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var numLabel: UILabel!
    @IBOutlet var numberOutlet: UILabel!
    @IBOutlet var bitOutlet: UILabel!
    @IBOutlet var bitLabelDisplay: UILabel!
    
    var bitInput: String = ""
    var numBuffer: Int!
    let maxCharaInput = 13
    var noInput:Bool = true


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        updateBitOutlet()
        bitOutlet.text = bitInput
        numLabel.isHidden = true
        numberOutlet.isHidden = true
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func zeroBtnPressed (sender: AnyObject) {
        if isInputFull() == true {
            //do nothing
        }
        else {
            bitInput.append("0")
            checkIfNoInput()
            updateBitOutlet()
        }
    }
    
    @IBAction func oneBtnPressed (sender: AnyObject) {
        if isInputFull() == true {
            //do nothing
        }
        else {
            bitInput.append("1")
            checkIfNoInput()
            updateBitOutlet()
        }
    }
    
    @IBAction func backspaceBtnPressed (sender: AnyObject) {
        bitInput = String(bitInput.characters.dropLast(1))
        checkIfNoInput()
        updateBitOutlet()
    }
    
    func checkIfNoInput() {
        if bitInput.characters.count == 0 {
            noInput = true
        }
        else{
            noInput = false
        }
    }
    
    func updateBitOutlet () {
        if noInput == true {
            bitLabelDisplay.text = "Press 0 or 1..."
        }
        else {
            bitLabelDisplay.text = "Your bits are"
        }
        bitOutlet.text = bitInput
    }

    func isInputFull () -> Bool {
        return bitInput.characters.count == maxCharaInput
    }
    
    @IBAction func convertBtnPressed (sender: AnyObject) {
        numBuffer = 0
        var placement: Int! = bitInput.characters.count - 1
        //convert bit to number
        for character in bitInput.characters {
            print()
            if character == "1" {
                numBuffer = numBuffer + Int(pow(Double(2), Double(placement)))
            }
            placement = placement - 1
            
        }
        numberOutlet.text = String(numBuffer)
        //display number
        numLabel.isHidden = false
        numberOutlet.isHidden = false
        
        
    }

    @IBAction func restartBtnPressed (sender: AnyObject) {
        bitInput = ""
        noInput = true
        updateBitOutlet()
        bitOutlet.text = bitInput
        numLabel.isHidden = true
        numberOutlet.isHidden = true
    }
}

