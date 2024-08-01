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
        
        // Then
        XCTAssertEqual(sut.value, expectedValue)
    }

    func testSquareCanBeUpdatedTo_X() {
        let initialValue = ""
        let expectedValue = "X"
        
        // Given
        let sut = TTTSquareView()
        
        XCTAssertEqual(sut.value, initialValue)
        
        do {
            try sut.inspect().callOnTapGesture()
            XCTAssertEqual(sut.value, expectedValue)
        } catch {
            print(error.localizedDescription)
        }
        
        XCTAssertEqual(sut.value, expectedValue)
    }
    
//    func testSquareCanBeUpdatedTo_O() {
//        let expectedValue = "O"
//        
//        // Given
//        var sut = TTTSquareView()
//        sut.updateSquare(newValue: .o)
//        
//        do {
//            // When
//            let value = try sut.inspect().anyView().vStack().text(0).string()
//            
//            // Then
//            XCTAssertEqual(value, expectedValue)
//        } catch {
//            XCTFail(error.localizedDescription)
//        }
//    }
    
//    func testThatTappingOnSquareUpdatesTheValueProperly() {
//        var sut = TTTSquareView()
//        sut.handleTapGesture()
//    }

//    func getTTTSquareViewValue(tttSquareView: TTTSquareView) -> String {
//        var returnValue = ""
//        
//        do {
//            returnValue = try tttSquareView.inspect().anyView().vStack().text(0).string()
//        } catch {
//            XCTFail(error.localizedDescription)
//        }
//        
//        return returnValue
//    }
    
}
