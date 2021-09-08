//
//  ViewController.swift
//  RgbToHexConverter
//
//  Created by Oğulcan DEMİRTAŞ on 8.09.2021.
//

import UIKit

class ViewController: UIViewController {
    
   
    @IBOutlet weak var redTextField: UITextField!
    @IBOutlet weak var blueTextField: UITextField!
    @IBOutlet weak var greenTextField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var selectedColor: UILabel!
    @IBOutlet weak var convertTo: UIButton!
    
    var chosenIndex : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    
    @IBAction func rgbhexSelect(_ sender: UISegmentedControl) {
        
        chosenIndex = sender.selectedSegmentIndex
        resultLabel.text?.removeAll()
        redTextField.text?.removeAll()
        blueTextField.text?.removeAll()
        greenTextField.text?.removeAll()
        selectedColor.backgroundColor = UIColor.white
        
        if chosenIndex == 0 {
            convertTo.setTitle("Convert to HEX", for: UIControl.State.normal)
        }else  {
            convertTo.setTitle("Convert to RGB", for: UIControl.State.normal)
        }
        
    }
    
    
    @IBAction func convertButton(_ sender: UIButton) {
        
        if chosenIndex == 0{
            //RGB TO HEX
            
            RGBtoHEX()
            
            
        }else {
            //HEX TO RGB
            
            HEXtoRGB()
            
        }
        
        
    }
    
    func RGBtoHEX() {
        
        guard let redValue = UInt8(redTextField.text!) else {return}
            
        guard let greenValue = UInt8(greenTextField.text!) else {return}
                
        guard let blueValue = UInt8(blueTextField.text!) else {return}
                    
                    //if comes here. It means user put variables correctly
                    
                    let redHex = String(format: "%2X", redValue)
                    let greenHex = String(format: "%2X", greenValue)
                    let blueHex = String(format: "%2X", blueValue)
                    
                    resultLabel.text = "Hex Color: #\(redHex)\(greenHex)\(blueHex)"
                    selectedColor.backgroundColor = UIColor(red: CGFloat(redValue)/255, green: CGFloat(greenValue)/255, blue: CGFloat(blueValue)/255, alpha: 1)
              
    }
    
    func HEXtoRGB() {
        
        guard let redValue = UInt8(redTextField.text!, radix: 16) else {return}
            
        guard let greenValue = UInt8(greenTextField.text!,  radix: 16) else {return}
                
        guard let blueValue = UInt8(blueTextField.text!, radix: 16) else {return}
                    
                    resultLabel.text = "RED: \(redValue) \n GREEN: \(greenValue) \n BLUE: \(blueValue)"
                    selectedColor.backgroundColor = UIColor(red: CGFloat(redValue)/255, green: CGFloat(greenValue)/255, blue: CGFloat(blueValue)/255, alpha: 1)
                    
              
        
        
        
    }
}

