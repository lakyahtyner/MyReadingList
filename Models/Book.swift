//
//  Book.swift
//  MyReadingList
//
//  Created by LaKyah Tyner on 10/21/19.
//  Copyright © 2019 LaKyah Tyner. All rights reserved.
//

import Foundation

class  Book {
    var title: String
    var year: String
    var author: Author
    
    init(title: String, year: String, author: Author){
        self.title = title
        self.year = year
        self.author = author
    }
    
    init(book: Book){
        self.title = book.title
        self.year = book.year
        self.author = Author(author: book.author)
    }
    
    func getAuthor() -> Author {
        return author
    }
    
    func getDictionary() -> [String: Any]{
        return ["title": title, "year": year,"author": ["firstName": author.firstName, "lastName": author.lastName]]
    }
}
