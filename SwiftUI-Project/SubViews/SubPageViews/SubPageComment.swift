//
//  SubPageComment.swift
//  SwiftUI-Project
//
//  Created by huanbing on 2020/2/4.
//  Copyright © 2020 unrealce. All rights reserved.
//

import SwiftUI

struct SubPageComment: View {
  var message: String
  var isFromUser: Bool
  
  private let assistantColor1 = Color(red: 83/255, green: 196/255, blue: 249/255)
  private let assistantColor2 = Color(red: 255/255, green: 123/255, blue: 109/255)
  
  var body: some View {
    let assistantColor = isFromUser ? assistantColor2 : assistantColor1
    let personImage = Image(systemName: "person.crop.circle")
      .foregroundColor(assistantColor)
      .font(.system(size: 26))
      .padding(.trailing, 5)
    let arrowImage = Image(systemName: "arrowtriangle.left.fill")
      .foregroundColor(assistantColor)
      .font(.system(size: 18))
    let messageText = Text(message)
      .padding()
      .foregroundColor(.white)
      .font(.system(size: 15))
      .clipped()
      .background(
        RoundedRectangle(cornerRadius: 20, style: RoundedCornerStyle.circular)
          .fill(assistantColor)
      )
    return HStack(alignment: .center, spacing: 0) {
      if isFromUser {
        personImage
        arrowImage
        messageText
        Spacer()
      } else {
        Spacer()
        messageText
        arrowImage
        personImage
      }
    }
  }
}

struct SubPageComment_Previews: PreviewProvider {
  static var previews: some View {
    let message = "SwiftUI 是一种创新、简洁的编程方式，通过 Swift 的强大功能，在所有 Apple 平台上构建用户界面。借助它，您只需一套工具和 API，即可创建面向任何 Apple 设备的用户界面。SwiftUI 采用简单易懂、编写方式自然的声明式 Swift 语法，可无缝支持新的 Xcode 设计工具，让您的代码与设计保持高度同步。SwiftUI 原生支持“动态字体”、“深色模式”、本地化和辅助功能——第一行您写出的 SwiftUI 代码，就已经是您编写过的、功能最强大的 UI 代码。"
    return VStack {
      SubPageComment(message: message, isFromUser: true)
      SubPageComment(message: message, isFromUser: false)
    }
  }
}
