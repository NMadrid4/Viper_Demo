//
//  NewPostInteractor.swift
//  Viper-Demo
//
//  Created by Nicolas on 1/7/20.
//  Copyright © 2020 Nicolas. All rights reserved.
//

import Foundation
import Alamofire

class NewPostInteractor: NewPostPresenterToInteractorProtocol {
    var presenter: NewPostInteractorToPresenterProtocol?
    
    func createNewPost(with title: String?, body: String?) {
        if (title ?? "").isEmpty {
            presenter?.createPostFailure(message: "Title is empty")
            return
        }
        
        if (body ?? "").isEmpty {
            presenter?.createPostFailure(message: "Body is empty")
            return
        }
        
        callCreatePost(
            post: Post(
                title: title!,
                body: body!
        )) {[weak self] (result) in
            switch result {
            case .success(let post):
                self?.presenter?.createPostSuccess(message: "Post with title: \(post.title) created")
                break
            case .failure(let error):
                self?.presenter?.createPostFailure(message: error.localizedDescription)
                break
            }
        }
    }
    
    func callCreatePost(post: Post, completion: @escaping CreatePostCallback) {
        let params = ["title": post.title,
                      "body": post.body,
                      "userId": 1] as [String : Any]
        request(
            EndPoint.posts,
            method: .post,
            parameters: params
        ).validate()
            .responseData { (response) in
                switch response.result {
                case .success(let data):
                    do {
                        let decodedData = try JSONDecoder().decode(
                            Post.self,
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
                    completion(.failure(error))
                }
        }
    }
    
}
