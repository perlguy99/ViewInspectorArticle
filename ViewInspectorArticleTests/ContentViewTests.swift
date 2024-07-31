//
//  ContentViewTests.swift
//  ViewInspectorArticle
//
//  Created by Brent Michalski on 7/31/24.
//

@testable import ViewInspectorArticle
@testable import ViewInspector
import XCTest

final class ContentViewTests: XCTestCase {
    
    func testStringValueNew() throws {
        let expectedValue = "Hello, world!"
        
        // Given
        let sut = ContentView()
        
        // When
        let actualValue = try sut.inspect().anyView().text().string()
        
        // Then
        XCTAssertEqual(actualValue, expectedValue)
    }
    
    func testStringValue() {
        let sut = ContentView()
        
        do {
            let value = try sut.inspect().anyView().text().string()
            XCTAssertEqual(value, "Hello, world!")
        } catch {
            XCTFail(error.localizedDescription)
        }
    }
}
