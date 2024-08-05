//
//  TTTSquareView.swift
//  ViewInspectorArticle
//
//  Created by Brent Michalski on 7/22/24.
//
import SwiftUI

struct TTTSquareView: View {
//    @State private var state: TTTSquareState = .empty
    
    @State var square = TTTSquare()
    
    var body: some View {
        Group {
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.purple)
                .frame(width: 100, height: 100)
            
//                .overlay {
//                    if state.imageNameString.isNotEmpty {
//                        Image(systemName: state.imageNameString)
//                            .resizable()
//                            .frame(width: 75, height: 75)
//                    }
//                }
        }
//        .onTapGesture {
//            
////            $square.state = square.state == .x ? .o : .x
////                state = state == .x ? .o : .x
//            
//        }
    }
    
//    var testState: TTTSquare {
//        square.state
//    }
}


#Preview {
//    @Previewable @State var square = TTTSquare()
//    TTTSquareView(square: square)
    
    TTTSquareView()
}

//struct TTTSquareView_Previews_withGenericWrapper: PreviewProvider {
//    
//    static var previews: some View {
//        StatefulPreviewContainer(TTTSquare.example) { binding in
//            TTTSquareView(square: binding)
//        }
//    }
//}

//struct StatefulPreviewContainer<Value, Content: View>: View {
//    @State var value: Value
//    var content: (Binding<Value>) -> Content
//    
//    var body: some View {
//        content($value)
//    }
//    
//    init(_ value: Value, content: @escaping (Binding<Value>) -> Content) {
//        self._value = State(wrappedValue: value)
//        self.content = content
//    }
//}
