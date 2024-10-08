// TTTSquare Business Rules
// - Contains a state that can be
//     .empty, .x, or .o
// - Default should be .empty

@testable import ViewInspectorArticle
import XCTest

final class TTTSquareTests: XCTestCase {
    func test_tttSquareCreation() throws {
        XCTAssertNoThrow(TTTSquare())
    }
    
    func testTTTSquare_InitialState() throws {
        let square = TTTSquare()
        XCTAssertEqual(square.state, TTTSquareState.empty)
    }
    
    func testTTTSquare_HasUniqueID() throws {
        let square1 = TTTSquare()
        let square2 = TTTSquare()
        XCTAssertNotEqual(square1.id, square2.id)
    }
    
    func testTTTSquare_Empty_State() throws {
        let square = TTTSquare()
        XCTAssertEqual(square.state, TTTSquareState.empty)
    }

    func testTTTSquare_Empty_StateByString() throws {
        let square = TTTSquare()
        XCTAssertEqual(square.stringValue, ".")
    }

    func testTTTSquare_O_State() throws {
        let square = TTTSquare()
        square.state = .o
        XCTAssertEqual(square.state, TTTSquareState.o)
    }
    
    func testTTTSquare_X_State() throws {
        let square = TTTSquare()
        square.state = .o
        XCTAssertEqual(square.state, TTTSquareState.o)
    }
    
    func testTTTSquare_Toggle() throws {
        let square = TTTSquare()
        XCTAssertEqual(square.state, TTTSquareState.empty)
        
        square.toggle()
        XCTAssertEqual(square.state, TTTSquareState.x)

        square.toggle()
        XCTAssertEqual(square.state, TTTSquareState.o)

        square.toggle()
        XCTAssertEqual(square.state, TTTSquareState.x)
        
        square.toggle()
        XCTAssertEqual(square.state, TTTSquareState.o)
    }
}
