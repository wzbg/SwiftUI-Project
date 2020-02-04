//
//  PageProfile.swift
//  SwiftUI-Project
//
//  Created by huanbing on 2020/2/3.
//  Copyright © 2020 unrealce. All rights reserved.
//

import SwiftUI
import StoreKit

struct PageProfile: View {
  @State private var isAnimating = false
  
  private var scaleFactor = { () -> CGFloat in
    if screenWidth <= 375 {
      return screenWidth / 420
    }
    return 1
  }
  
  var body: some View {
    NavigationView {
      VStack {
        HStack {
          Spacer()
          Image("unrealce")
            .resizable()
            .scaledToFit()
            .mask(Circle())
            .frame(width: 64)
        }.modifier(SpringAnimationStyle(isAnimating: $isAnimating))
        HStack {
          VStack(alignment: .leading, spacing: 0) {
            Text("￠幻冰")
              .font(.system(size: 32))
              .modifier(SpringAnimationStyle(isAnimating: $isAnimating, delay: 0.1))
            Text("雾币：10")
              .font(.system(size: 16))
              .foregroundColor(.orange)
              .modifier(SpringAnimationStyle(isAnimating: $isAnimating, delay: 0.2))
          }.padding(.leading, 10)
          Spacer()
        }
        SubPageProfileStatic()
          .modifier(SpringAnimationStyle(isAnimating: $isAnimating, delay: 0.3))
        ScrollView {
          NavigationLink(destination: PageProfileSubscription()) {
            SubPageProfileRow(model: profileList[0])
              .modifier(SpringAnimationStyle(isAnimating: $isAnimating, delay: 0.4))
          }
          NavigationLink(destination: PageTutorialList(title: profileList[1].title)) {
            SubPageProfileRow(model: profileList[1])
              .modifier(SpringAnimationStyle(isAnimating: $isAnimating, delay: 0.5))
          }
          NavigationLink(destination: PageProfileSkills()) {
            SubPageProfileRow(model: profileList[2])
              .modifier(SpringAnimationStyle(isAnimating: $isAnimating, delay: 0.6))
          }
          NavigationLink(destination: PageProfileDownload()) {
            SubPageProfileRow(model: profileList[3])
              .modifier(SpringAnimationStyle(isAnimating: $isAnimating, delay: 0.7))
          }
          NavigationLink(destination: PageProfileClearCache()) {
            SubPageProfileRow(model: profileList[4])
              .modifier(SpringAnimationStyle(isAnimating: $isAnimating, delay: 0.8))
          }
          SubPageProfileRow(model: profileList[5]).onTapGesture {
            if #available(iOS 10.3, *) {
              SKStoreReviewController.requestReview()
            } else if let url = URL(string: "itms-apps://itunes.apple.com/app/id1392811165") {
              UIApplication.shared.openURL(url)
            }
          }.modifier(SpringAnimationStyle(isAnimating: $isAnimating, delay: 0.9))
        }.padding()
      }.scaleEffect(scaleFactor())
      .edgesIgnoringSafeArea(.all)
      .onAppear() {
        self.isAnimating = true
      }
    }.padding()
  }
}

struct PageProfile_Previews: PreviewProvider {
  static var previews: some View {
    PageProfile()
  }
}
