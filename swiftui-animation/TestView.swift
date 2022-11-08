//
//  TestView.swift
//  swiftui-animation
//
//  Created by Eric on 2022/11/07.
//

import SwiftUI


struct GralleyView: View {
  
  var body: some View {
    
//    Grid {
//      GridRow {
        ParticipantsBubble(itemCount: 2)
//        ParticipantsBubble(itemCount: 3)
//      }
//      GridRow {
        ParticipantsBubble(itemCount: 4)
//        ParticipantsBubble(itemCount: 5)
//      }
//
//    }
    
  }
  
}


private struct ParticipantsBubble: View {
  
  private struct LayoutInfo {
    let sideLength: CGFloat
    let position: CGPoint
  }
  
  private let itemCount: Int
  
  @State private var shouldAnimate = false
  
  init(itemCount: Int ) {
    self.itemCount = itemCount
  }
  
  var body: some View {
    
      ZStack {
        ForEach(0..<itemCount, id: \.self) { i in
          let layoutInfo = ParticipantsBubble.layoutInfo(count: itemCount, index: i)
          Circle().fill(.red)
            .frame(
              width: layoutInfo.sideLength,
              height: layoutInfo.sideLength
            )
            .position(
              x: shouldAnimate ? layoutInfo.position.x + layoutInfo.sideLength / 2 : 0,
              y: shouldAnimate ? layoutInfo.position.y + layoutInfo.sideLength / 2 : 0
            )
            .animation(.easeInOut, value: shouldAnimate)
            .onAppear{
              shouldAnimate.toggle()
            }
        }
      }
      .background(Color.black)
      .frame(width: 130, height: 130)
    
  }
  
  
  
  private static func layoutInfo(count: Int, index: Int) -> LayoutInfo {
    assert(2 <= count && count <= 8 && 0 <= index && index < count)
    switch (count, index) {
    case (2, 0):
      return .init(sideLength: 70, position: .init(x: 13, y: 16))
    case (2, 1):
      return .init(sideLength: 52, position: .init(x: 65, y: 62))
    case (3, 0):
      return .init(sideLength: 70, position: .init(x: 11, y: 21))
    case (3, 1):
      return .init(sideLength: 52, position: .init(x: 57, y: 65))
    case (3, 2):
      return .init(sideLength: 32, position: .init(x: 84, y: 15))
    case (4, 0):
      return .init(sideLength: 70, position: .init(x: 46, y: 56))
    case (4, 1):
      return .init(sideLength: 60, position: .init(x: 9, y: 18))
    case (4, 2):
      return .init(sideLength: 40, position: .init(x: 77, y: 12))
    case (4, 3):
      return .init(sideLength: 24, position: .init(x: 9, y: 96))
    case (5, 0):
      return .init(sideLength: 70, position: .init(x: 58, y: 37))
    case (5, 1):
      return .init(sideLength: 60, position: .init(x: 13, y: 6))
    case (5, 2):
        return .init(sideLength: 40, position: .init(x: 0, y: 72))
    case (5, 3):
      return .init(sideLength: 24, position: .init(x: 48, y: 101))
    case (5, 4):
      return .init(sideLength: 24, position: .init(x: 79, y: 5))
    case (6, 0):
      return .init(sideLength: 70, position: .init(x: 35, y: 34))
    case (6, 1):
      return .init(sideLength: 52, position: .init(x: 10, y: 4))
    case (6, 2):
      return .init(sideLength: 40, position: .init(x: 5, y: 72))
    case (6, 3):
      return .init(sideLength: 32, position: .init(x: 57, y: 95))
    case (6, 4):
      return .init(sideLength: 24, position: .init(x: 101, y: 83))
    case (6, 5):
      return .init(sideLength: 24, position: .init(x: 86, y: 7))
    case (7, 0):
      return .init(sideLength: 64, position: .init(x: 53, y: 37))
    case (7, 1):
      return .init(sideLength: 52, position: .init(x: 28, y: 3))
    case (7, 2):
      return .init(sideLength: 40, position: .init(x: 5, y: 70))
    case (7, 3):
      return .init(sideLength: 32, position: .init(x: 53, y: 93))
    case (7, 4):
      return .init(sideLength: 20, position: .init(x: 104, y: 99))
    case (7, 5):
      return .init(sideLength: 24, position: .init(x: 89, y: 8))
    case (7, 6):
      return .init(sideLength: 24, position: .init(x: 3, y: 40))
    case (8, 0):
      return .init(sideLength: 60, position: .init(x: 51, y: 46))
    case (8, 1):
        return .init(sideLength: 52, position: .init(x: 20, y: 10))
    case (8, 2):
      return .init(sideLength: 36, position: .init(x: 9, y: 76))
    case (8, 3):
      return .init(sideLength: 40, position: .init(x: 90, y: 23))
    case (8, 4):
      return .init(sideLength: 32, position: .init(x: 48, y: 98))
    case (8, 5):
      return .init(sideLength: 24, position: .init(x: 105, y: 98))
    case (8, 6):
      return .init(sideLength: 20, position: .init(x: 71, y: 0))
    case (8, 7):
      return .init(sideLength: 20, position: .init(x: 0, y: 51))
    default: fatalError()
    }
  }
}

struct RoomView_Previews: PreviewProvider {
  static var previews: some View {
    GralleyView()
  }
}


extension SwiftUI.Color {
  
  /// Constructing color from hex string
  ///
  /// - Parameter hex: A hex string, can either contain # or not
  public init(
    _ colorSpace: Color.RGBColorSpace = .sRGB,
    hexString: String
  ) {
    var hex =
    hexString.hasPrefix("#")
    ? String(hexString.dropFirst())
    : hexString
    guard hex.count == 3 || hex.count == 6
    else {
      self = .init(colorSpace, white: 1.0, opacity: 0)
      return
    }
    if hex.count == 3 {
      for (index, char) in hex.enumerated() {
        hex.insert(char, at: hex.index(hex.startIndex, offsetBy: index * 2))
      }
    }
    guard let intCode = Int(hex, radix: 16) else {
      self = .init(colorSpace, white: 1.0, opacity: 0)
      return
    }
    
    self = .init(
      colorSpace,
      red: Double((intCode >> 16) & 0xFF) / 255.0,
      green: Double((intCode >> 8) & 0xFF) / 255.0,
      blue: Double((intCode) & 0xFF) / 255.0,
      opacity: 1.0
    )
  }
  
  /// Creates an instance of UIColor that uses P3 color space.
  ///
  /// - Parameters:
  ///   - sample: You can put the color literal to visualize color. Actually this parameter won't be used anywhere.
  public init(
    _ colorSpace: Color.RGBColorSpace = .sRGB,
    hexInt: Int,
    opacity: CGFloat = 1
  ) {
    
    self = .init(
      colorSpace,
      red: Double((hexInt & 0x00FF_0000) >> 16) / 255,
      green: Double((hexInt & 0x0000_FF00) >> 8) / 255,
      blue: Double((hexInt & 0x0000_00FF) >> 0) / 255,
      opacity: opacity
    )
    
  }
  
}
