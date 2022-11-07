//
//  BreathEffectView.swift
//  swiftui-animation
//
//  Created by Eric on 2022/11/07.
//

import SwiftUI

struct BreathEffectView: View {
  
  @State private var animationShouldStart = false
  
  var body: some View {
    ZStack {
      Color.black
      ZStack {
        ZStack {
          Circle()
            .fill(
              LinearGradient(
                colors: [.red, .white],
                startPoint: .top,
                endPoint: .bottom
              )
            )
            .frame(width: 120)
            .offset(y: animationShouldStart ? -60 : 0)
          
          Circle()
            .fill(
              LinearGradient(
                colors: [.white, .orange],
                startPoint: .top,
                endPoint: .bottom
              )
            )
            .frame(width: 120)
            .offset(y: animationShouldStart ? 60 : 0)
        }.opacity(0.5)
        
        ZStack {
          Circle()
            .fill(
              LinearGradient(
                colors: [.yellow, .white],
                startPoint: .top,
                endPoint: .bottom
              )
            )
            .frame(width: 120)
            .offset(y: animationShouldStart ? -60 : 0)
            .rotationEffect(.degrees(60))
          
          Circle()
            .fill(
              LinearGradient(
                colors: [.white, .green],
                startPoint: .top,
                endPoint: .bottom
              )
            )
            .frame(width: 120)
            .offset(y: animationShouldStart ? 60 : 0)
            .rotationEffect(.degrees(60))

        }.opacity(0.5)
        
        ZStack {
          Circle()
            .fill(
              LinearGradient(
                colors: [.blue, .white],
                startPoint: .top,
                endPoint: .bottom
              )
            )
            .frame(width: 120)
            .offset(y: animationShouldStart ? -60 : 0)
            .rotationEffect(.degrees(120))
          
          Circle()
            .fill(
              LinearGradient(
                colors: [.white, .purple],
                startPoint: .top,
                endPoint: .bottom
              )
            )
            .frame(width: 120)
            .offset(y: animationShouldStart ? 60 : 0)
            .rotationEffect(.degrees(120))

        }.opacity(0.5)
        
      }
      .rotationEffect(.degrees(animationShouldStart ? 90 : 0))
      .scaleEffect(animationShouldStart ? 1.0 : 0)
      .animation(.easeInOut(duration: 2).repeatForever(), value: animationShouldStart)
      .onAppear{
        animationShouldStart.toggle()
    }
    }
  }
}

struct BreathEffectView_Previews: PreviewProvider {
  static var previews: some View {
    BreathEffectView()
  }
}
