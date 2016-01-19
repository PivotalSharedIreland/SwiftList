//
//  TodoService.swift
//  SwiftList
//
//  Created by Pivotal on 15/01/2016.
//  Copyright © 2016 Pivotal. All rights reserved.
//

import Foundation
import Alamofire


class TodoService {
    
    var todoDelegate: TodoDelegate
    
    var todosAsText: String?
    
    let API_URL = "http://localhost:8080"
    
    init(todoDelegate: TodoDelegate){
        self.todoDelegate = todoDelegate
    }
    
    func loadTodos() {
        Alamofire.request(.GET, "\(API_URL)/todos")
            .responseJSON { response in
                switch response.result {
                    case .Success:
                        self.sendUpdatedList(response)
                    case .Failure(let error):
                        print(error)
                }
        }
    }
    
    func sendUpdatedList(response: Response<AnyObject,NSError>) -> Void {
        if let JSON = response.result.value {
            //TODO Fix this code - Add a converter class
            var todos: [Todo] = []
            for var i = 0; i < JSON.count; i++
            {
                //TODO mapping json to object
                let todo = Todo()
                todo.title = JSON[i]["title"] as! String
                todo.id = JSON[i]["id"] as! Int?
                todos.append(todo)
            }
            self.todoDelegate.updateTodoList(todos)
        }
    }
    
    func saveTodo(todo:Todo) -> Void {
        let parameters = [
            "title" : todo.title
        ]
        
        Alamofire.request(.POST, "\(API_URL)/todos", parameters: parameters, encoding: .JSON).responseJSON { response in
            switch response.result {
            case .Success:
                self.todoDelegate.savedTodoCallback()
            case .Failure(let error):
                print(error)
            }
        }
    }
    
    func deleteTodo(todo:Todo) {
        Alamofire.request(.DELETE, "\(API_URL)/todos/\(todo.id!)", encoding: .JSON).responseJSON { response in
            self.todoDelegate.deleteTodoCallback()
        }
    }
}