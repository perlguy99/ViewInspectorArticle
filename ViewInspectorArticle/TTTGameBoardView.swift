//
//  TTTGameBoardView.swift
//  ViewInspectorArticle
//
//  Created by Brent Michalski on 8/1/24.
//

import SwiftUI

struct TTTGameBoardView: TestableView {
    var viewInspectorHook: ((TTTGameBoardView) -> Void)?
    
    var body: some View {
        Grid(horizontalSpacing: 2.0, verticalSpacing: 2.0) {
            GridRow {
                TTTSquareView(viewId: 0)
                TTTSquareView(viewId: 1)
                TTTSquareView(viewId: 2)
            }
            GridRow {
                TTTSquareView(viewId: 3)
                TTTSquareView(viewId: 4)
                TTTSquareView(viewId: 5)
            }
            GridRow {
                TTTSquareView(viewId: 6)
                TTTSquareView(viewId: 7)
                TTTSquareView(viewId: 8)
            }
        }
        .onAppear { self.viewInspectorHook?(self) }
    }
}

#Preview {
    TTTGameBoardView()
}
