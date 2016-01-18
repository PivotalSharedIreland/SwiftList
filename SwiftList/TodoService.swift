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
    
    init(todoDelegate: TodoDelegate){
        self.todoDelegate = todoDelegate
    }
    
    func loadTodos() {
        print("Calling APIs")
        Alamofire.request(.GET, "http://localhost:8080/todos")
            .responseJSON { response in
//                print(response.request)  // original URL request
//                print(response.response) // URL response
//                print(response.data)     // server data
//                print(response.result)   // result of response serialization
//                debugPrint(response)
                
                if let JSON = response.result.value {
                    print(":::::JSON: \(JSON)")
                    print(":::::JSON: \(JSON.count)")
                    
                    
                    //TODO Fix this shit
                    var todos: [Todo] = []
                    for var i = 0; i < JSON.count; i++
                    {
                        todos.append(Todo()) //TODO mapping json to object
                    }
                    self.todoDelegate.updateTodoList(todos)
                }
        }
    }
    
}