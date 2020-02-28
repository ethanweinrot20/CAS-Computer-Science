//
//  ViewController.swift
//  Number Guesser Final
//
//  Created by Ethan Weinrot on 2/19/20.
//  Copyright © 2020 Ethan Weinrot. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var easyButton: UIButton!
    @IBOutlet weak var mediumButton: UIButton!
    @IBOutlet weak var hardButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let numberVC = segue.destination as? NumberGuessViewController, let sender = sender as? UIButton {
            if sender == easyButton {
                numberVC.level = "Easy"
            }
            if sender == mediumButton {
                numberVC.level = "Medium"
            }
            if sender == hardButton {
                numberVC.level = "Hard"
            }
        }
        
    }


}

