//
//  AsgntStateValidTests.swift
//  AsgntTendableTests
//
//  Created by Suprabha Dhavan on 20/07/24.
//

import XCTest

final class AsgntStateValidTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
struct StateCValidator {
    enum Error: Swift.Error {
        case emptyStateCKey
    }

    func validate(StateCKey: String) throws {
        guard !StateCKey.isEmpty else {
            throw Error.emptyStateCKey
        }
    }
}

class StateCValidatorTests: XCTestCase {
    let validator = StateCValidator()

    func testThrowingEmptyStateCKeyError() {
        XCTAssertThrowsError(try validator.validate(StateCKey: ""), "An empty StateC key error should be thrown") { error in
            /// We ensure the expected error is thrown.
            XCTAssertEqual(error as? StateCValidator.Error, .emptyStateCKey)
        }
    }

    func testNotThrowingStateCErrorForNonEmptyKey() {
        XCTAssertNoThrow(try validator.validate(StateCKey: "XXXX-XXXX-XXXX-XXXX"), "Non-empty StateC key should pass")
    }
}
