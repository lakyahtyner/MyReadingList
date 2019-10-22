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
    
    var books: [DocumentSnapshot]?
    
    init(_ books: [DocumentSnapshot]?) {
        self.books = books
    }
}
