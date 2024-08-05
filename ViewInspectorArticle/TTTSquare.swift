//
//  TTTSquare.swift
//  ViewInspectorArticle
//
//  Created by Brent Michalski on 7/22/24.
//

import SwiftUI

enum TTTSquareValue {
    case empty
    case x
    case o
}

class TTTSquare {
    var currentTurn: TTT_Turn = .x
    var value: TTTSquareValue = .empty
    
    init(value: TTTSquareValue = .empty) {
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
    
    var image: Image? {
        switch value {
        case .empty:
            return nil
        case .x:
            return Image(systemName: "multiply")
        case .o:
            return Image(systemName: "circle")
        }
    }
    
    func toggle() {
        value = currentTurn == .x ? .x : .o
        toggleTurn()
    }
    
    func toggleTurn() {
        currentTurn = currentTurn == .x ? .o : .x
    }

}
