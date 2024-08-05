//
//  TTTSquareViewTests.swift
//  ViewInspectorArticle
//
//  Created by Brent Michalski on 7/31/24.
//
@testable import ViewInspectorArticle
import ViewInspector
import XCTest
import SwiftUI

final class TTTSquareViewTests: XCTestCase {
    let testViewID = 1
    
    func testTTTSquareViewCreation() throws {
        XCTAssertNoThrow(TTTSquareView())
    }

    func testThatTapOnViewChangesSquareValue() throws {
        // Given
        var sut = TTTSquareView()
        XCTAssertEqual(sut.testSquare.state, .empty)
        
        let testExpectation = sut.on(\.viewInspectorHook) { view in
            do {
                // When
                try view.find(viewWithId: -1).callOnTapGesture()
                
                // Then
                XCTAssertEqual(sut.testSquare.state, .x)
            } catch {
                XCTFail(error.localizedDescription)
            }
        }
        
        ViewHosting.host(view: sut)
        wait(for: [testExpectation], timeout: 0.1)
    }
    
    func testThatViewChangesBetweenXandOWhenTapped_callOntapGesture() throws {
        // Given
        var sut = TTTSquareView()
        XCTAssertEqual(sut.testSquare.state, .empty)
        
        let testExpectation = sut.on(\.viewInspectorHook) { view in
            do {
                // When
                try view.find(viewWithId: -1).callOnTapGesture()
                XCTAssertEqual(sut.testSquare.state, .x)
                
                try view.find(viewWithId: -1).callOnTapGesture()
                XCTAssertEqual(sut.testSquare.state, .o)
                
                try view.find(viewWithId: -1).callOnTapGesture()
                XCTAssertEqual(sut.testSquare.state, .x)

                try view.find(viewWithId: -1).callOnTapGesture()
                XCTAssertEqual(sut.testSquare.state, .o)
            } catch {
                XCTFail(error.localizedDescription)
            }
        }
        
        ViewHosting.host(view: sut)
        wait(for: [testExpectation], timeout: 0.1)
    }
    
    // Notice that since we use a method `handleOnTapGesture()`
    // when we "Tap" on the view. We can simulate this without
    // even firing up the actual SwiftUI "view".
    //
    // Depending on your needs, this may be good enough.
    func testThatViewChangesBetweenXandOWhenTapped_callHandleOnTapGesture() throws {
        // Given
        var sut = TTTSquareView()
        XCTAssertEqual(sut.testSquare.state, .empty)
        
        sut.handleOnTapGesture()
        XCTAssertEqual(sut.testSquare.state, .x)

        sut.handleOnTapGesture()
        XCTAssertEqual(sut.testSquare.state, .o)

        sut.handleOnTapGesture()
        XCTAssertEqual(sut.testSquare.state, .x)

        sut.handleOnTapGesture()
        XCTAssertEqual(sut.testSquare.state, .o)
    }
}
