@testable import SwiftList

import Quick
import Nimble


class ListSpec: QuickSpec {
    override func spec() {
        it("is true") { () -> () in
            expect(true).to(beTrue())
        }
    }
}