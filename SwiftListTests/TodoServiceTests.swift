@testable import SwiftList

import Quick
import Nimble
import OHHTTPStubs
import Alamofire

class TodoServiceSpec: QuickSpec {
    
    override func spec() {
        describe("the 'Documentation' directory") {
            beforeEach {
                stub(isHost("localhost")) { _ in
                    return OHHTTPStubsResponse(JSONObject: [["title": "world"], ["title" : "test2"]], statusCode: 200, headers: nil)
                }
            }
            
            afterEach {
                OHHTTPStubs.removeAllStubs()
            }

            it("Should load Todos list") {
                let todoDelegate = MockTodoDelegate()
                let service = TodoService()

                expect(todoDelegate.countTodosReceived()).toEventually(equal(0))
                service.loadTodos(todoDelegate)
                expect(todoDelegate.countTodosReceived()).toEventually(equal(2))
            }
        }
    }
}



class MockTodoDelegate: TodoListLoaderDelegate,TodoSaverDelgate, TodoRemoverDelegate  {
    
    var todos: [Todo] = []
    
    func updateTodoList(todos: [Todo]) {
        self.todos = todos        
    }
    
    func savedTodoCallback() {
        
    }
    
    func deleteTodoCallback() {
        
    }
    
    func countTodosReceived() -> Int {
        return self.todos.count
    }
    
    func getTodo(idx: Int) -> Todo {
        return self.todos[idx]
    }
    
}