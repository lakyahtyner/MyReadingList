//
//  AddBookController.swift
//  MyReadingList
//
//  Created by LaKyah Tyner on 10/17/19.
//  Copyright © 2019 LaKyah Tyner. All rights reserved.
//

import UIKit
import Firebase

class AddBookController: UITableViewController {
   
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var yearTextField: UITextField!
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    
    var author: [String: String] {
        return [ "firstName" : "\(firstNameTextField.text ?? "")",
            "lastName" : "\(lastNameTextField.text ?? "")"
        ]
    }
    var book: Book{
        return Book(title: titleTextField.text!, year: yearTextField.text!, author: Author(firstName: firstNameTextField.text, lastName: lastNameTextField.text))
    }
    
    var addBook: ((Book) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "Done"){
            addBook?(book)
            print("Book Added!")
        }
    }
}
