//
//  EditBookController.swift
//  MyReadingList
//
//  Created by LaKyah Tyner on 10/24/19.
//  Copyright © 2019 LaKyah Tyner. All rights reserved.
//

import Foundation
import UIKit

class EditBookController: UITableViewController {
    
    var book: Book?
    var dbDelagate = FirebaseDelagate()
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var yearTextField: UITextField!
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        titleTextField.text = book?.title
        yearTextField.text = book?.year
        firstNameTextField.text = book?.author.firstName
        lastNameTextField.text = book?.author.lastName
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "Done":
            dbDelagate.delete(book!.title)
            dbDelagate.insert(Book(title: titleTextField.text!, year: yearTextField.text!, author: Author(firstName: firstNameTextField.text!, lastName: lastNameTextField.text!)))
        default:
            return
        }
    }
}
