//
//  TTTBoardView.swift
//  ViewInspectorArticle
//
//  Created by Brent Michalski on 8/6/24.
//
import SwiftUI

struct TTTBoardView: View {
    @ObservedObject var board: TTTBoard
    
    var body: some View {
        VStack {
            ForEach(0..<3) { row in
                HStack {
                    ForEach(0..<3) { col in
                        let index = row * 3 + col
                        TTTSquareView(square: board.squares[index])
                            .onTapGesture {
                                board.makeMove(at: index)
                            }
                    }
                }
            }
        }
    }
}

//#Preview {
//    TTTBoardView(board: TTTBoard())
//}
