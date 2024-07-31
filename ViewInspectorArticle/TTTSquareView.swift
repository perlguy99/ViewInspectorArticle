//
//  TTTSquareView.swift
//  ViewInspectorArticle
//
//  Created by Brent Michalski on 7/22/24.
//

import SwiftUI

struct TTTSquareView: View {
    var value: TTTSquareValue = .empty
    var idString: String = "square1"
    
    var body: some View {
        VStack {
            Text(symbol)
                .id(idString)
        }
    }
    
    private var symbol: String {
        switch value {
        case .empty:
            return "empty"
        case .x:
            return "X"
        case .o:
            return "O"
        }
    }
}

#Preview {
    TTTSquareView()
}
