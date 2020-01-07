//
//  Storyboarded.swift
//  Viper-Demo
//
//  Created by Nicolas on 1/7/20.
//  Copyright © 2020 Nicolas. All rights reserved.
//

import UIKit

protocol Storyboarded {
    static func instantiate(storyboard: UIStoryboard) -> Self

}
extension Storyboarded where Self: UIViewController {
    static func instantiate(storyboard: UIStoryboard) -> Self {
        let id = String(describing: self)
        return storyboard.instantiateViewController(withIdentifier: id) as! Self
    }
}
