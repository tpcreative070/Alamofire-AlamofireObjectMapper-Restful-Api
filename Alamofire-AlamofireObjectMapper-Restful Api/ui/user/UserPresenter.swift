//
//  UserPresenter.swift
//  Alamofire-AlamofireObjectMapper-Restful Api
//
//  Created by Mac10 on 6/5/18.
//  Copyright © 2018 Mac10. All rights reserved.
//

import UIKit

class UserPresenter: NSObject {
    
    private let userService : UserAPI
    weak private var userView : UserView?
    
    init(userService : UserAPI) {
        self.userService  = userService
    }
    
    func attachView(view : UserView){
        self.userView = view
    }
    
    func detachView(){
        self.userView = nil
    }
    
    func onSignIn(request : UserRequest){
        userService.onSignIn(request: request) {[weak self] user in
            self?.userView?.stopLoading()
            if user.error! {
                self?.userView?.errorOccurred(message: user.message!)
            }
            else{
                ShareReferences.shared.setUser(user: user.user!)
                self?.userView?.signInSuccessful(message: user.message!)
            }
        }
    }
    
    func onSignUp(request : UserRequest){
        userService.onSignUp(request: request) {[weak self] user in
            self?.userView?.stopLoading()
            if user.error! {
                self?.userView?.errorOccurred(message: user.message!)
            }
            else{
                self?.userView?.signInSuccessful(message: user.message!)
            }
        }
    }
    
}
