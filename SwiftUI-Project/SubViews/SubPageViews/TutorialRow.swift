//
//  TutorialRow.swift
//  SwiftUI-Project
//
//  Created by huanbing on 2020/2/3.
//  Copyright © 2020 unrealce. All rights reserved.
//

import SwiftUI

struct TutorialRow: View {
  var tutorial: ModelTutorial
  @State private var isAnimating = false
  
  var body: some View {
    VStack {
      HStack(alignment: .top, spacing: 10) {
        Image(systemName: tutorial.status.rawValue)
          .modifier(RedNumberSmall())
          .offset(x: 0, y: 15)
        VStack(alignment: .leading, spacing: 0) {
          Text(tutorial.title)
            .modifier(RegularTitle())
          Text(tutorial.subTitle)
            .fontWeight(.light)
            .modifier(SubTitle())
          HStack {
            HStack(alignment: .center, spacing: 2) {
              ForEach(0 ..< tutorial.starCount) { _ in
                Image(systemName: "star.fill")
              }
              ForEach(tutorial.starCount ..< 5) { _ in
                Image(systemName: "star")
              }
            }
            Spacer()
            HStack {
              Image(systemName: "flame.fill")
              Text("\(tutorial.fireCount)")
            }
            HStack {
              Image(systemName: "hand.thumbsup.fill")
              Text("\(tutorial.favoriteCount)")
            }.padding(.leading, 10)
          }.padding(.top, 10)
          .font(.system(size: 11))
          .modifier(SubTitle())
        }.padding(.top, 10)
        .padding(.bottom, 8)
      }
      Rectangle()
        .fill(Color.black.opacity(0.1))
        .frame(height: 1)
    }.offset(x: isAnimating ? 0 : 100, y: 0)
    .modifier(SpringAnimationStyle(
      isAnimating: $isAnimating,
      delay: 0.3 + 0.1 * Double(tutorial.sequence)
    ))
    .frame(width: screenWidth - 80)
    .onAppear() {
      self.isAnimating = true
    }
  }
}

struct TutorialRow_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      TutorialRow(tutorial: tutorialList[0])
      TutorialRow(tutorial: tutorialList[1])
      TutorialRow(tutorial: tutorialList[2])
    }
  }
}
