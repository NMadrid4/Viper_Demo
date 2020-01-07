//
//  PostListProtocols.swift
//  Viper-Demo
//
//  Created by Nicolas on 1/7/20.
//  Copyright © 2020 Nicolas. All rights reserved.
//

import Foundation

protocol PostListViewToPresenterProtocol: class {
    var view: PostListPresenterToViewProtocol? {get set}
    var interactor: PostListPresenterToInteractorProtocol? {get set}
    var router: PostListPresenterToRouterProtocol? {get set}
    
    func loadPosts()
    func showAddNewPost(view: PostListViewController)
}
 
protocol PostListPresenterToViewProtocol: class {
    func showPosts(posts: [Post])
    func showFailurePost(message: String)
}

protocol PostListInteractorToPresenterProtocol: class {
    func gettingPostsSuccess(posts: [Post])
    func gettingPostsFailure(message: String)
}

protocol PostListPresenterToInteractorProtocol: class {
    var presenter: PostListInteractorToPresenterProtocol? {get set}
    func getPosts()
}

protocol PostListPresenterToRouterProtocol: class {
    static func createPostListModule(viewRef: PostListViewController)
    func showAddNewPost(view: PostListViewController)
}
