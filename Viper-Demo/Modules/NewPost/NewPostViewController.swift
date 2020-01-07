//
//  NewPostViewController.swift
//  Viper-Demo
//
//  Created by Nicolas on 1/7/20.
//  Copyright © 2020 Nicolas. All rights reserved.
//

import UIKit

class NewPostViewController: UIViewController, Storyboarded {
    
    // MARK: - Properties
    
    // MARK: - IBOutlets
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var bodyTextView: UITextView!
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setDesign()
    }
    
    private func setDesign() {
        bodyTextView.layer.cornerRadius = 5
        bodyTextView.layer.borderWidth = 1
        bodyTextView.layer.borderColor = UIColor.lightGray.cgColor
        
        titleTextField.layer.cornerRadius = 5
        titleTextField.layer.borderWidth = 1
        titleTextField.layer.borderColor = UIColor.lightGray.cgColor
    }
    
}
