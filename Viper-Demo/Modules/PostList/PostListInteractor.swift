//
//  PostListInteractor.swift
//  Viper-Demo
//
//  Created by Nicolas on 1/7/20.
//  Copyright © 2020 Nicolas. All rights reserved.
//

import Foundation
import Alamofire

class PostListInteractor: PostListPresenterToInteractorProtocol {
    var presenter: PostListInteractorToPresenterProtocol?
    
    func getPosts() {
        fetchPosts {[weak self] (result) in
            switch result {
            case .success(let posts):
                self?.presenter?.gettingPostsSuccess(posts: posts)
                break
            case .failure(let error):
                print(error)
                self?.presenter?.gettingPostsFailure(message: error.localizedDescription)
            }
        }
    }
    
    
    func fetchPosts(completion: @escaping GetPostCallback) {
        request(
            EndPoint.posts
        ).validate()
            .responseData { (response) in
                switch response.result {
                case .success(let data):
                    do {
                        let decodedData = try JSONDecoder().decode(
                            [Post].self,
                            from: data
                        )
                        completion(.success(decodedData))
                    }catch {
                        print("Post error: ", error)
                        completion(
                            .failure(
                                Util.createError(with: "Ocurrió un problema")
                            )
                        )
                    }
                    
                case .failure(let error):
                    completion(
                        .failure(
                            Util.createError(with: "Ocurrió un problema", code: error._code)
                        )
                    )
                }
        }
    }
    
}
