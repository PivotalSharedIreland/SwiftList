//
//  TodoDelegate.swift
//  SwiftList
//
//  Created by Pivotal on 18/01/2016.
//  Copyright © 2016 Pivotal. All rights reserved.
//

import Foundation

protocol TodoListLoaderDelegate {
    func updateTodoList(todos: [Todo]) -> Void
}

protocol TodoSaverDelgate {
    func savedTodoCallback() -> Void
}

protocol TodoRemoverDelegate {
    func deleteTodoCallback() -> Void
}