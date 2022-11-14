//
//  PageControl.swift
//  swiftui-animation
//
//  Created by Eric on 2022/11/14.
//

import SwiftUI

private let colors: [Color] = [.red, .black, .purple, .green]
private let screenWidth = UIScreen.main.bounds.width

struct PageView: View {
  
  @State var index: Int = 0
    
  var body: some View {
    
    VStack {
      
      Text("\(index)")
      
      HStack(spacing:0) {
        ForEach(colors, id: \.self) { item in
          
          item
            .frame(width: screenWidth, height: 100)
            .clipShape(Capsule(style: .circular))
          
        }.modifier(ScrollHStackViewModifier($index))
      }
    }
    
  }
}

struct ScrollHStackViewModifier: ViewModifier {
  
  @State private var scrollOffset: CGFloat = 0
  @State private var dragOffset: CGFloat = 0
  
  @State private var shouldAnimate = false
  
  @Binding private var index: Int
    
  init(
    _ index: Binding<Int>
  ) {

    _index = index
    
    let wholeContentWidth = screenWidth * 4
    let startIndex = 0
    let initialOffset = wholeContentWidth/2 - screenWidth/2 - screenWidth * CGFloat(startIndex)
        
    _scrollOffset = State.init(initialValue: initialOffset)
  }
  
  func body(content: Content) -> some View {
    
    return content
      .offset(x: scrollOffset + dragOffset)
      .gesture(
        DragGesture()
          .onChanged { action in
            
            dragOffset = action.translation.width
          }
          .onEnded { action in
            
            dragOffset = 0
            scrollOffset += action.translation.width
            
            /// original offset
            let wholeContentWidth = screenWidth * 4
            let startIndex = 0
            let initialOffset = wholeContentWidth/2 - screenWidth/2 - screenWidth * CGFloat(startIndex)
            
            let newOffset: CGFloat
            if scrollOffset >= initialOffset {
              newOffset = initialOffset
            } else {
              
              /// drag distance
              let dragDistance = initialOffset - scrollOffset
              
              var index = round(dragDistance / screenWidth)
              
              index = min(index, 3)
              
              self.index = Int(index)
              
              newOffset = wholeContentWidth/2 - screenWidth/2 - screenWidth * CGFloat(index)
              
            }
            
            withAnimation {
              scrollOffset = newOffset
            }
            
          }
      )
  }

}

struct PageControl_Previews: PreviewProvider {
  static var previews: some View {
    PageView()
  }
}
