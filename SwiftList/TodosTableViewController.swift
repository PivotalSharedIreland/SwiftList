//
//  TodosTableViewController.swift
//  SwiftList
//
//  Created by Pivotal on 19/01/2016.
//  Copyright © 2016 Pivotal. All rights reserved.
//

import UIKit

class TodosTableViewController: UITableViewController, TodoListLoaderDelegate {

    var todos: [Todo] = []
    var todoService: TodoService?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.todoService = TodoService()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todos.count
    }
    
    func updateTodoList(todos: [Todo]) {
        self.todos = todos
        self.tableView.reloadData()
    }
    
    func loadTodos() -> Void {
        todoService?.loadTodos(self)
    }
    
    func savedTodoCallback() {}
    
    func deleteTodoCallback() -> Void {}
    
    override func viewWillAppear(animated: Bool){
        self.performSelector(Selector("loadTodos"), withObject: self, afterDelay: 0)
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        let todo = todos[indexPath.row]
        cell.textLabel?.text = todo.title
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "showDetail"){
            let selectedTodo = self.tableView.indexPathForSelectedRow
            let detailViewController = segue.destinationViewController as! DetailsViewController
            detailViewController.todo = todos[(selectedTodo?.row)!] as Todo
        }
    }
}
