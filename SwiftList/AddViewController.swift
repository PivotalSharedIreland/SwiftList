//
//  AddViewController.swift
//  SwiftList
//
//  Created by Pivotal on 19/01/2016.
//  Copyright © 2016 Pivotal. All rights reserved.
//

import UIKit

class AddViewController: UIViewController, TodoDelegate {

    @IBOutlet weak var todoTitle: UITextField!
    
    var todoService: TodoService?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.todoService = TodoService(todoDelegate: self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func doneButtonTapped(sender: AnyObject) {
        if(self.todoTitle.text != nil){
            let todo = Todo()
            todo.title = todoTitle.text!
            self.todoService?.saveTodo(todo)
        }

    }
    
    func savedTodoCallback() ->Void {
        self.navigationController?.popToRootViewControllerAnimated(true);
    }
 
    func deleteTodoCallback() -> Void {}
    
    func updateTodoList(todos: [Todo]) -> Void {}
}
