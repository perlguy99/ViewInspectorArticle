//
//  TTTSquareView.swift
//  ViewInspectorArticle
//
//  Created by Brent Michalski on 7/22/24.
//

import SwiftUI

struct TTTSquareView: TestableView {
    var viewInspectorHook: ((Self) -> Void)?
    
    var value: TTTSquareValue = .empty
    var idString: String = "square1"
    
    var body: some View {
        VStack {
            Text(symbol)
                .onAppear { self.viewInspectorHook?(self) }
        }.id(idString)
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
}

#Preview {
    TTTSquareView()
}
