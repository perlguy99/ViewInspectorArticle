@testable import ViewInspectorArticle
@testable import ViewInspector
import XCTest

// TTTSquare Business Rules
// - Contains a value that can be
//     .empty, .x, or .o
// - Default should be .empty


final class TTTSquareTests: XCTestCase {
    func test_tttSquareCreation() throws {
        XCTAssertNoThrow(TTTSquare())
    }
    
    func testTTTSquare_InitialState() throws {
        let square = TTTSquare()
        XCTAssertEqual(square.value, TTTSquareValue.empty)
    }
    
    func testTTTSquare_Empty_State() throws {
        let square = TTTSquare(value: .empty)
        XCTAssertEqual(square.value, TTTSquareValue.empty)
    }
    
    func testTTTSquare_O_State() throws {
        let square = TTTSquare(value: .o)
        XCTAssertEqual(square.value, TTTSquareValue.o)
    }
    
    func testTTTSquare_X_State() throws {
        let square = TTTSquare(value: .x)
        XCTAssertEqual(square.value, TTTSquareValue.x)
    }
    
}

final class TTTSquareViewTests: XCTestCase {
    
    func testTTTSquareView_InitialState() throws {
        let sut = TTTSquareView()
        let value = try getSquareValue(sut.inspect())
        
        XCTAssertEqual(value, "XZ")
    }

    
    private func getSquareValue<V: ViewInspector.KnownViewType>(_ view: InspectableView<V>) throws -> String? {
        try view.asInspectableView().find(viewWithId: "square1").text().string()
    }
}
