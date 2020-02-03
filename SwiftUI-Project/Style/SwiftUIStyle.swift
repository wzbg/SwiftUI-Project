//
//  SwiftUIStyle.swift
//  SwiftUI-Project
//
//  Created by huanbing on 2020/2/2.
//  Copyright © 2020 unrealce. All rights reserved.
//

import SwiftUI

let screenWidth = UIScreen.main.bounds.width
let screenHeight = UIScreen.main.bounds.height

let darkGrayColor = Color(red: 0.3, green: 0.3, blue: 0.3)
let orangeColor = Color(red: 255/255, green: 123/255, blue: 109/255)

struct BigTitle: ViewModifier {
  func body(content: Content) -> some View {
    content
      .font(.system(size: 24))
      .foregroundColor(darkGrayColor)
  }
}

struct MiddleTitle: ViewModifier {
  func body(content: Content) -> some View {
    content
      .font(.system(size: 20))
      .foregroundColor(darkGrayColor)
  }
}

struct SubTitle: ViewModifier {
  func body(content: Content) -> some View {
    content
      .font(.system(size: 13))
      .foregroundColor(darkGrayColor)
  }
}

struct RegularTitle: ViewModifier {
  func body(content: Content) -> some View {
    content
      .font(.system(size: 15))
      .foregroundColor(darkGrayColor)
  }
}

struct RegularTitleOption: ViewModifier {
  var isHighlight = false
  
  func body(content: Content) -> some View {
    content
      .font(.system(size: 15))
      .foregroundColor(isHighlight ? orangeColor : Color.gray)
  }
}

struct CommonButton: ViewModifier {
  var isEnable = false
  
  func body(content: Content) -> some View {
    content
      .padding()
      .background(RoundedRectangle(cornerRadius: 5)
          .fill(isEnable ? orangeColor : Color.gray))
      .foregroundColor(.white)
      .font(.system(size: 15))
  }
}

struct CategoryLabel: ViewModifier {
  private let colors: [Color] = [.orange, .purple, .red, .green, .blue, .pink]
  
  func body(content: Content) -> some View {
    content
      .padding(12)
      .background(RoundedRectangle(cornerRadius: 14)
        .fill(colors[Int.random(in: 0 ... colors.count)]))
      .font(.system(size: 13))
      .foregroundColor(.white)
  }
}

struct LoadingTitle: ViewModifier {
  @State private var brightness = 0.0
  
  func body(content: Content) -> some View {
    content
      .padding(.leading, 20)
      .modifier(SmallText())
      .brightness(brightness)
      .animation(Animation.spring().repeatForever())
      .onAppear() {
        self.brightness = 1
      }
  }
}

struct SmallText: ViewModifier {
  func body(content: Content) -> some View {
    content
  }
}

struct RedNumberSmall: ViewModifier {
  func body(content: Content) -> some View {
    content
      .foregroundColor(.red)
  }
}

struct SubPageContainer: ViewModifier {
  func body(content: Content) -> some View {
    content
      .padding(.horizontal)
      .padding(.top)
      .navigationBarTitle("")
      .navigationBarHidden(true)
  }
}
