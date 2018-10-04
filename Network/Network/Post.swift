//
//  Post.swift
//  Network
//
//  Created by Artur on 04/10/2018.
//  Copyright © 2018 Artur Sardaryan. All rights reserved.
//

import Foundation


struct Post {
    
    let userId: Int
    let id: Int
    let title: String
    let body: String
    
}


extension Post {
    
    init?(dict: NSDictionary) {
        guard
            let userId = dict["userId"] as? Int,
            let id = dict["id"] as? Int,
            let title = dict["title"] as? String,
            let body = dict["body"] as? String
            else { return nil }
        
        self.userId = userId
        self.id = id
        self.title = title
        self.body = body
    }
    
    
}



