//
//  TTTSquareView.swift
//  ViewInspectorArticle
//
//  Created by Brent Michalski on 7/22/24.
//
import SwiftUI

struct TTTSquareView: View {
    @State private var square: TTTSquare = TTTSquare()
    
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



//struct TTTSquareView_Previews_Container: PreviewProvider {
//    struct Container: View {
//        @State var square = TTTSquare()
//        
//        var body: some View {
//            TTTSquareView(square: square)
//        }
//    }
//    
//    static var previews: some View {
//        Container()
//    }
//}

#Preview {
    Group {
        TTTSquareView()
        
        
//        let foo = TTTSquare(state: .o)
//        var bar = TTTSquareView()
//        bar.square.state = .x
//        TTTSquareView(square: TTTSquare(state: .x))
//        TTTSquareView(square: TTTSquare(state: .o))
    }
}
