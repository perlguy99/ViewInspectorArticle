//
//  TTTSquareViewTests.swift
//  ViewInspectorArticle
//
//  Created by Brent Michalski on 7/31/24.
//
//@testable import ViewInspectorArticle
//import ViewInspector
//import XCTest
//
//final class TTTSquareViewTests: XCTestCase {
//    let testViewID = 1
//    
//    func testTapOnViewAndValidateToggle() {
//        // Given
//        var sut = TTTSquareView(viewId: testViewID)
//        
//        let testExpectation = sut.on(\.viewInspectorHook) { view in
//            // Get the actual view we are working with
//            let sutView = try view.actualView()
//            
//            // Validate the initial value
//            XCTAssertEqual(sutView.square.value, .empty)
//            
//            // When: I simulate tapping on the view
//            try view.find(viewWithId: self.testViewID).callOnTapGesture()
//            
//            // Then: The NEW value should be .x
//            XCTAssertEqual(sutView.square.value, .x)
//        }
//        
//        ViewHosting.host(view: sut)
//        wait(for: [testExpectation], timeout: 0.1)
//    }
//    
//    func testTapOnViewAndValidateMultipleToggles() {
//        // Given
//        var sut = TTTSquareView(viewId: testViewID)
//        
//        let exp = sut.on(\.viewInspectorHook) { view in
//            // Get the actual view we are working with
//            let sutView = try view.actualView()
//
//            // Starting Value
//            XCTAssertEqual(sutView.square.value, .empty)
//            
//            // Tap #1
//            try view.find(viewWithId: self.testViewID).callOnTapGesture()
//            
//            // Value after 1 tap
//            XCTAssertEqual(sutView.square.value, .x)
//
//            // Tap #2
//            try view.find(viewWithId: self.testViewID).callOnTapGesture()
//            
//            // Value after 2 taps
//            XCTAssertEqual(sutView.square.value, .o)
//
//            // Tap #3
//            try view.find(viewWithId: self.testViewID).callOnTapGesture()
//            
//            // Value after 3 taps
//            XCTAssertEqual(sutView.square.value, .empty)
//
//            // Tap #4
//            try view.find(viewWithId: self.testViewID).callOnTapGesture()
//            
//            // Value after 4 taps - we should be back around to .x
//            XCTAssertEqual(sutView.square.value, .x)
//        }
//        
//        ViewHosting.host(view: sut)
//        wait(for: [exp], timeout: 0.1)
//    }
//    
//}
