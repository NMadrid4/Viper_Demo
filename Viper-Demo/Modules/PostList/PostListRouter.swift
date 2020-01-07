//
//  PostListRouter.swift
//  Viper-Demo
//
//  Created by Nicolas on 1/7/20.
//  Copyright © 2020 Nicolas. All rights reserved.
//

import Foundation

class PostListRouter: PostListPresenterToRouterProtocol {
    static func createPostListModule(viewRef: PostListViewController) {
        let presenter: PostListViewToPresenterProtocol & PostListInteractorToPresenterProtocol = PostListPresenter()
        viewRef.presenter = presenter
        viewRef.presenter?.router = PostListRouter()
        viewRef.presenter?.view = viewRef
        viewRef.presenter?.interactor = PostListInteractor()
        viewRef.presenter?.interactor?.presenter = presenter
    }
    
}
