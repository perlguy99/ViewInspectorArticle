//
//  TTTSquareView.swift
//  ViewInspectorArticle
//
//  Created by Brent Michalski on 7/22/24.
//
import SwiftUI

struct TTTSquareView: TestableView {
    var viewInspectorHook: ((TTTSquareView) -> Void)?
    
    @ObservedObject private var square: TTTSquare
    
    init(square: TTTSquare = TTTSquare()) {
        self._square = ObservedObject(initialValue: square)
    }
    
    var body: some View {
        Group {
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.purple)
                .frame(width: 100, height: 100)
                .overlay {
                    if square.imageName.isNotEmpty {
                        Image(systemName: square.imageName)
                            .resizable()
                            .frame(width: 75, height: 75)
                    }
                }
                
        }
        .id(square.id)
        .onAppear { self.viewInspectorHook?(self) }
        .onTapGesture {
            self.handleOnTapGesture()
        }
    }
    
    func handleOnTapGesture() {
        print("\n-- handleOnTapGesture --\n")
        square.toggle()
    }
    
    var testSquare: TTTSquare {
        return square
    }
}

#Preview {
    TTTSquareView()
    TTTSquareView(square: TTTSquare(state: .x))
    TTTSquareView(square: TTTSquare(state: .o))
}
