//
//  Book.swift
//  MyReadingList
//
//  Created by LaKyah Tyner on 10/21/19.
//  Copyright © 2019 LaKyah Tyner. All rights reserved.
//

import Foundation

class Book {
    var title: String
    var year: String
    var author: [String: String]?
    
    init(_ title: String, _ year: String, _ author: [String: String]?){
        self.title = title
        self.year = year
        self.author = author ?? nil
    }
    
    func getAuthor() -> [String: String]? {
        return author
    }
    
    func getDictionary() -> [String: Any?]{
        return ["title": title,
                "author": author]
    }
}
