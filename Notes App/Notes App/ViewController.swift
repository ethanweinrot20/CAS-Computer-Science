//
//  ViewController.swift
//  Notes App
//
//  Created by Ethan Weinrot on 11/15/19.
//  Copyright © 2019 Ethan Weinrot. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    var note:Note?

    @IBOutlet weak var textField: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.text = note?.note
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        note?.note = textField.text
    }
    


}

