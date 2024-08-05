//
//  TTTSquareView.swift
//  ViewInspectorArticle
//
//  Created by Brent Michalski on 7/22/24.
//
import SwiftUI

struct TTTSquareView: TestableView {
    var viewInspectorHook: ((TTTSquareView) -> Void)?
    
    @State private var square: TTTSquare = TTTSquare()
    
    #if DEBUG
    init(overrideState: TTTSquareState? = nil) {
        if let overrideState {
            self.square.state = overrideState
        }
    }
    #endif
    
    var body: some View {
        Group {
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.purple)
                .frame(width: 100, height: 100)
                .overlay {
                    if square.imageNameString.isNotEmpty {
                        Image(systemName: square.imageNameString)
                            .resizable()
                            .frame(width: 75, height: 75)
                    }
                }
        }
        .onAppear { self.viewInspectorHook?(self) }
        .onTapGesture {
            self.handleOnTapGesture()
        }
        .id(-1)
    }
    
    func handleOnTapGesture() {
        print("Tapped!")
        square.toggle()
    }
    
    #if DEBUG
    var testSquare: TTTSquare {
        return square
    }
    #endif
}

#Preview {
    Group {
        TTTSquareView()
        TTTSquareView(overrideState: .x)
        TTTSquareView(overrideState: .o)
    }
}
