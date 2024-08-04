//
//  ViewInspectorArticleApp.swift
//  ViewInspectorArticle
//
//  Created by Brent Michalski on 7/22/24.
//

import SwiftUI

@main
struct ViewInspectorArticleApp: App {
    @StateObject var gameController = GameController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(gameController)
        }
    }
}
