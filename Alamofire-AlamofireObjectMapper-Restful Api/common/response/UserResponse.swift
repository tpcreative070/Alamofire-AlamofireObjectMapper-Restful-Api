//
//  UserResponse.swift
//  Alamofire-AlamofireObjectMapper-Restful Api
//
//  Created by Mac10 on 6/5/18.
//  Copyright © 2018 Mac10. All rights reserved.
//

import UIKit
import ObjectMapper

struct UserResponse: Mappable {
    
    var message : String?
    var error : Bool?
    var user : User?
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        self.user <- map["user"]
        self.message <- map["message"]
        self.error <- map["error"]
    }
    
    
}
