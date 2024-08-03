//
//  TTTGameBoardView.swift
//  ViewInspectorArticle
//
//  Created by Brent Michalski on 8/1/24.
//

import SwiftUI

struct TTTGameBoardView: TestableView {
    var viewInspectorHook: ((TTTGameBoardView) -> Void)?
    
    let gameController = GameController()
    
    var body: some View {
        Grid(horizontalSpacing: 2.0, verticalSpacing: 2.0) {
//            GridRow {
//                TTTSquareView()
//                TTTSquareView()
//                TTTSquareView()
//            }
//            GridRow {
//                TTTSquareView()
//                TTTSquareView()
//                TTTSquareView()
//            }
//            GridRow {
//                TTTSquareView()
//                TTTSquareView()
//                TTTSquareView()
//            }
        }
        .onAppear { self.viewInspectorHook?(self) }
    }
}

#Preview {
    TTTGameBoardView()
}
