//
//  NewPostRouter.swift
//  Viper-Demo
//
//  Created by Nicolas on 1/7/20.
//  Copyright © 2020 Nicolas. All rights reserved.
//

import Foundation

class NewPostRouter: NewPostPresenterToRouterProtocol {
    static func createNewPostModule(viewRef: NewPostViewController) {
        let presenter: NewPostViewToPresenterProtocol & NewPostInteractorToPresenterProtocol = NewPostPresenter()
        viewRef.presenter = presenter
        viewRef.presenter?.view = viewRef
        viewRef.presenter?.router = NewPostRouter()
        viewRef.presenter?.interactor = NewPostInteractor()
        viewRef.presenter?.interactor?.presenter = presenter
    }
    
    func popView(viewRef: NewPostViewController) {
        viewRef.navigationController?.popViewController(animated: true)
    }
}
