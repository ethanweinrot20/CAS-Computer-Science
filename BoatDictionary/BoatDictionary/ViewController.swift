//
//  ViewController.swift
//  BoatDictionary
//
//  Created by Ethan Weinrot on 11/14/19.
//  Copyright © 2019 Ethan Weinrot. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var boat: Boat? = nil

    @IBOutlet weak var boatName: UILabel!
    
    
    @IBOutlet weak var boatQualities: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var name = boat?.name
        var color = boat?.color
        var dolphinPower = boat?.dolphinPower
        var size = boat?.size
        boatName.text = name
        boatQualities.text = "Color: \(color!) Dolphin Power: \(dolphinPower!) Size: \(size!)"

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
