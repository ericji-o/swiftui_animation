//
//  GalaxyView.swift
//  swiftui-animation
//
//  Created by Eric on 2022/11/07.
//

import SwiftUI

struct GalaxyView: View {
  
  @State private var shouldAnimate = false
  
  var body: some View {
    
    ZStack {
      
      Group {
        Circle().fill(.red)
          .frame(width: 70)
          .scaleEffect(shouldAnimate ? 1.2 : 0)
          .offset(shouldAnimate ? .init(width: 20, height: 30) : .zero)
        
        Circle().fill(.green)
          .frame(width: 20)
          .scaleEffect(shouldAnimate ? 1.4 : 0)
          .offset(shouldAnimate ? .init(width: 0, height: -30) : .zero)
        Circle().fill(.yellow)
          .frame(width: 50)
          .scaleEffect(shouldAnimate ? 0.8 : 0)
          .offset(shouldAnimate ? .init(width: -40, height: 0) : .zero)
        
        Circle().fill(.purple)
          .frame(width: 30)
          .scaleEffect(shouldAnimate ? 1 : 0)
          .offset(shouldAnimate ? .init(width: -30, height: 50) : .zero)
      }
      .opacity(0.8)
      .rotationEffect(.degrees(shouldAnimate ? 180 : 0))
      .animation(.spring(response: 1, dampingFraction: 0.5, blendDuration: 0.5), value: shouldAnimate)
      .onAppear {
        shouldAnimate.toggle()
      }

    }
    
    
  }
  
}

struct GalaxyView_Previews: PreviewProvider {
  static var previews: some View {
    GalaxyView()
  }
}


