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
    
    var stringValue: String {
        switch self {
        case .x:
            return "X"
        case .o:
            return "O"
        }
    }
    
    func toggle() -> GameTurn {
        switch self {
        case .x:
            return .o
        case .o:
            return .x
        }
    }
    
    func toTTTSquareState() -> TTTSquareState {
        switch self {
        case .x:
            return .x
        case .o:
            return .o
        }
    }
}

class TTTSquare: ObservableObject, Identifiable {
    @Published var state: TTTSquareState
    var id = UUID()
    
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
