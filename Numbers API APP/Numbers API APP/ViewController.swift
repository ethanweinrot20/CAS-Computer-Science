//
//  ViewController.swift
//  Numbers API APP
//
//  Created by Ethan Weinrot on 12/18/19.
//  Copyright © 2019 Ethan Weinrot. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
    return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    return numbers.count
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        for i in (1...9999) {
            numbers.append(String(i))
        }
    }
    
    
    
    @IBOutlet weak var numberPicker: UIPickerView!
    
    var numbers = 
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?{
    return numbers[row]
    }


}

