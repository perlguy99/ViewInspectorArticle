//
//  TTTGameBoardTests.swift
//  ViewInspectorArticle
//
//  Created by Brent Michalski on 8/2/24.
//

@testable import ViewInspectorArticle
import ViewInspector
import XCTest

final class TTTGameBoardTests: XCTestCase {
    
    func testThatGameBoardHas9Squares() {
        let sut = TTTGameBoardView()
        XCTAssertEqual(try sut.inspect().findAll(TTTSquareView.self).count, 9)

    }
    
    // When: I simulate tapping on the view
//    try view.find(viewWithId: self.testViewID).callOnTapGesture()

    
//    func testThatTapOnSquareUpdatesItsValue() {
//        var sut = TTTGameBoardView()
//        
//        let testExpectation = sut.on(\.viewInspectorHook) { view in
//            // Get the actual view we are working with
//            let gameBoardView = try view.actualView()
//            
//            let fooArray = try gameBoardView.inspect().findAll(TTTSquareView.self).map { try $0.actualView() }
//            print(fooArray[0].square.stringValue)
//            
//            XCTAssertNoThrow(try gameBoardView.inspect().find(viewWithId: 0).find(text: "."))
//            
//            // Tap it
//            fooArray[0].handleOnTapGesture()
//            
//            try view.find(viewWithId: 0).callOnTapGesture()
//            
//            XCTAssertNoThrow(try gameBoardView.inspect().find(viewWithId: 0).find(text: "X"))
//
//        }
//        
//        ViewHosting.host(view: sut)
//        wait(for: [testExpectation], timeout: 0.1)
//        
//        
//        
//    }
    
    
    
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
    
}
