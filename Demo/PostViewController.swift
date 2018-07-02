//
//  PostViewController.swift
//  Demo
//
//  Created by 1amageek on 2018/07/02.
//  Copyright © 2018年 Stamp Inc. All rights reserved.
//

import UIKit
import Pring

class PostViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!

    @IBAction func showImagePickerController(_ sender: Any) {
        let controller: UIImagePickerController = UIImagePickerController()
        controller.sourceType = .photoLibrary
        controller.delegate = self
        self.present(controller, animated: true, completion: nil)
    }

    @IBAction func post(_ sender: Any) {
        guard let image: UIImage = self.imageView.image else { return }
        let post: Post = Post()
        let data: Data = UIImageJPEGRepresentation(image, 0.5)!
        post.image = File(data: data)
        post.save { (_, _) in
            self.dismiss(animated: true, completion: nil)
        }
    }
}

extension PostViewController: UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        guard let image: UIImage = info[UIImagePickerControllerOriginalImage] as? UIImage else { return }
        self.imageView.image = image
        self.imageView.setNeedsDisplay()
        picker.dismiss(animated: true, completion: nil)
    }
}
