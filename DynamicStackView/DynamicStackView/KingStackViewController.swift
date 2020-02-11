//
//  KingStackViewController.swift
//  DynamicStackView
//
//  Created by Ethan Weinrot on 2/6/20.
//  Copyright © 2020 Ethan Weinrot. All rights reserved.
//

import UIKit

class KingStackViewController: UIViewController {

    @IBOutlet weak var lordStackView: UIStackView!
    
    var imageCount = 5
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let images = (1...imageCount).map({ (x) -> UIImageView in
            let newImage = UIImageView()
            newImage.image = UIImage(named: "horse")
            newImage.frame = CGRect(x: 0, y: 0, width: 100, height: 200)
            return newImage
        })
        
        for (x, image) in images.enumerated(){
            lordStackView.addArrangedSubview(image)
            let mult = 1.0 / Double(imageCount)
            image.backgroundColor = UIColor(cgColor: CGColor(srgbRed: CGFloat(mult*Double(x)), green: CGFloat(0), blue: CGFloat(1 - mult*Double(x)), alpha: 1))
            
//            let constraint = NSLayoutConstraint(item: images, attribute: .height, relatedBy: .equal, toItem: images, attribute: .height, multiplier: 1, constant: 1)
//            if x != 0 {
//                lordStackView.addConstraint(constraint)
//            }
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

}

