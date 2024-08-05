//
//  ContentView.swift
//  ViewInspectorArticle
//
//  Created by Brent Michalski on 7/22/24.
//

import SwiftUI

struct ContentView: View {
    @State var square = TTTSquare()
    
    var body: some View {
        TTTSquareView()
//        TTTGameBoardView()
    }
}

#Preview {
    ContentView()
}
