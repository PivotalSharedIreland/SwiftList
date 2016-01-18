//
//  ViewController.swift
//  SwiftList
//
//  Created by Pivotal on 15/01/2016.
//  Copyright © 2016 Pivotal. All rights reserved.
//

import UIKit

class ViewController: UIViewController, TodoDelegate {

    var todos: [Todo] = []
    var todoService: TodoService?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.todoService = TodoService(todoDelegate: self)
        todoService?.loadTodos()
        
        //TODO create TodoService
        // self.todoService = TodoService(delegate: self)
        // self.todoService.requestTodoList()
        // TodoServiceDelegate {
        //   func didLoadTodoList(todoList: [Todo])
        //
        // }
        //
        // var todoList: [Todo]?
        // func didLoadTodoList(todoList: [Todo]) {
        //      self.todoList = todoList
        //      self.tableView.reloadData
        // }
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func updateTodoList(todos: [Todo]) {
        print("New TodoList received \(todos)")
        self.todos = todos
        //refresh UI
    }
    

}

