//
//  TTTSquareView.swift
//  ViewInspectorArticle
//
//  Created by Brent Michalski on 7/22/24.
//

import SwiftUI

struct TTTSquareView: TestableView {
    var viewInspectorHook: ((TTTSquareView) -> Void)?
    var viewId: Int = -1

    init(viewId: Int = -1) {
        self.viewId = viewId
    }
    
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
                Text(square.stringValue)
            }
            .id(viewId)
            .onTapGesture(perform: handleOnTapGesture)
            .onAppear { self.viewInspectorHook?(self) }
    }
    
    func handleOnTapGesture() {
        square.toggle()
        print("onTapGesture was called: \(square.stringValue).")
    }
}

#Preview {
    TTTSquareView()
}
