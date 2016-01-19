//
//  DetailsViewController.swift
//  SwiftList
//
//  Created by Pivotal on 19/01/2016.
//  Copyright © 2016 Pivotal. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController, TodoDelegate {


    @IBOutlet var todoTitle: UITextField!
    var todo = Todo()
    var todoService: TodoService?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.todoService = TodoService(todoDelegate: self)

        todoTitle.userInteractionEnabled = false
        todoTitle.text = todo.title
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func deleteTodoAction(sender: AnyObject) {
        self.todoService?.deleteTodo(todo)
    }
    
    func deleteTodoCallback() -> Void {
        self.navigationController?.popToRootViewControllerAnimated(true);
    }
    
    func updateTodoList(todos: [Todo]) -> Void {}
    func savedTodoCallback() ->Void {}
}
