//
//  EndPoint.swift
//  Viper-Demo
//
//  Created by Nicolas on 1/7/20.
//  Copyright © 2020 Nicolas. All rights reserved.
//

import Foundation
import Alamofire

enum EndPoint: String {
    case posts = "/posts"
}

extension EndPoint: URLConvertible {
    private static let BASE_URL = Bundle.main.infoDictionary?["base_url"] as? String ?? ""
    
    func paramURL<T>(param: T) -> URL {
        let urlString = EndPoint.BASE_URL + "\(rawValue)\(param)"
        do {
            print(urlString)
            return try urlString.asURL()
        } catch {
            print(error.localizedDescription)
            return URL(string: "")!
        }
    }
    
    func asURL() throws -> URL {
        let urlString = EndPoint.BASE_URL + "\(rawValue)"
        print(urlString)
        return try urlString.asURL()
    }

}

