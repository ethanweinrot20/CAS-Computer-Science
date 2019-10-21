//
//  ViewController.swift
//  ice cream picker
//
//  Created by Ethan Weinrot on 10/21/19.
//  Copyright © 2019 Ethan Weinrot. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
    return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    return iceCreamFlavors.count
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var iceCreamPicker: UIPickerView!
    @IBOutlet weak var orderLabel: UILabel!
    
    let iceCreamFlavors = ["Vanilla", "Chocolate", "Mint", "Strawberry", "Cookie Dough"]
    let price = ["$3.00", "$3.00", "$3.50", "$3.50", "$4.00"]
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    return iceCreamFlavors[row] + " - " + price[row]
    }
    
    @IBAction func orderIceCream(_ sender: Any) {
        let row = iceCreamPicker.selectedRow(inComponent: 0)
        orderLabel.text = "You ordered: "+iceCreamFlavors[row] + " it costs: "+price[row]
    }
    
}


