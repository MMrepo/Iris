import XCTest
@testable import Iris

final class IrisTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(Iris().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}