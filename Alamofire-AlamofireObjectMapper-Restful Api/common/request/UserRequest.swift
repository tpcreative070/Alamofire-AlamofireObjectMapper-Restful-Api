//
//  UserRequest.swift
//  Alamofire-AlamofireObjectMapper-Restful Api
//
//  Created by Mac10 on 6/5/18.
//  Copyright © 2018 Mac10. All rights reserved.
//

import UIKit
import ObjectMapper

struct UserRequest : Mappable {
    
    var name : String?
    var email : String?
    var password : String?
    
    init(name : String , email : String , password : String ) {
        self.name = name
        self.email = email
        self.password = password
    }
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        self.name <- map["name"]
        self.email <- map["email"]
        self.password <- map["password"]
    }
    
}
