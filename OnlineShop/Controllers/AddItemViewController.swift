//
//  ViewController.swift
//  OnlineShop
//
//  Created by Artyom Potapov on 12.11.2022.
//

import UIKit

class AddItemViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var priceTextField: UITextField!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    var category: Category!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func cameraButtonTapped(_ sender: UIBarButtonItem) {
    
    }
    @IBAction func doneButtonTapped(_ sender: UIBarButtonItem) {
        if checkFieldsAreCompleted() {
            print("Отлично")
            //TODO:  сохранить новый товар
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
}

