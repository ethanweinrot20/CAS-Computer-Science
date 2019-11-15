//
//  TableViewController.swift
//  BoatDictionary
//
//  Created by Ethan Weinrot on 11/8/19.
//  Copyright © 2019 Ethan Weinrot. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    let boats:[Boat] = [
        Boat(n: "Yacht", dp: 320, c: "White", s: "Lagre"),
        Boat(n: "Pirate Ship", dp: 87, c: "Wood Color", s: "Pirate ship size"),
        Boat(n: "Kayak", dp: 0, c: "Orange", s: "9 feet"),
        Boat(n: "Titanic", dp: 16000, c: "Black and white with some red", s: "882 feet and 9 inches"),
        Boat(n: "Submarine", dp: 4999, c: "Silver and cool", s: "Invisible")

        

//
//        "Titanic": [
//            "Color": "Black and White with some red",
//            "Size": "882 feet and 9 inches",
//            "Dolphin Power": "16,000"
//        ],
//
//        "Submarine": [
//            "Color": "Silver and cool",
//            "Size": "invisible",
//            "Dolphin Power": "Powerful"
//        ]
    ]
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        let list = boats
        return list.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = boats[indexPath.row].name
        
        return cell
    }
    

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! ViewController
        let indexPath = self.tableView.indexPathForSelectedRow
        let b = self.boats[indexPath!.row]
        vc.boat = b
        }
}

