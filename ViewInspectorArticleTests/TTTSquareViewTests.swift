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
    
    func testInitialSquareState() {
        let expectedValue = ""
        
        // Given
        let sut = TTTSquareView()
        
        do {
            // When
            let value = try sut.inspect().anyView().vStack().text(0).string()
            
            // Then
            XCTAssertEqual(value, expectedValue)
        } catch {
            XCTFail(error.localizedDescription)
        }
    }

    func testSquareCanBeUpdatedTo_X() {
        let expectedValue = "X"
        
        // Given
        var sut = TTTSquareView()
        sut.updateSquare(newValue: .x)
        
        do {
            // When
            let value = try sut.inspect().anyView().vStack().text(0).string()
            
            // Then
            XCTAssertEqual(value, expectedValue)
        } catch {
            XCTFail(error.localizedDescription)
        }
    }
    
    func testSquareCanBeUpdatedTo_O() {
        let expectedValue = "O"
        
        // Given
        var sut = TTTSquareView()
        sut.updateSquare(newValue: .o)
        
        do {
            // When
            let value = try sut.inspect().anyView().vStack().text(0).string()
            
            // Then
            XCTAssertEqual(value, expectedValue)
        } catch {
            XCTFail(error.localizedDescription)
        }
    }

    
}
