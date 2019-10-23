//
//  ViewController.swift
//  MyReadingList
//
//  Created by LaKyah Tyner on 10/17/19.
//  Copyright © 2019 LaKyah Tyner. All rights reserved.
//

import UIKit
import Firebase

class ReadingListController: UITableViewController {

    var dbDelagate: FirebaseDelagate!
    
    var books = [Book]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        dbDelagate = FirebaseDelagate()
        loadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "Add":
            guard let controller = segue.destination.children.first as? AddBookController else {
                fatalError("Unable to downcast the destination as an instance of \(AddBookController.self)")
            }
            controller.addBook = {[weak self] book in self!.dbDelagate.insert(book)}
        default: break
        }
    }
    
    @IBAction func unwind(for unwindSegue: UIStoryboardSegue) {
        if(unwindSegue.identifier == "Back"){
            print("Back")
        }
        else if (unwindSegue.identifier == "Cancel"){
            print("Cancel")
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    /*
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        db.delete(indexPath)
        //save()
        tableView.deleteRows(at: [indexPath], with: .automatic)
    }
     */
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(books.count)
        return books.count
    }
 
    // TODO: Required Fields
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "book") else {
            fatalError("Unable to dequeue a cell with identifier 'book'. Check identifier in storyboard.")
        }
        
        let book = books[indexPath.row]
        cell.textLabel?.text = "\(book.title)"
        cell.detailTextLabel?.text = "No Year or Author"
        return cell
    }
    
    func loadData() {
        dbDelagate.db.collection("readinglist").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    let title =  document.data()["title"] as! String
                    let year = document.data()["year"] as! String
                    let author = document.data()["author"] as! [String: String]
                    let firstName = author["firstName"] as! String
                    let lastName = author["lastName"] as! String
                    
                    self.books.append(Book(title: title, year: year, author: Author(firstName: firstName, lastName: lastName)))
                }
                self.tableView.reloadData()
            }
        }
    }
    
}

