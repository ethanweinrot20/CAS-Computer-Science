//
//  ViewController.swift
//  Another SWAPI App
//
//  Created by Ethan Weinrot on 12/11/19.
//  Copyright © 2019 Ethan Weinrot. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var label: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    
    }

    @IBAction func pressOne(_ sender: Any) {
        let url: URL = URL(string: "https://swapi.co/api/films/2/")!
        let responseData: Data? = try? Data(contentsOf: url)
        if let responseData = responseData{
            let json: Any? = try? JSONSerialization.jsonObject(with: responseData, options: [])
            if let json = json {
                let dictionary: [String: Any]? = json as? [String: Any]
                if let dictionary = dictionary {
                    let title: String? = dictionary["title"] as? String
                    let releaseDate: String? = dictionary["release_date"] as? String
                    let episode: Int? = dictionary["episode_id"] as? Int
                    if let title = title {
                        titleLabel.text = "\(title)"
                        label.text = "\(title) is the second film released in the Star Wars series but it's episode number \(episode!). It was released in \(releaseDate ?? "Error")."
                    }
                }
            }
        }
    }
    
    @IBAction func buttonTwo(_ sender: Any) {
        let url: URL = URL(string: "https://swapi.co/api/films/4/")!
               let responseData: Data? = try? Data(contentsOf: url)
               if let responseData = responseData{
                   let json: Any? = try? JSONSerialization.jsonObject(with: responseData, options: [])
                   if let json = json {
                       let dictionary: [String: Any]? = json as? [String: Any]
                       if let dictionary = dictionary {
                           let title: String? = dictionary["title"] as? String
                           let releaseDate: String? = dictionary["release_date"] as? String
                           let episode: Int? = dictionary["episode_id"] as? Int
                           if let title = title {
                            titleLabel.text = "\(title)"
                            label.text = "\(title) is the second film released in the Star Wars series but it is episode number \(episode!). It was released in \(releaseDate ?? "Error")."
                           }
                       }
                   }
               }
        
        
    }
    
    @IBAction func buttonThree(_ sender: Any) {
        let url: URL = URL(string: "https://swapi.co/api/films/6/")!
        let responseData: Data? = try? Data(contentsOf: url)
        if let responseData = responseData{
            let json: Any? = try? JSONSerialization.jsonObject(with: responseData, options: [])
            if let json = json {
                let dictionary: [String: Any]? = json as? [String: Any]
                if let dictionary = dictionary {
                    let title: String? = dictionary["title"] as? String
                    let releaseDate: String? = dictionary["release_date"] as? String
                    let episode: Int? = dictionary["episode_id"] as? Int
                    if let title = title {
                        titleLabel.text = "\(title)"
                        label.text = "\(title) is the second film released in the Star Wars series but it is episode number \(episode!). It was released in \(releaseDate ?? "3")."
                    }
                }
            }
        }
        
    }
    
    
}

