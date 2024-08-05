//
//  TTTSquareView.swift
//  ViewInspectorArticle
//
//  Created by Brent Michalski on 7/22/24.
//
import SwiftUI

struct TTTSquareView: View {
    @State private var state: TTTSquareState = .empty
    
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .fill(Color.purple)
            .frame(width: 100, height: 100)
        
            .overlay {
                if state.imageNameString.isNotEmpty {
                    Image(systemName: state.imageNameString)
                        .resizable()
                        .frame(width: 75, height: 75)
                }
            }
            .onTapGesture {
                state = state == .x ? .o : .x
            }
    }
}


#Preview {
    TTTSquareView()
}
