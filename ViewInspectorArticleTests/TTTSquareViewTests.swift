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
        XCTAssertEqual(sut.square.value, .empty)
        
        let testExpectation = sut.on(\.viewInspectorHook) { view in
            do {
                // When
                try view.find(viewWithId: -1).callOnTapGesture()
                
                // Then
                XCTAssertEqual(sut.square.value, .x)
            } catch {
                XCTFail(error.localizedDescription)
            }
        }
        
        ViewHosting.host(view: sut)
        wait(for: [testExpectation], timeout: 0.1)
    }
    
    func testThatViewIsDisabledOnceSelected() throws {
        // Given
        var sut = TTTSquareView()
        XCTAssertEqual(sut.square.value, .empty)
        
        let testExpectation = sut.on(\.viewInspectorHook) { view in
            do {
                // When
                try view.find(viewWithId: -1).callOnTapGesture()
                XCTAssertEqual(sut.square.value, .x)
                
                // Calling it a second time _should_ not work
                try view.find(viewWithId: -1).callOnTapGesture()
                
                // Then - so the value should remain .x
                XCTAssertEqual(sut.square.value, .x)
            } catch {
                XCTFail(error.localizedDescription)
            }
        }
        
        ViewHosting.host(view: sut)
        wait(for: [testExpectation], timeout: 0.1)
    }
    
    func testThatWhenItsOsTurnAndTappedValueBecomesO() throws {
        var sut = TTTSquareView()
        sut.square.currentTurn = .o
        
        XCTAssertEqual(sut.square.value, .empty)

        let testExpectation = sut.on(\.viewInspectorHook) { view in
            do {
                // When
                try view.find(viewWithId: -1).callOnTapGesture()
                XCTAssertEqual(sut.square.value, .o)
                
                // Calling it a second time _should_ not work
                try view.find(viewWithId: -1).callOnTapGesture()
                
                // Then - so the value should remain .x
                XCTAssertEqual(sut.square.value, .o)
            } catch {
                XCTFail(error.localizedDescription)
            }
        }
        
        ViewHosting.host(view: sut)
        wait(for: [testExpectation], timeout: 0.1)
    }

}
