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
    
    func testTTTSquareView_FullyDrawnOut() throws {
        let sut = TTTSquareView()
        let sut_inspected = try sut.inspect()
        let sut_value = try getSquareValue(sut_inspected)
        
        let sut_asInspectableView = try sut_inspected.asInspectableView()
        let sut_findViewWithId = try sut_asInspectableView.find(viewWithId: "square1")
        let sut_text = try sut_findViewWithId.text()
        let sut_text_string = try sut_text.string()
        
        print("\n------------------------------")
        print(try sut_inspected.asInspectableView().find(viewWithId: "square1").text().string())
        print("------------------------------\n")
        
        XCTAssertEqual(sut_value, "")
    }
    
    func testTTTSquareView_InitialState() throws {
        let sut = TTTSquareView()
        let sut_inspected = try sut.inspect()
        let sut_value = try getSquareValue(sut_inspected)
        
        let sut_asInspectableView = try sut_inspected.asInspectableView()
        let sut_findViewWithId = try sut_asInspectableView.find(viewWithId: "square1")
        let sut_text = try sut_findViewWithId.text()
        let sut_text_string = try sut_text.string()
        
        print("\n------------------------------")
        print(try sut_inspected.asInspectableView().find(viewWithId: "square1").text().string())
        print("------------------------------\n")
        
        XCTAssertEqual(sut_value, "")
    }
    
    private func getSquareValue<V: ViewInspector.KnownViewType>(_ view: InspectableView<V>) throws -> String? {
        try view.asInspectableView().find(viewWithId: "square1").text().string()
    }
}
