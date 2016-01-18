@testable import SwiftList

import Quick
import Nimble

import Alamofire
import OHHTTPStubs


class TodoServiceSpec: QuickSpec {
    
    var data: NSData?
    
    override func spec() {
        it("should list todos") { () -> () in
            stub(isHost("httpbin.org")) { _ in
                let stubData = "Hello World!".dataUsingEncoding(NSUTF8StringEncoding)
                return OHHTTPStubsResponse(data: stubData!, statusCode:200, headers:nil)
            }
            
            Alamofire.request(.GET, "http://httpbin.org/get", parameters: ["foo": "bar"])
                .responseString() { self.data = $0.data }
            expect(self.data).toEventually(equal("Hello World!".dataUsingEncoding(NSUTF8StringEncoding)))

        }
        
        
    }
    
    
    
    
}