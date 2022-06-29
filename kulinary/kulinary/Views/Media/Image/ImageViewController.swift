//
//  ImageViewController.swift
//  kulinary
//
//  Created by Tommy Yon Prakoso on 27/06/22.
//

import UIKit

class ImageViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!

    let imagePicker = UIImagePickerController()


    override func viewDidLoad() {
        super.viewDidLoad()

        imagePicker.delegate = self
    }

    @IBAction func didTapUploadBtn(_ sender: Any) {
        imagePicker.allowsEditing = true
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true)
    }
}

extension ImageViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    private func imagePickerControllerDelegate(_ picker: UIImagePickerController,didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info [UIImagePickerController.InfoKey.originalImage] as? UIImage {
            imageView.contentMode = .center
            imageView.image = pickedImage
        }

        dismiss(animated: true, completion: nil)
    }
}
