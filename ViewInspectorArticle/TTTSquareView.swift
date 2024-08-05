//
//  TTTSquareView.swift
//  ViewInspectorArticle
//
//  Created by Brent Michalski on 7/22/24.
//
import SwiftUI

struct TTTSquareView: View {
    @State private var square: TTTSquare = TTTSquare()
    
    init(overrideState: TTTSquareState? = nil) {
        if let overrideState {
            self.square.state = overrideState
        }
    }
    
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
        .onTapGesture {
            square.toggle()
        }
    }
    
    var testSquare: TTTSquare {
        return square
    }
}

#Preview {
    Group {
        TTTSquareView()
        TTTSquareView(overrideState: .x)
        TTTSquareView(overrideState: .o)
    }
}
