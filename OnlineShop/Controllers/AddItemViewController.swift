//
//  ViewController.swift
//  OnlineShop
//
//  Created by Artyom Potapov on 12.11.2022.
//

import UIKit
import Gallery
import JGProgressHUD
import NVActivityIndicatorView


class AddItemViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var priceTextField: UITextField!
    @IBOutlet weak var descriptionTextView: UITextView!
    var itemImages = [UIImage?]()
    
    var category: Category!
    var gallery: GalleryController!
    var hud = JGProgressHUD(style: .dark)
    var activityIndicator: NVActivityIndicatorView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        activityIndicator = NVActivityIndicatorView(frame: CGRect(x: view.frame.width / 2 - 30, y: view.frame.height / 2 - 30, width: 60, height: 60), type: NVActivityIndicatorType.ballPulse, color: #colorLiteral(red: 0.5, green: 0.3816443086, blue: 0.1365861744, alpha: 1), padding: nil)
    }

    @IBAction func cameraButtonTapped(_ sender: UIBarButtonItem) {
    
        itemImages = []
        showImagesGallery()
    }
    @IBAction func doneButtonTapped(_ sender: UIBarButtonItem) {
        if checkFieldsAreCompleted() {
            saveToFirebase()
        } else {
            print("Заполните все поля")
            //TODO:  показать ошибку пользователю
        }
    }
    
    @IBAction func tapGestureTapped(_ sender: UITapGestureRecognizer) {
        view.endEditing(false)
    }
    
//MARK: Helper functions
    
    func checkFieldsAreCompleted() -> Bool {
        
        return nameTextField.text != "" && priceTextField.text != "" && descriptionTextView.text != ""
    }
    
    func saveToFirebase() {
        showLoadingInticator()
        let item = Item()
        item.id = UUID().uuidString
        item.name = nameTextField.text
        item.categoryID = category.id
        item.description = descriptionTextView.text
        item.price = Int(priceTextField.text!)
        if itemImages.count > 0 {
            uploadImages(images: itemImages, itemId: item.id) { imageLinks in
                item.imageLinks = imageLinks
                saveItemToFirestore(item)
                self.hideLoadingInticator()
                self.navigationController?.popViewController(animated: false)
            }
        } else {
            saveItemToFirestore(item)
            navigationController?.popViewController(animated: false)
        }
    }
    
    //MARK: Activity Indicator
    
    func showLoadingInticator(){
        if activityIndicator != nil {
            view.addSubview(activityIndicator!)
            activityIndicator!.startAnimating()
        }
    }
    
    func hideLoadingInticator(){
        if activityIndicator != nil {
            view.removeFromSuperview()
            activityIndicator!.stopAnimating()
        }
    }
    
    //MARK: Show Gallery
    
    func showImagesGallery(){
        gallery = GalleryController()
        gallery.delegate = self
        Config.tabsToShow = [.imageTab, .cameraTab]
        Config.Camera.imageLimit = 4

        present(gallery, animated: false)
    }
}

extension AddItemViewController: GalleryControllerDelegate{
    func galleryController(_ controller: GalleryController, didSelectImages images: [Image]) {
       
        if images.count > 0{
            Image.resolve(images: images) { resolveImages in
                self.itemImages = resolveImages
            }
        }
        controller.dismiss(animated: false)
    }
    
    func galleryController(_ controller: GalleryController, didSelectVideo video: Video) {
        controller.dismiss(animated: false)
    }
    
    func galleryController(_ controller: GalleryController, requestLightbox images: [Image]) {
        controller.dismiss(animated: false)
    }
    
    func galleryControllerDidCancel(_ controller: GalleryController) {
        controller.dismiss(animated: false)
    }
}
