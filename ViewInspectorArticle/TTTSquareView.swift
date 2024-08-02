//
//  TTTSquareView.swift
//  ViewInspectorArticle
//
//  Created by Brent Michalski on 7/22/24.
//

import SwiftUI

struct TTTSquareView: TestableView {
    var viewInspectorHook: ((TTTSquareView) -> Void)?
    let viewId = "TTTSquareViewID"
    
    @StateObject var square = TTTSquare()
    
    var body: some View {
        RoundedRectangle(cornerRadius: 8)
            .fill(Color.teal).opacity(0.5)
            .frame(width: 100, height: 100)
            .overlay {
                if let image = square.image {
                    image
                        .resizable()
                        .accessibilityLabel(square.stringValue)
                        .frame(width: 75, height: 75)
                }
            }
            .id(viewId)
            .onTapGesture {
                square.toggle()
                print("onTapGesture was called: \(square.stringValue).")
            }
            .onAppear { self.viewInspectorHook?(self) }
    }
}

#Preview {
    TTTSquareView()
}
