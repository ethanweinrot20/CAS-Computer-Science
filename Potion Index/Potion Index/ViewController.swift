//
//  ViewController.swift
//  Potion Index
//
//  Created by Ethan Weinrot on 1/21/20.
//  Copyright © 2020 Ethan Weinrot. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var nameInput: UITextField!
    @IBOutlet weak var colorInput: UITextField!
    @IBOutlet weak var effectInput: UITextView!
    
    
    var potion:Potion?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if let potion = potion {
            nameInput.text = potion.name
            colorInput.text = potion.color
            effectInput.text = potion.effect
            
        }
    }
    
    
    func getFileURL() -> URL? {
        let docDirectory = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
        
        if docDirectory != nil{
            return docDirectory!.appendingPathComponent("savefile.json")
        }
        return nil
    }
    
    
    @IBAction func saveButton(_ sender: Any) {
        
        potion?.name = nameInput.text ?? ""
        potion?.color = colorInput.text ?? ""
        potion?.effect = effectInput.text ?? ""
        
        
    }
    
    
    @IBAction func deleteButton(_ sender: Any) {
        nameInput.text = ""
        colorInput.text = ""
        effectInput.text = ""
    }
    
}

