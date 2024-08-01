//
//  TTTSquareView.swift
//  ViewInspectorArticle
//
//  Created by Brent Michalski on 7/22/24.
//

import SwiftUI

struct TTTSquareView: TestableView {
    var viewInspectorHook: ((TTTSquareView) -> Void)?
    
    @StateObject private var square = TTTSquare()
    
    var value: String {
        square.stringValue
    }
    
    var body: some View {
        RoundedRectangle(cornerRadius: 8)
            .fill(Color.teal).opacity(0.5)
            .frame(width: 100, height: 100)
            .overlay {
                if let image = square.image {
                    image
                        .resizable()
                        .frame(width: 75, height: 75)
                }
            }
            .onTapGesture {
                square.toggle()
                print("You tapped on \(square.stringValue).")
            }
            .onAppear { self.viewInspectorHook?(self) }
    }
}

#Preview {
    TTTSquareView()
}
