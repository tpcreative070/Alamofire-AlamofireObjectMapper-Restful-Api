//
//  UserAPI.swift
//  Alamofire-AlamofireObjectMapper-Restful Api
//
//  Created by Mac10 on 6/5/18.
//  Copyright © 2018 Mac10. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireObjectMapper
import SwiftyJSON

class UserAPI: NSObject {
    
    
    func onSignIn(request : UserRequest, callBack : @escaping (UserResponse) -> Void){
       
        let parameters  : Parameters =  ["email" : request.email! , "password" : request.password!]
        Alamofire.request(API.SIGNIN, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: [:]).responseObject {
            (response: DataResponse<UserResponse>)  in
            switch response.result {
            case .success:
                DispatchQueue.main.async {
                    callBack(response.result.value!)
                }
                break
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func onSignUp(request : UserRequest , callBack : @escaping  (UserResponse) -> Void) {
       
        let parameters  : Parameters =  ["name" : request.name! , "email" : request.email! , "password" : request.password!]
        
        Alamofire.request(API.SIGNUP, method: .post , parameters : parameters , encoding : URLEncoding.default, headers: [:]).responseObject {
             (response: DataResponse<UserResponse>)  in
            switch response.result {
            case .success:
                DispatchQueue.main.async {
                    callBack(response.result.value!)
                }
                break
            case .failure(let error):
                print(error)
            }
        }
    }
    

}
