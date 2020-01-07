//
//  PostListPresenter.swift
//  Viper-Demo
//
//  Created by Nicolas on 1/7/20.
//  Copyright © 2020 Nicolas. All rights reserved.
//

import Foundation

class PostListPresenter: PostListViewToPresenterProtocol {
    
    var interactor: PostListPresenterToInteractorProtocol?
    var router: PostListPresenterToRouterProtocol?
    var view: PostListPresenterToViewProtocol?
    
    func loadPosts() {
        interactor?.getPosts()
    }
    
    func showAddNewPost(view: PostListViewController) {
        router?.showAddNewPost(view: view)
    }
}

extension PostListPresenter: PostListInteractorToPresenterProtocol {
    func gettingPostsSuccess(posts: [Post]) {
        view?.showPosts(posts: posts)
    }
    
    func gettingPostsFailure(message: String) {
        view?.showFailurePost(message: message)
    }
    
}
