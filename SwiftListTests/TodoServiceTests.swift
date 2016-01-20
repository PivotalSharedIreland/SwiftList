@testable import SwiftList

import Quick
import Nimble


import Alamofire
import OHHTTPStubs
import OHHTTPStubs.Swift


class TodoServiceSpec: QuickSpec {

    var data: NSData?
    
    override func spec() {
        
        
        describe("the 'Documentation' directory") {
            beforeEach{
                OHHTTPStubs.setEnabled(true)
                print("Before each test")
                let x = stub(isHost("localhost")) { _ in
                    
                    let stubData = "[{\"title\":\"My first todo\",\"id\":1}], {\"title\":\"My first todo\",\"id\":2}".dataUsingEncoding(NSUTF8StringEncoding)
                    
                    return OHHTTPStubsResponse(data: stubData!, statusCode:200, headers:nil)
                    
                }
                x.name = "Localhost stub"
                print("Stub: \(x) - \(x.description)")
            }
            
            it("Should load Todos list"){
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