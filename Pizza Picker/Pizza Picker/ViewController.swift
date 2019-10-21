//
//  ViewController.swift
//  Pizza Picker
//
//  Created by Ethan Weinrot on 10/16/19.
//  Copyright © 2019 Ethan Weinrot. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pizzaFlavors.count
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var pizzaPicker: UIPickerView!
    @IBOutlet weak var label: UILabel!
    
    let pizzaFlavors = ["Cheese", "Pepperoni", "Hawaiian", "Meat Lovers", "Calzone", "Mushroom"]
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pizzaFlavors[row]
    }
    
    @IBAction func orderPizza(_ sender: Any) {
        let row = pizzaPicker.selectedRow(inComponent: 0)
        label.text = "You ordered a: "+pizzaFlavors[row]
    }
    
    
    
}

