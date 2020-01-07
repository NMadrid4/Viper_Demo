//
//  UIViewController+.swift
//  Viper-Demo
//
//  Created by Nicolas on 1/7/20.
//  Copyright © 2020 Nicolas. All rights reserved.
//

import UIKit

extension UIViewController {
    func showAlert(title: String, message: String,
                           actionName: String = "Aceptar",
                           completion: ((UIAlertAction) -> ())?,
                           canCancel: Bool = false) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let accept = UIAlertAction(title: actionName, style: .default, handler: completion)
        let cancel = UIAlertAction(title: "Cancelar", style: .default, handler: nil)
        alert.addAction(accept)
        if canCancel {
            alert.addAction(cancel)
        }
        present(alert, animated: true)
    }
}
