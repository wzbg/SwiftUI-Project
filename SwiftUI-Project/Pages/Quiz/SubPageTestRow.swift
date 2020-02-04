//
//  SubPageTestRow.swift
//  SwiftUI-Project
//
//  Created by huanbing on 2020/2/3.
//  Copyright © 2020 unrealce. All rights reserved.
//

import SwiftUI

struct SubPageTestRow: View {
  var model: ModelQuiz
  var sequence: Int
  @State private var isAnimating = false
  
  var body: some View {
    ZStack {
      RoundedRectangle(cornerRadius: 10)
        .fill(Color.white)
        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 0)
        .frame(width: screenWidth - 100, height: 150)
      HStack {
        Spacer()
        Image(model.icon)
        Spacer()
        VStack(alignment: .leading, spacing: 0) {
          Text(model.title)
            .modifier(MiddleTitle())
          Text(model.subTitle)
            .modifier(SmallText())
            .padding(.bottom, 10)
          HStack(alignment: .top, spacing: 0) {
            VStack(alignment: .leading, spacing: 3) {
              Text("Rate")
                .modifier(SmallText())
              Text("\(model.correctRate)%")
                .modifier(RedNumber())
              CommonStarList(level: model.starCount)
                .padding(.top, 10)
            }.padding(.trailing, 10)
            VStack(alignment: .leading, spacing: 3) {
              Text("Amount")
                .modifier(SmallText())
              Text("\(model.submit)")
                .modifier(RedNumber())
            }
          }.padding(.top, 10)
        }
        Spacer()
        ZStack {
          Image(systemName: "capsule.fill")
            .font(.system(size: 48))
            .foregroundColor(.red)
          HStack {
            Image(systemName: "paperclip")
            Text("Go")
          }.foregroundColor(.white)
        }.offset(x: 0, y: 36)
        Spacer()
      }
    }.padding(.top, 10)
    .modifier(SpringAnimationStyle(
      isAnimating: $isAnimating,
      delay: 0.3 + 0.1 * Double(sequence)
    ))
    .onAppear() {
      self.isAnimating = true
    }
  }
}

struct SubPageTestRow_Previews: PreviewProvider {
  static var previews: some View {
    SubPageTestRow(
      model: ModelQuiz(
        title: "Quiz for Coding",
        subTitle: "1000 questions in tottal",
        icon: "tlIconMobile1",
        correctRate: 98,
        submit: 68,
        starCount: 4
      ),
      sequence: 1
    )
  }
}
