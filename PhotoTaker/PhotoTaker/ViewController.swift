//
//  ViewController.swift
//  PhotoTaker
//
//  Created by Ethan Weinrot on 2/20/20.
//  Copyright © 2020 Ethan Weinrot. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    var photos: [UIImage] = []
    var takerController: UIImagePickerController!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var galleryButton: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        switch AVCaptureDevice.authorizationStatus(for: .video) {
        case .notDetermined:
            AVCaptureDevice.requestAccess(for: .video, completionHandler: {(_) in return})
        default:
            return
        }
    }

    
    @IBAction func cameraButton(_ sender: Any) {
        takeIt()
    }
    
    func setupCaptureSession() {
        print("Take a photo")
    }
    
    func takeIt() {
        takerController = UIImagePickerController()
        takerController.delegate = self
        takerController.sourceType = .camera
        present(takerController, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        takerController.dismiss(animated: true, completion: nil)
        imageView.image = info[.originalImage] as? UIImage
        let image = info[.originalImage] as? UIImage
        photos.append(image!)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let gallery = segue.destination as? photoGalleryViewController, let sender = sender as? UIButton {
            if sender == galleryButton {
                gallery.images = photos

            }
        }
        
        
    }
    
}
