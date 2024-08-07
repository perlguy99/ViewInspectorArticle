//
//  ContentView.swift
//  ViewInspectorArticle
//
//  Created by Brent Michalski on 7/22/24.
//

import SwiftUI

struct ContentView: View {
    let board = TTTBoard()
    
    var body: some View {
        
        TTTBoardView(board: board)
        
    }
}

#Preview {
    ContentView()
}
