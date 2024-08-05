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
    
    var stringValue: String {
        switch self {
        case .empty:
            return "^"
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
}

class TTTSquare {
    var value: TTTSquareState = .empty
    
    init(value: TTTSquareState = .empty) {
        self.value = value
    }
    
    var stringValue: String {
        switch value {
        case .empty:
            return "."
        case .x:
            return "X"
        case .o:
            return "O"
        }
    }
    
    var imageNameString: String {
        switch value {
        case .empty:
            return ""
        case .x:
            return "multiply"
        case .o:
            return "circle"
        }
    }
    
    func toggle() {
        if value == .empty {
            value = .x
        }
        
        if value == .x {
            value = .o
        }
        
        if value == .o {
            value = .x
        }
        
    }
    
}

extension TTTSquare {
    static var samples = [
        TTTSquare(value: .empty),
        TTTSquare(value: .x),
        TTTSquare(value: .o)
    ]
    
    static var example = samples[0]
}
