//
//  NewPostProtocols.swift
//  Viper-Demo
//
//  Created by Nicolas on 1/7/20.
//  Copyright © 2020 Nicolas. All rights reserved.
//

import Foundation

protocol NewPostPresenterToViewProtocol {
    var presenter: NewPostViewToPresenterProtocol? { get set }
    
    func showSuccessMessage(message: String)
    func showSuccessFailure(message: String)
}

protocol NewPostViewToPresenterProtocol {
    var interactor: NewPostPresenterToInteractorProtocol? { get set }
    var router: NewPostPresenterToRouterProtocol? { get set }
    var view: NewPostPresenterToViewProtocol? { get set }
    
    func createPost(title: String?, body: String?)
    func backToMain(viewRef: NewPostViewController)
}

protocol NewPostInteractorToPresenterProtocol {
    func createPostSuccess(message: String)
    func createPostFailure(message: String)
}

protocol NewPostPresenterToInteractorProtocol {
    var presenter: NewPostInteractorToPresenterProtocol? { get set }
    func createNewPost(with title: String?, body: String?)
    
}

protocol NewPostPresenterToRouterProtocol {
    static func createNewPostModule(viewRef: NewPostViewController)
    func popView(viewRef: NewPostViewController)
}
