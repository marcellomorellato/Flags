//
//  FlagsTests.swift
//  FlagsTests
//
//  Created by Marcello on 17/10/22.
//


import XCTest
@testable import Flags

final class ApiServiceTests: XCTestCase {
    
    var apiService: ApiService?
    
    override func setUpWithError() throws {
        apiService = Container.shared.resolve(type: ApiService.self)
    }
    
    func testGetAllFlags() async throws {
        let expectation = expectation(description: "receive valid response")
        
        do {
            let countries = try await apiService?.getCountries()
            XCTAssertNotNil(countries)
            print("found \(countries!.count) items")
            expectation.fulfill()
        }
        catch {
            XCTAssertNil(error, error.localizedDescription)
        }
        
        await waitForExpectations(timeout: 30) { error in
                    if let error = error { XCTFail("waitForExpectationsWithTimeout errored: \(error)") }
                }
        
    }

}
