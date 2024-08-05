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
    var currentTurn: TTT_Turn = .x
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
    
//    var image: Image? {
//        switch value {
//        case .empty:
//            return nil
//        case .x:
//            return Image(systemName: "multiply")
//        case .o:
//            return Image(systemName: "circle")
//        }
//    }

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
    
//    func toggle() {
//        value = currentTurn == .x ? .x : .o
//        toggleTurn()
//    }
    
    func toggleTurn() {
        currentTurn = currentTurn == .x ? .o : .x
    }

}
