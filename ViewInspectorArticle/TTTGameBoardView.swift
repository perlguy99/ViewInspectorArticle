//
//  TTTGameBoardView.swift
//  ViewInspectorArticle
//
//  Created by Brent Michalski on 8/1/24.
//

import SwiftUI

struct TTTGameBoardView: TestableView {
    @StateObject var gameController = GameController()
    
    var viewInspectorHook: ((TTTGameBoardView) -> Void)?
    
    var body: some View {
        VStack {
            Grid(horizontalSpacing: 2.0, verticalSpacing: 2.0) {
                ForEach(0..<3) { row in
                    GridRow {
                        ForEach(0..<3) {col in
                            let index = row * 3 + col
                            TTTSquareView(square: $gameController.game.squares[index])
                                .onTapGesture {
                                    gameController.takeTurn(index: index)
                                }
                        }
                    }
                }
            }
            .padding()
            
            if let winnerMessage = gameController.winnerMessage {
                Text(winnerMessage)
                    .font(.largeTitle)
                    .padding()
            }
            
            Button("Reset Game") {
                gameController.resetGame()
            }
            .padding()
        }
        .onAppear { self.viewInspectorHook?(self) }
    }
}

#Preview {
    TTTGameBoardView()
}
