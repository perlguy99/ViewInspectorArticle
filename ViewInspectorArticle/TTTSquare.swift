//
//  TTTSquare.swift
//  ViewInspectorArticle
//
//  Created by Brent Michalski on 7/22/24.
//

import SwiftUI

protocol TTTSquareStateProtocol: Equatable {
    var stringValue: String { get }
    var imageNameString: String { get }
    func nextState() -> Self
}

enum TTTSquareState: TTTSquareStateProtocol {
    case empty
    case x
    case o
    
    var stringValue: String {
        switch self {
        case .empty:
            return "."
        case .x:
            return "X"
        case .o:
            return "O"
        }
    }
    
    var imageNameString: String {
        switch self {
        case .empty:
            return ""
        case .x:
            return "multiply"
        case .o:
            return "circle"
        }
    }
    
    func nextState() -> TTTSquareState {
        switch self {
        case .empty:
            return .x
        case .x:
            return .o
        case .o:
            return .x
        }
    }
}

enum GameTurn {
    case x
    case o
}

class TTTSquare: ObservableObject {
    @Published var state: TTTSquareState
    
    init(state: TTTSquareState = TTTSquareState.empty) {
        self.state = state
    }
    
    var stringValue: String {
        state.stringValue
    }
    
    var imageName: String {
        state.imageNameString
    }
    
    func toggle() {
        state = state.nextState()
    }
}

//extension TTTSquare {
//    static let example_x = TTTSquare(state: .x)
//    static let example_o = TTTSquare(state: .o)
//    static let example_e = TTTSquare(state: .empty)
//    
//    static var samples = [
//        TTTSquare(state: .empty),
//        TTTSquare(state: .x),
//        TTTSquare(state: .o)
//    ]
//    
//    static var example = samples[0]
//}
