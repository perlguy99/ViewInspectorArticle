//
//  ContentView.swift
//  ViewInspectorArticle
//
//  Created by Brent Michalski on 7/22/24.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var board: TTTBoard
    
    var body: some View {
        TTTBoardView()
    }
}

#Preview {
    ContentView()
}
