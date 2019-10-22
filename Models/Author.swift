//
//  Author.swift
//  MyReadingList
//
//  Created by LaKyah Tyner on 10/21/19.
//  Copyright © 2019 LaKyah Tyner. All rights reserved.
//

import Foundation

class Author {
    
    var firstName: String?
    var lastName: String?
    
    init(_ firstName: String?, _ lastName: String?){
        self.firstName = firstName ?? ""
        self.lastName = lastName ?? ""
    }
}
