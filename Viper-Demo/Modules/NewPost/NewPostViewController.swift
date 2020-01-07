//
//  NewPostViewController.swift
//  Viper-Demo
//
//  Created by Nicolas on 1/7/20.
//  Copyright © 2020 Nicolas. All rights reserved.
//

import UIKit

class NewPostViewController: UIViewController, Storyboarded, NewPostPresenterToViewProtocol {
    // MARK: - Properties
    var presenter: NewPostViewToPresenterProtocol?
    
    // MARK: - IBOutlets
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var bodyTextView: UITextView!
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setDesign()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    private func setDesign() {
        bodyTextView.layer.cornerRadius = 5
        bodyTextView.layer.borderWidth = 1
        bodyTextView.layer.borderColor = UIColor.lightGray.cgColor
        
        titleTextField.layer.cornerRadius = 5
        titleTextField.layer.borderWidth = 1
        titleTextField.layer.borderColor = UIColor.lightGray.cgColor
    }
    
    func showSuccessMessage(message: String) {
        showAlert(
            title: "Aviso",
            message: message,
            completion: {[weak self] (_) in
                guard let self = self else { return }
                self.presenter?.backToMain(viewRef: self)
        }, canCancel: false)
    }
    
    func showSuccessFailure(message: String) {
        showAlert(
            title: "Error",
            message: message,
            completion: nil
        )
    }
    
    @IBAction func createPost(_ sender: UIButton) {
        presenter?.createPost(
            title: titleTextField.text,
            body: bodyTextView.text
        )
    }
}
