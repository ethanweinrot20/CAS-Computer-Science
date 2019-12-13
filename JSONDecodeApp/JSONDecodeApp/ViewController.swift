//
//  ViewController.swift
//  jsonDecodeApp
//
//  Created by Riley John Gibbs on 12/3/19.
//  Copyright © 2019 Riley John Gibbs. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var jsonFileData: Data?
    var jsonFileString: String?

    // TODO: Come up with a better UI than just a single boring label.

    @IBOutlet weak var myLabel: UILabel!
    
    @IBOutlet weak var rosterLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        let fileUrl = Bundle.main.url(forResource: "data", withExtension: "json")
        jsonFileData = try? Data(contentsOf: fileUrl!)
        
            // TODO: Parse the JSON data and display it in the app.
        let json = try? JSONSerialization.jsonObject(with: jsonFileData!, options: [])
               
        let dictionary: [String: Any]? = json as? [String: Any]
        var teamName = ""
        var roster = [""]
            
        if let dictionary = dictionary {
            teamName = dictionary["Team Name"] as! String
            roster = dictionary["Roster"] as! [String]

        }
        
        myLabel.text = ("\(teamName)")
        
        
        rosterLabel.text = ("\(roster.joined(separator: "\n"))")
    }

}
