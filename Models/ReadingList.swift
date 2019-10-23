//
//  ReadingList.swift
//  MyReadingList
//
//  Created by LaKyah Tyner on 10/21/19.
//  Copyright © 2019 LaKyah Tyner. All rights reserved.
//

import Foundation
import Firebase

class ReadingList {
    
    var books: [Book]?
    
    init(_ books: [Book]?) {
        self.books = books
    }
}
