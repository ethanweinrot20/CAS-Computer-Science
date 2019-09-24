//
//  ViewController.swift
//  BirthYearApp
//
//  Created by Ethan Weinrot on 9/23/19.
//  Copyright © 2019 Ethan Weinrot. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var yourBirthYear: UIButton!
    @IBOutlet weak var birthYearLabel: UILabel!
    @IBOutlet weak var birthdaySwitch: UISwitch!
    @IBOutlet weak var ageLabel: UILabel!
    
    
    
    var age:Int!
    var newYear = 0
    var year = 2019

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func ageSlider(_ sender: UISlider) {
        ageLabel.text = String(Int(sender.value))
    }
    
    
    @IBAction func yourBirthYear(_ sender: Any) {
        age = Int(ageLabel.text ?? "0")
        
        if birthdaySwitch.isOn {
            newYear += 0
        } else {
            newYear -= 1
        }
        
        newYear += year
        newYear -= age!
        
        birthYearLabel.text = "You were born in \(newYear)"
        
        newYear = 0
    
    }
    
    
}

