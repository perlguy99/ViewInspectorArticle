//
//  TTTGameBoard.swift
//  ViewInspectorArticle
//
//  Created by Brent Michalski on 8/1/24.
//

import SwiftUI

struct TTTGameBoard: View {
    
    var body: some View {
        Grid(horizontalSpacing: 2.0, verticalSpacing: 2.0) {
            GridRow {
                TTTSquareView()
                TTTSquareView()
                TTTSquareView()
            }
            GridRow {
                TTTSquareView()
                TTTSquareView()
                TTTSquareView()
            }
            GridRow {
                TTTSquareView()
                TTTSquareView()
                TTTSquareView()
            }
        }
    }
}

#Preview {
    TTTGameBoard()
}
