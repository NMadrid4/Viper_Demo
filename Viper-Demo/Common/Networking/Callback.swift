//
//  Callback.swift
//  Viper-Demo
//
//  Created by Nicolas on 1/7/20.
//  Copyright © 2020 Nicolas. All rights reserved.
//

import Foundation

typealias GetPostCallback = (Swift.Result<[Post], Error>) -> ()
typealias CreatePostCallback = (Swift.Result<Post, Error>) -> ()
