//
//  ViewController.swift
//  QuanliAppSinhVienCoreData
//
//  Created by Boss on 4/17/19.
//  Copyright © 2019 Boss. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var txtname: UITextField!
    
    @IBOutlet weak var txttuoi: UITextField!
    var student: Student?
    var indexPath: IndexPath?
//    let context = AppDelegate.context

    override func viewDidLoad() {
        super.viewDidLoad()
        if student != nil{
            image.image =  UIImage(data: student?.image as! Data)
            txtname.text = student?.name
            txttuoi.text = String(student!.age)
        }
     
        // Do any additional setup after loading the view.
    }
    @IBAction func selectImageFromPhotoLibrary(_ sender: UITapGestureRecognizer) {
        
        
        // UIImagePickerController is a view controller that lets a user pick media from their photo library.
        let imagePickerController = UIImagePickerController()
        
        // Only allow photos to be picked, not taken.
        imagePickerController.sourceType = .photoLibrary
        
        // Make sure ViewController is notified when the user picks an image.
        imagePickerController.delegate = self
        present(imagePickerController, animated: true, completion: nil)
    }
    @IBAction func Save(_ sender: Any) {
        if indexPath != nil{
            student?.age = Int64(txttuoi.text!)!
            student?.name = txtname.text
            if image.image != nil{
                student?.image = image.image?.pngData()! as NSObject?
            }
        }else{
         let students = Student(context: AppDelegate.context)
            students.age = Int64(txttuoi.text!)!
            students.name = txtname.text
            if image.image != nil{
                students.image = image.image?.pngData()! as NSObject?
            }
        }
        AppDelegate.saveContext()
        navigationController?.popViewController(animated: true)
        
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else {
            fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
        }
        
        // Set photoImageView to display the selected image.
        image.image = selectedImage
        
        // Dismiss the picker.
        dismiss(animated: true, completion: nil)
    }
    

}

