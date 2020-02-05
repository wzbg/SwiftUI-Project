//
//  PageAssistant.swift
//  SwiftUI-Project
//
//  Created by huanbing on 2020/2/3.
//  Copyright © 2020 unrealce. All rights reserved.
//

import SwiftUI

struct PageAssistant: View {
  @State private var newMessage = ""
  @State private var isPresented = false
  @State private var isAnimating = false
  
  @ObservedObject var model = FetchModelMessageList()
  
  var body: some View {
    VStack(alignment: .leading, spacing: 10) {
      SubPageTopTitle(title: "客服服务", subTitle: "遇到问题请留言", withArrow: false)
        .padding(.leading, 20)
        .padding(.bottom, 20)
      if model.items.count == 0 {
        Text("加载中...")
      } else {
        ScrollView(.vertical, showsIndicators: false) {
          ForEach(model.items, id: \.self) {
            SubPageComment(message: $0.message, isFromUser: $0.isFromUser == 1)
          }.padding(.horizontal, 20)
        }.modifier(SpringAnimationStyle(isAnimating: $isAnimating, delay: 0.3))
      }
      HStack {
        ZStack {
          RoundedRectangle(cornerRadius: 6)
            .stroke(lineWidth: 1)
            .fill(Color.black.opacity(0.2))
            .frame(height: 36)
          TextField("新消息", text: $newMessage)
            .font(.system(size: 16))
            .padding(8)
        }.padding(.trailing, 5)
        Image(systemName: "return")
          .font(.system(size: 14))
          .foregroundColor(.gray)
          .onTapGesture {
            if self.newMessage.isEmpty {
              self.isPresented = true
              return
            }
            self.model.items.insert(ModelMessage(
              message: self.newMessage,
              postDate: "\(Date())",
              isFromUser: 1
            ), at: 0)
            self.newMessage = ""
          }
      }.padding()
      .modifier(SpringAnimationStyle(isAnimating: $isAnimating, delay: 0.4))
      .alert(isPresented: $isPresented) {
        Alert(title: Text("请输入消息"))
      }
    }.modifier(SubPageContainer())
    .onAppear {
      self.model.fetch()
      self.isAnimating = true
    }
  }
}

struct PageAssistant_Previews: PreviewProvider {
  static var previews: some View {
    PageAssistant()
  }
}
