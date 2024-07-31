//
//  TTTSquareViewTests.swift
//  ViewInspectorArticle
//
//  Created by Brent Michalski on 7/31/24.
//
@testable import ViewInspectorArticle
@testable import ViewInspector
import XCTest

final class TTTSquareViewTests: XCTestCase {
    
    // Exactly as it shows in the ViewInspector guide
    // I will try to put in any pull requests for documentation
//    func testStringValue() throws {
//        let sut = ContentView()
//        let value = try sut.inspect().text().string()
//        XCTAssertEqual(value, "Hello, world!")
//    }
    
    // This is actually a InspectableView<ViewType.ClassifiedView> now
    //        let sut_inspect = try sut.inspect()
    // It seems like sut.inspect() returns its parent first, then the children.
    

    func testStringValueNew() throws {
        let expectedValue = "Hello, world!"
        
        // Given
        let sut = ContentView()
        
        // When
        let actualValue = try sut.inspect().anyView().text().string()
        
        // Then
        XCTAssertEqual(actualValue, expectedValue)
    }
}
