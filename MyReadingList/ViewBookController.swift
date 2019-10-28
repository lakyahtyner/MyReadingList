//
//  ViewBookController.swift
//  MyReadingList
//
//  Created by LaKyah Tyner on 10/23/19.
//  Copyright © 2019 LaKyah Tyner. All rights reserved.
//

import Foundation
import UIKit

class ViewBookController: UITableViewController {
    
    var book: Book?
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var lastNameLabel: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        titleLabel.text = book?.title
        yearLabel.text = book?.year
        firstNameLabel.text = book?.author.firstName
        lastNameLabel.text = book?.author.lastName
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "Edit":
            guard let controller = segue.destination.children.first as? EditBookController else { return }
            controller.book = self.book
        default: break
        }
    }
    
    @IBAction func cancel(for unwindSegue: UIStoryboardSegue) {
       
    }
}
