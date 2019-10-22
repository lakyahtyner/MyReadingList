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

    //var db: Firestore!
    var dbDelagate: FirebaseDelagate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dbDelagate = FirebaseDelagate()
        //db = Firestore.firestore()
        // Do any additional setup after loading the view.
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
    /*
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        db.delete(indexPath)
        //save()
        tableView.deleteRows(at: [indexPath], with: .automatic)
    }
     */
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let num = dbDelagate.readingList.books?.count else {return 0}
        return num
    }
 
    // TODO: Required Fields
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "book") else {
            fatalError("Unable to dequeue a cell with identifier 'Book Summary'. Check identifier in storyboard.")
        }
        
        guard let book = dbDelagate.readingList.books?[indexPath.row] else {
            cell.textLabel?.text = ""
            cell.detailTextLabel?.text = ""
            return cell
        }
        cell.textLabel?.text = book.get("title") as! String
        cell.detailTextLabel?.text = "\(book.get("year") ?? "----") \((book.get("author") as? Author)?.firstName ?? "Unknown") \((book.get("author") as? Author)?.lastName ?? "Unknown")"
        
        return cell
    }
    
}

