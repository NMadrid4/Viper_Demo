//
//  Util.swift
//  Viper-Demo
//
//  Created by Nicolas on 1/7/20.
//  Copyright © 2020 Nicolas. All rights reserved.
//

import Foundation

class Util {
    static func createError(with message: String, code: Int = -99) -> Error {
        let error = NSError(
            domain:"",
            code: code,
            userInfo:[ NSLocalizedDescriptionKey: "\(message)"]
            ) as Error
        return error
    }
}
