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
        switch value {
        case .empty:
            value = .x
        case .x:
            value = .o
        case .o:
            value = .empty
        }
    }
}
