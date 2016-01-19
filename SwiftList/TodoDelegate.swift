//
//  TodoDelegate.swift
//  SwiftList
//
//  Created by Pivotal on 18/01/2016.
//  Copyright © 2016 Pivotal. All rights reserved.
//

import Foundation


protocol TodoDelegate {
    
    func updateTodoList(todos: [Todo]) -> Void
    func savedTodoCallback() ->Void
    func deleteTodoCallback() ->Void
}