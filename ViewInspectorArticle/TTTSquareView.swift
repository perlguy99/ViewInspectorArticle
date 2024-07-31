//
//  TTTSquareView.swift
//  ViewInspectorArticle
//
//  Created by Brent Michalski on 7/22/24.
//

import SwiftUI

struct TTTSquareView: View {
    var value: TTTSquareValue = .empty
    
    var body: some View {
        VStack {
            Text(symbol)
        }
    }
    
    private var symbol: String {
        switch value {
        case .empty:
            return ""
        case .x:
            return "X"
        case .o:
            return "O"
        }
    }
    
    mutating func updateSquare(newValue: TTTSquareValue) {
         value = newValue
    }
}

#Preview {
    TTTSquareView()
}
