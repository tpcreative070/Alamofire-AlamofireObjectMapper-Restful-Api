//
//  ShareReferences.swift
//  Alamofire-AlamofireObjectMapper-Restful Api
//
//  Created by Mac10 on 6/6/18.
//  Copyright © 2018 Mac10. All rights reserved.
//

import UIKit

class ShareReferences: NSObject {
    
    var user  = User()
 
    public class var shared: ShareReferences {
        struct Static {
            static let instance: ShareReferences = ShareReferences()
        }
        return Static.instance
    }
    
    func setUser(user : User){
        self.user = user
    }
    func getUser() -> User {
        return user
    }
    

}
