//
//  SlideButton.swift
//  swiftui-animation
//
//  Created by Eric on 2022/08/19.
//

import SwiftUI

struct SlideButton: View {
  
  @State var position: CGPoint = .zero
  @State var isFinished: Bool = false

  @GestureState private var startLocation: CGPoint? = nil
  
  let color1 = UIColor.green
  let color2 = UIColor(red: 6.0/255.0, green: 153.0/255.0, blue: 7.0/255.0, alpha: 1.0)
  
  let textTransition: AnyTransition = .asymmetric(
    insertion: .offset(y: 40).combined(with: .opacity),
    removal: .offset(y: -40).combined(with: .opacity)
  )
  
  let initialLength: CGFloat = 100

  func makeDragGesture(_ proxy: GeometryProxy) -> some Gesture {
    
    DragGesture()
      .onChanged { value in
        withAnimation {
          var newLocation = startLocation ?? position
          
          let initialOffset = -proxy.size.width/2
          let newLocationX = newLocation.x + value.translation.width
          
          if newLocationX - initialOffset >= proxy.size.width * 0.8 {
            newLocation.x =  proxy.size.width / 2
          } else {
            newLocation.x = newLocationX
          }
          
          newLocation.y = proxy.size.height / 2
          
          position = newLocation
        }
        
      }
      .onEnded { value in
        
        withAnimation {
          
          let newLocation = startLocation ?? position

          let initialOffset = -proxy.size.width/2
          let newLocationX = newLocation.x + value.translation.width
          
          if newLocationX - initialOffset < proxy.size.width * 0.8 {
            /// original location. same to the setting onAppear{}
            position = .init(x: -proxy.size.width/2 + initialLength, y: proxy.size.height/2)
            isFinished = false
          } else {
            isFinished = true
          }
          
        }
        
      }
      .updating($startLocation) { (value, startLocation, transaction) in
        startLocation = startLocation ?? position
      }
  }
  
  var body: some View {
    
    VStack {
      Text("X:\(position.x), Y:\(position.y)")

      Rectangle()
        .fill(.yellow)
        .frame(maxWidth: .infinity, maxHeight: 100)
        .overlay(
          GeometryReader{ proxy in
              RoundedRectangle(cornerRadius: 50)
              .fill(
                LinearGradient(
                  gradient: Gradient(
                    colors: [
                      Color(uiColor: color1),
                      Color(uiColor: color2)
                    ]),
                  startPoint: .leading,
                  endPoint: .trailing
                )
              )
              .frame(width: proxy.size.width, height: proxy.size.height)
              .overlay(
                HStack {
                  Spacer()
                  Circle()
                    .fill(.blue)
                    .frame(width: proxy.size.height, height: proxy.size.height)
                    .overlay(
                      Image("right_arrow")
                        .renderingMode(.original)
                    )
                }.background(
                  ZStack {
                    if isFinished {
                      Text("Im rich !!!")
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .transition(textTransition)
                    }
                  }
                )
              )
              .position(position)
              .gesture(makeDragGesture(proxy))
            .onAppear{
              position = .init(x: -proxy.size.width/2 + initialLength, y: proxy.size.height/2)
            }
          }

        )
    }

  }
  
}

struct SlideButton_Previews: PreviewProvider {
  static var previews: some View {
    SlideButton()
  }
}
