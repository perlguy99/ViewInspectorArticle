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
    
    var gameController = GameController()
    
    @State private var viewEnabled = true
    var square: TTTSquare = TTTSquare()
    
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
            .id(viewId)
            .onTapGesture(perform: handleOnTapGesture)
            .onAppear { self.viewInspectorHook?(self) }
    }
    
    func handleOnTapGesture() {
        if viewEnabled {
            square.toggle()
        }
        
        viewEnabled = false
    }
}

struct TTTSquareView_Preview: PreviewProvider {
    static var square = TTTSquare()
    
    static var previews: some View {
        TTTSquareView(square: square)
            .padding()
            .previewLayout(.sizeThatFits)
    }
    
}

//#Preview {
//    
////    @Previewable @State var square = TTTSquare()
////    TTTSquareView(square: square)
////    TTTSquareView(square: .constant(TTTSquare(value: .x)))
////    TTTSquareView(square: .constant(TTTSquare(value: .o)))
//}
