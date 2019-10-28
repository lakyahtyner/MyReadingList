//
//  DataFirebase.swift
//  MyReadingList
//
//  Created by LaKyah Tyner on 10/21/19.
//  Copyright © 2019 LaKyah Tyner. All rights reserved.
//

import Foundation
import UIKit
import Firebase

class FirebaseDelagate {
    
    var db: Firestore!
    var books = [Book]()
    
    init() {
        db = Firestore.firestore()
    }
    
    func insert(_ book:Book) {
//        var ref: DocumentReference? = nil
//        ref = db.collection("authors").addDocument(data: book.getAuthor().getDictionary() as! [String : Any]
//        ){ err in
//            if let err = err {
//                print("Error writing document: \(err)")
//            } else {
//                print("Document successfully written!")
//            }
//        }
        
        db.collection("readinglist").document(book.title).setData(book.getDictionary()
        ){ err in
            if let err = err {
                print("Error writing document: \(err)")
            } else {
                print("Document successfully written!")
            }
        }
    }
    
    func delete(_ title: String){
        db.collection("readinglist").document("\(title)").delete() { err in
            if let err = err {
                print("Error removing document: \(err)")
            } else {
                print("Document successfully removed!")
            }
        }
    }
}
