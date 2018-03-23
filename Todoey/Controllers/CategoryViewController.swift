//
//  CategoryViewController.swift
//  Todoey
//
//  Created by Nooralam Shaikh on 22/03/18.
//  Copyright © 2018 Nooralam Shaikh. All rights reserved.
//

import UIKit
import RealmSwift

class CategoryViewController: UITableViewController {
    
    let realm = try! Realm()

    var categoryArray: Results<Category>?

    override func viewDidLoad() {
        super.viewDidLoad()
        loadItems()
    }
    //MARK:- Table View Datasource Methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoryArray?.count ?? 1
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoCategoryCell", for: indexPath)
        
        
        cell.textLabel?.text = categoryArray?[indexPath.row].name ?? "No Categories added yet."
        return cell
    }
    
    //MARK:- Table View Delegate Methods
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "goToItems", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! ToDoListViewController
        if let indexPath = tableView.indexPathForSelectedRow{
            destinationVC.selectedCategory = categoryArray?[indexPath.row]
        }
    }
    
    //MARK:- Data Manipulation Methods
    func saveData(category: Category){
        do{
            try realm.write {
                realm.add(category)
            }
        } catch {
            print("error saving context, \(error)")
        }
        tableView.reloadData()
    }
    func loadItems(){
        categoryArray = realm.objects(Category.self)
        
        

        tableView.reloadData()

    }
    
    //MARK:- Add New Categories
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        let alert = UIAlertController(title: "Add New Todoey Category", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add Category", style: .default) { (action) in
            let newCategory = Category()
            
            newCategory.name = textField.text!
            
            self.saveData(category: newCategory)
        
        }
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create New Category"
            textField = alertTextField
        }
        alert.addAction(action)
        present(alert, animated: true)

    }
    
    
    
    
}
