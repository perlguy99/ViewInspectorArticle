//
//  TTTSquare.swift
//  ViewInspectorArticle
//
//  Created by Brent Michalski on 7/22/24.
//

import SwiftUI

enum TTTSquareState {
    case empty
    case x
    case o
}

class TTTSquare {
    
    var state: TTTSquareState = .empty
    
    init(state: TTTSquareState = .empty) {
        self.state = state
    }
    
    var stringValue: String {
        switch state {
        case .empty:
            return "."
        case .x:
            return "X"
        case .o:
            return "O"
        }
    }
    
    var imageNameString: String {
        switch state {
        case .empty:
            return ""
        case .x:
            return "multiply"
        case .o:
            return "circle"
        }
    }
    
    func toggle() {
        if state == .empty {
            state = .x
        }
        
        if state == .x {
            state = .o
        }
        
        if state == .o {
            state = .x
        }
        
    }
    
}

extension TTTSquare {
    static let example_x = TTTSquare(state: .x)
    static let example_o = TTTSquare(state: .o)
    static let example_e = TTTSquare(state: .empty)
    
    static var samples = [
        TTTSquare(state: .empty),
        TTTSquare(state: .x),
        TTTSquare(state: .o)
    ]
    
    static var example = samples[0]
}
