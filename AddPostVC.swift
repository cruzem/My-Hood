//
//  AddPostVC.swift
//  my-hood
//
//  Created by Emmanuel Cruz on 5/5/16.
//  Copyright © 2016 devPro. All rights reserved.
//

import UIKit

class AddPostVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var postImg: UIImageView!
    
    @IBOutlet weak var descriptionField: UITextField!
    @IBOutlet weak var titleField: UITextField!
    
    var imagePicker: UIImagePickerController!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        

        // Do any additional setup after loading the view.
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.view.layoutIfNeeded()
        postImg.layer.cornerRadius = postImg.frame.size.width / 2
        postImg.clipsToBounds = true
        
    }

    @IBAction func addPicBtnPressed(_ sender: UIButton!) {
        sender.setTitle("", for: .normal)
        present(imagePicker, animated: true, completion: nil)
        
    }
 
    @IBAction func makeBtnPostPressed(_ sender: AnyObject) {
        if let title = titleField.text , let desc = descriptionField.text, let img = postImg.image {
            
            let imgPath = DataService.instance.saveImageAndCreatePath(img)
                
            let post = Post(imagePath: imgPath, title: title, description: desc)
            DataService.instance.addPost(post)
            dismiss(animated: true, completion: nil)
        }
        
    }

    @IBAction func cancelBtnPressed(_ sender: AnyObject) {
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        imagePicker.dismiss(animated: true, completion: nil)
        postImg.image = image
    }
}
