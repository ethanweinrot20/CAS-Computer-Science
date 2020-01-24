//
//  TableViewController.swift
//  Potion Index
//
//  Created by Ethan Weinrot on 1/21/20.
//  Copyright © 2020 Ethan Weinrot. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    var potions:[Potion] = [Potion]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let decoder = JSONDecoder()
        let data = try! Data(contentsOf: FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true) .appendingPathComponent("savefile.json"))
        let foundPotions = try! decoder.decode([Potion].self, from: data)
        
//        let potion1 = Potion()
//        potion1.name = "Super Sauce"
//        potion1.color = "Blue"
//        potion1.effect = "Super strength"
//        potions.append(potion1)
//
//        let potion2 = Potion()
//        potion2.name = "Bouncy Sauce"
//        potion2.color = "Red"
//        potion2.effect = "Super jump"
//        potions.append(potion2)
        
        

        print("Loading")
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return potions.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let currentPotion = potions[indexPath.row]
        cell.textLabel?.text =  currentPotion.name
        
        return cell
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tableView.reloadData()
        let url = getFileURL()
        
        let encoder = JSONEncoder()
        let dataToSave = try! encoder.encode(potions)
        try! dataToSave.write(to: url!)

    }
        
    func getFileURL() -> URL? {
           let docDirectory = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
           
           if docDirectory != nil{
               return docDirectory!.appendingPathComponent("savefile.json")
           }
           return nil
       }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    let vc = segue.destination as! ViewController
    if let indexPath = self.tableView.indexPathForSelectedRow{
        let potion = self.potions[indexPath.row]
        vc.potion = potion
    } else {
        let potion = Potion()
        potions.append(potion)
        vc.potion = potion
        print(potions.count)
    } }
    
    

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

}
