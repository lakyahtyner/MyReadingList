//
//  Author.swift
//  MyReadingList
//
//  Created by LaKyah Tyner on 10/21/19.
//  Copyright © 2019 LaKyah Tyner. All rights reserved.
//

import Foundation

class Author {
    
    var firstName: String
    var lastName: String
    
    init(firstName: String?, lastName: String?){
        self.firstName = firstName ?? ""
        self.lastName = lastName ?? ""
    }
    
    init(author: Author) {
        self.firstName = author.firstName
        self.lastName = author.lastName
    }
    
    func getDictionary() -> [String: Any]{
        return ["firstName": firstName, "lastName": lastName]
    }
}
