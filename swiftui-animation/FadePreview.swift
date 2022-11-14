//
//  FadePreview.swift
//  swiftui-animation
//
//  Created by Eric on 2022/11/10.
//

import SwiftUI

struct FadePreview: View {
  
  @State private var shouldAnimate = false

  var body: some View {
    
    ZStack {
      
      Circle().fill(.red)
        .frame(width: 70)
        .offset(x: 25, y: 10)
        .opacity(shouldAnimate ? 1 : 0)
        .animation(.easeInOut(duration: 0.7), value: shouldAnimate)
      
      
      Circle().fill(.orange)
        .frame(width: 60)
        .offset(x: -25, y: -25)
        .opacity(shouldAnimate ? 1 : 0)
        .animation(.easeInOut(duration: 0.7).delay(0.3), value: shouldAnimate)
      
      Circle().fill(.yellow)
        .frame(width: 40)
        .offset(x: -50, y: 35)
        .opacity(shouldAnimate ? 1 : 0)
        .animation(.easeInOut(duration: 0.7).delay(0.5), value: shouldAnimate)
      
      
      Circle().fill(.green)
        .frame(width: 24)
        .offset(x: -10, y: 50)
        .opacity(shouldAnimate ? 1 : 0)
        .animation(.easeInOut(duration: 0.7).delay(0.8), value: shouldAnimate)
      
      Circle().fill(.blue)
        .frame(width: 24)
        .offset(x: 20, y: -45)
        .opacity(shouldAnimate ? 1 : 0)
        .animation(.easeInOut(duration: 0.7).delay(1), value: shouldAnimate)
      
    }
    .frame(width: 150, height: 150)
    .onAppear {
      
      shouldAnimate.toggle()

    }
    
  }
}

struct FadePreview_Previews: PreviewProvider {
  static var previews: some View {
    FadePreview()
  }
}
