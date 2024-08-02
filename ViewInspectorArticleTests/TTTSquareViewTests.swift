//
//  TTTSquareViewTests.swift
//  ViewInspectorArticle
//
//  Created by Brent Michalski on 7/31/24.
//
@testable import ViewInspectorArticle
import ViewInspector
import XCTest

final class TTTSquareViewTests: XCTestCase {
    let testViewID = "TTTSquareViewID"
    
    @MainActor
    func testTapOnViewAndValidateToggle() {
        // Given
        var sut = TTTSquareView()
        
        let exp = sut.on(\.viewInspectorHook) { view in
            // Validate the initial value
            XCTAssertEqual(try view.actualView().square.value, .empty)
            
            // When: I simulate tapping on the view
            try view.find(viewWithId: self.testViewID).callOnTapGesture()
            
            // Then: The NEW value should be .x
            XCTAssertEqual(try view.actualView().square.value, .x)
        }
        
        ViewHosting.host(view: sut)
        wait(for: [exp], timeout: 0.1)
    }
    
    @MainActor
    func testTapOnViewAndValidateMultipleToggles() {
        // Given
        var sut = TTTSquareView()
        
        let exp = sut.on(\.viewInspectorHook) { view in
            
            // Starting Value
            XCTAssertEqual(try view.actualView().square.value, .empty)
            
            // Tap #1
            try view.find(viewWithId: self.testViewID).callOnTapGesture()
            
            // Value after 1 tap
            XCTAssertEqual(try view.actualView().square.value, .x)

            // Tap #2
            try view.find(viewWithId: self.testViewID).callOnTapGesture()
            
            // Value after 2 taps
            XCTAssertEqual(try view.actualView().square.value, .o)

            // Tap #3
            try view.find(viewWithId: self.testViewID).callOnTapGesture()
            
            // Value after 3 taps
            XCTAssertEqual(try view.actualView().square.value, .empty)

            // Tap #4
            try view.find(viewWithId: self.testViewID).callOnTapGesture()
            
            // Value after 4 taps - we should be back around to .x
            XCTAssertEqual(try view.actualView().square.value, .x)
        }
        
        ViewHosting.host(view: sut)
        wait(for: [exp], timeout: 0.1)
    }
    
}
