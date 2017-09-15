//
//  ViewController.swift
//  Camera
//
//  Created by Kelvin on 9/13/17.
//  Copyright © 2017 Kelvin. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    var imagePicker: UIImagePickerController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        
    }

    @IBAction func changeImage(_ sender: Any) {
        let alert = UIAlertController(title: "Select Your Image", message: "Pick from album or take photo", preferredStyle: .actionSheet)
        
        let album = UIAlertAction(title: "Pick from Album", style: .default, handler: {
            (action) -> Void in
            self.present(self.imagePicker, animated: true, completion: nil)
        })
        
        let camera = UIAlertAction(title: "Take a Picture", style: .default, handler: {
            (action) -> Void in
            self.useCamera()
        })
        
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: {
            (action) -> Void in
        })
        
        alert.addAction(album)
        alert.addAction(camera)
        alert.addAction(cancel)
        
        self.present(alert, animated: true, completion: nil)
    }
    
    func useCamera() {
        imagePicker.allowsEditing = false
        imagePicker.sourceType = UIImagePickerControllerSourceType.camera
        imagePicker.cameraCaptureMode = .photo
        imagePicker.modalPresentationStyle = .fullScreen
        present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let img = info[UIImagePickerControllerOriginalImage] as? UIImage {
            imageView.image = img
        }
        imagePicker.dismiss(animated: true, completion: nil)
    }


}

