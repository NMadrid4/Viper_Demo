//
//  PostListViewController.swift
//  Viper-Demo
//
//  Created by Nicolas on 1/7/20.
//  Copyright © 2020 Nicolas. All rights reserved.
//

import UIKit

class PostListViewController: UIViewController {
    
    // MARK: - Properties
    private var posts = [Post]()
    var presenter: PostListViewToPresenterProtocol?
    
    // MARK: - IBOutlets
    @IBOutlet weak var postsTableView: UITableView!
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        PostListRouter.createPostListModule(viewRef: self)
        presenter?.loadPosts()   
    }    
}
    // MARK: - Extensions
extension PostListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: "cell",
            for: indexPath
        ) as! PostListTableViewCell
        cell.post = posts[indexPath.row]
        return cell
    }
    
}

extension PostListViewController: PostListPresenterToViewProtocol {
    func showFailurePost(message: String) {
        showAlert(
            title: "Error",
            message: message,
            completion: nil
        )
    }
    
    func showPosts(posts: [Post]) {
        self.posts = posts
        postsTableView.reloadData()
    }    
}
