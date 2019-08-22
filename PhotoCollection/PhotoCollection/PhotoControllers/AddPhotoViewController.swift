//
//  AddPhotoViewController.swift
//  PhotoCollection
//
//  Created by Alex Rhodes on 8/20/19.
//  Copyright © 2019 Alex Rhodes. All rights reserved.
//

import UIKit

class AddPhotoViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var photoController: PhotoController?
    
    var collectionView: UICollectionView?
    
    var themePreference: ThemePreference?
    
    var photo: Photo?
    
    
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var photoNameTextField: UITextField!
    @IBOutlet weak var uploadImageButton: UIButton!
    @IBOutlet weak var savePhotoButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setViews()
        
    }
    
    func setViews() {
        photoImageView.backgroundColor = .lightGray
        
        savePhotoButton.setTitle("SAVE", for: .normal)
        savePhotoButton.setTitleColor(.white, for: .normal)
        savePhotoButton.backgroundColor = #colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1)
        savePhotoButton.layer.cornerRadius = 8
        
        uploadImageButton.setTitle("UPLOAD IMAGE", for: .normal)
        uploadImageButton.setTitleColor(.white, for: .normal)
        uploadImageButton.backgroundColor = #colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1)
        uploadImageButton.layer.cornerRadius = 8
        
        guard let photo = photo  else {return}
        photoImageView.image = photo.photo
        photoNameTextField.text = photo.name
        
    }
    
    @IBAction func uploadImageButtonTapped(_ sender: UIButton) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        
        let actionSheet = UIAlertController(title: "Photo Source", message: "Please select your photo source.", preferredStyle: .actionSheet)
        
        actionSheet.addAction(UIAlertAction(title: "Camera", style: .default, handler: { (action: UIAlertAction) in
            if UIImagePickerController.isSourceTypeAvailable(.camera) {
                imagePicker.sourceType = .camera
                self.present(imagePicker, animated: true, completion: nil)
            } else {
                let alert =  UIAlertController(title: "Camera Unavailable", message: "We were unable to gain access to your camera.", preferredStyle: .alert)
                self.present(alert, animated: true, completion: nil)
                
            }
            
            
        }))
        actionSheet.addAction(UIAlertAction(title: "Photo Library", style: .default, handler: { (action: UIAlertAction) in
            imagePicker.sourceType = .photoLibrary
            self.present(imagePicker, animated: true, completion: nil)
        }))
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil ))
        
        present(actionSheet, animated: true, completion: nil)
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        photoImageView.image = selectedImage
        
        picker.dismiss(animated: true, completion: nil)
        
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }

    
    @IBAction func saveImageButtonTapped(_ sender: UIButton) {
        guard let photo = photoImageView.image,
            let name = photoNameTextField.text else {return}
        
        photoController?.addPhoto(name: name, image: photo)
        navigationController?.popViewController(animated: true)
    }
}
