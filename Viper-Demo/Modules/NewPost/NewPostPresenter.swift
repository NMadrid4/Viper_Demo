//
//  NewPostPresenter.swift
//  Viper-Demo
//
//  Created by Nicolas on 1/7/20.
//  Copyright © 2020 Nicolas. All rights reserved.
//

import Foundation

class NewPostPresenter: NewPostViewToPresenterProtocol {
    var interactor: NewPostPresenterToInteractorProtocol?
    var router: NewPostPresenterToRouterProtocol?
    var view: NewPostPresenterToViewProtocol?
    
    func createPost(title: String?, body: String?) {
        interactor?.createNewPost(with: title, body: body)
    }
    
    func backToMain(viewRef: NewPostViewController) {
        router?.popView(viewRef: viewRef)
    }
}

extension NewPostPresenter: NewPostInteractorToPresenterProtocol {
    func createPostSuccess(message: String) {
        view?.showSuccessMessage(message: message)
    }
    
    func createPostFailure(message: String) {
        view?.showSuccessFailure(message: message)
    }
    
}
