//
//  UserView.swift
//  Alamofire-AlamofireObjectMapper-Restful Api
//
//  Created by Mac10 on 6/5/18.
//  Copyright © 2018 Mac10. All rights reserved.
//

import UIKit

protocol UserView : NSObjectProtocol {
    
    func startLoading()
    func stopLoading()
    func signInSuccessful(message : String)
    func signUpSuccessful(message : String)
    func errorOccurred(message : String)
    
}
