//
//  ViewInspectorArticleApp.swift
//  ViewInspectorArticle
//
//  Created by Brent Michalski on 7/22/24.
//

import SwiftUI

@main
struct ViewInspectorArticleApp: App {
    @StateObject private var board = TTTBoard()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(board)
        }
    }
}
