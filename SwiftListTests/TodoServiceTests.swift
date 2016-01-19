@testable import SwiftList

import Quick
import Nimble

import Alamofire
import OHHTTPStubs


class TodoServiceSpec: QuickSpec {

    var data: NSData?
    
    override func spec() {
        
        it("Should load Todos list"){
            //TODO stub is not working it calls the actual apis
            stub(isHost("localhost")) { _ in
                print("Inside stub")
                let stubData = "[{\"title\":\"My first todo\",\"id\":1}], {\"title\":\"My first todo\",\"id\":2}".dataUsingEncoding(NSUTF8StringEncoding)
                return OHHTTPStubsResponse(data: stubData!, statusCode:200, headers:nil)
            }
            
            let todoDelegate = MockTodoDelegate()
            let service = TodoService(todoDelegate: todoDelegate)
            
            expect(todoDelegate.countTodosReceived()).toEventually(equal(0))
            
            service.loadTodos()
            expect(todoDelegate.countTodosReceived()).toEventually(equal(2))
            expect(todoDelegate.getTodo(0).title).toEventually(equal("My first todo"))
        }
    }
}



class MockTodoDelegate: TodoDelegate {
    
    var todos: [Todo] = []
    func updateTodoList(todos: [Todo]) {
        self.todos = todos        
    }
    
    func countTodosReceived() -> Int {
        return self.todos.count
    }
    
    func getTodo(idx: Int) -> Todo {
        return self.todos[idx]
    }
}