//
//  NumberGuessViewController.swift
//  Number Guesser Final
//
//  Created by Ethan Weinrot on 2/19/20.
//  Copyright © 2020 Ethan Weinrot. All rights reserved.
//

import UIKit

class NumberGuessViewController: UIViewController {
    
    
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var scrollView: UIScrollView!
    var level = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        gameButtons()
    }
   
    
    func checkLevel() -> Int {
        if level == "Easy" {
            return 10
        }
        else if level == "Medium" {
            
            return 50
        }
        else {
            
            return 100
        }
    }
    
    @objc func gameButtons() {
        let checkDifficulty = checkLevel()
        let correctNumber = Int.random(in: 1...checkDifficulty)
        let buttons = (1...checkDifficulty).map({ (i) -> UIButton in
            let newButton = UIButton()
            newButton.setTitle("\(i)", for: .normal)
            newButton.frame = CGRect(x: 0, y: 0, width: 500, height: 30)
            newButton.backgroundColor = UIColor(displayP3Red: 0.8, green: 0.7, blue: 0.7, alpha: 1)
            
            if i > correctNumber {
                newButton.addTarget(self, action: #selector(tooHigh), for: .touchUpInside)
            }
            else if i < correctNumber {
                newButton.addTarget(self, action: #selector(tooLow), for: .touchUpInside)
            }
            else{
                newButton.addTarget(self, action: #selector(correct), for: .touchUpInside)
            }
            return newButton
            
        })
        stackView.frame = CGRect(x: 0, y: 0, width: 400, height: checkDifficulty*60)
        scrollView.contentSize = CGSize(width: 400, height: checkDifficulty*60)

        for button in buttons{
            stackView.addArrangedSubview(button)
            let constraint = NSLayoutConstraint(item: button, attribute: .height, relatedBy: .equal, toItem: buttons[0], attribute: .height, multiplier: 1, constant: 0)
            
            if button != buttons[0] {
                stackView.addConstraint(constraint)
                
            }
            
        }
    }
    
    func chooseLevel() {
        let VC: UIViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Menu") as UIViewController
        self.present(VC, animated: false, completion: nil)
    }
    
    
    @objc func tooLow(){
            let alert = UIAlertController(title: "NOPE!", message: "Too low!", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Try Again", style: .default))
            self.present(alert, animated: true, completion: {})
        }
        
    @objc func tooHigh(){
            let alert = UIAlertController(title: "NOPE!", message: "Too high!", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Try Again", style: .default))
            self.present(alert, animated: true, completion: {})
        }
        
    @objc func correct(){
            let alert = UIAlertController(title: "On The Nose!", message: "", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Play Again", style: .default, handler: {action in self.chooseLevel()}))
            self.present(alert, animated: true, completion: {})
        }
    }
    
    
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


