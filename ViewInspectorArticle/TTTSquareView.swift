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

    @Binding var square: TTTSquare {
        didSet {
            print("\n------------TTTSquare.didSet------------------")
            print(square.stringValue)
            print("--------------TTTSquare.didSet----------------\n")
        }
    }

    var body: some View {
        RoundedRectangle(cornerRadius: 8)
            .fill(Color.teal).opacity(0.5)
            .frame(width: 100, height: 100)
            .overlay {
                let _ = print("\n--------------overlay----------------\n")
                if let image = square.image {
                    let _ = print("\n--------------image----------------\n")
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
        print("\n------------------------------")
        print(square.stringValue as Any)
        square.toggle()
        print("TTTSquareView onTapGesture was called on viewID: \(viewId), \(String(describing: square.stringValue)).")
        print("------------------------------\n")
    }
}

#Preview {
    TTTSquareView(square: .constant(TTTSquare(value: .empty)))
    TTTSquareView(square: .constant(TTTSquare(value: .x)))
    TTTSquareView(square: .constant(TTTSquare(value: .o)))
}
