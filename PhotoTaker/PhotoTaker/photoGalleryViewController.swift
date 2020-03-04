//
//  photoGalleryViewController.swift
//  PhotoTaker
//
//  Created by Ethan Weinrot on 2/27/20.
//  Copyright © 2020 Ethan Weinrot. All rights reserved.
//

import UIKit

class photoGalleryViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var stackView: UIStackView!
    
    
    var images: [UIImage] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        uploadPhotos()

        // Do any additional setup after loading the view.
    }
    
    func uploadPhotos(){
        let pictures = images.map({(image) -> UIImageView in
            let newImageView = UIImageView()
            newImageView.image = image
            newImageView.frame = CGRect(x: 0, y: 0, width: 400, height: 600)
            return newImageView
        })
        let imageCount = images.count
        stackView.frame = CGRect(x: 0, y: 0, width: 400, height: imageCount*600)
        scrollView.contentSize = CGSize(width: 400, height: imageCount*600)
        for (_, image) in pictures.enumerated() {
            stackView.addArrangedSubview(image)
            let constraint = NSLayoutConstraint(item: image, attribute: .height, relatedBy: .equal, toItem: pictures[0], attribute: .height, multiplier: 1, constant: 1)
            if image != pictures[0] {
                stackView.addConstraint(constraint)
            }
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
