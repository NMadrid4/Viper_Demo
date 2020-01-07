//
//  Post.swift
//  Viper-Demo
//
//  Created by Nicolas on 1/7/20.
//  Copyright © 2020 Nicolas. All rights reserved.
//

import Foundation

struct Post: Decodable {
    var id: Int
    var title: String
    var body: String
}
