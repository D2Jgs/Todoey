//
//  ViewController.swift
//  Todoey
//
//  Created by jash on 06/06/19.
//  Copyright © 2019 Automated. All rights reserved.
//

import UIKit

class ToDoListViewController: UITableViewController {

    var itemArray = ["one","two","three"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    //MARK : TablView DAtasource Methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
        cell.textLabel?.text = itemArray[indexPath.row]
        
        return cell
    }
    
    //MARK - TableView Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark{
            
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
            
        }else{
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    //MARK - Add new Items
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        let alert = UIAlertController(title: "Add New Todoey Item", message: "", preferredStyle: .alert)
        var textFeild = UITextField()
        let action = UIAlertAction(title: "Add Item", style: .default) {
            (action) in
            self.itemArray.append(textFeild.text!)
            self.tableView.reloadData()
        }
        
        alert.addTextField { (alertTextFeild) in
            alertTextFeild.placeholder = "Create new task"
            textFeild = alertTextFeild
        }
        
        alert.addAction(action)
        
        present(alert,animated: true)
        
    }
    
}

