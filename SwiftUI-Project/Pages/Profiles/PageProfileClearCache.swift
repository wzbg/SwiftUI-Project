//
//  PageProfileClearCache.swift
//  SwiftUI-Project
//
//  Created by huanbing on 2020/2/4.
//  Copyright © 2020 unrealce. All rights reserved.
//

import SwiftUI

struct PageProfileClearCache: View {
  @State private var totalSize = 0
  @State private var showingAlert = false
  @State private var isAnimating = false
  
  var body: some View {
    VStack {
      SubPageTopTitle(title: "清理缓存", subTitle: "不会影响正常使用")
      VStack {
        Spacer()
        ZStack {
          CircleBackGround(color: .purple)
          Image(systemName: "doc")
            .foregroundColor(.white)
        }.modifier(SpringAnimationStyle(isAnimating: $isAnimating, delay: 0.3))
        Button("清 理") {
          self.clearCache()
          self.showingAlert = true
        }.modifier(RedNumber())
        .modifier(SpringAnimationStyle(isAnimating: $isAnimating, delay: 0.4))
        Text("缓存：\(totalSize/1024) KB")
          .modifier(SmallText())
          .padding(.top, 20)
          .modifier(SpringAnimationStyle(isAnimating: $isAnimating, delay: 0.5))
        Spacer()
      }
    }.modifier(SubPageContainer())
    .alert(isPresented: $showingAlert) {
      Alert(title: Text("缓存已清除"))
    }
    .onAppear() {
      self.sumFolderSize()
      self.isAnimating = true
    }
  }
  
  func getSize(filePath: String) -> Int {
    var fileSize: UInt64 = 0
    do {
      let attr = try FileManager.default.attributesOfItem(atPath: filePath)
      fileSize = attr[FileAttributeKey.size] as! UInt64
      let dict = attr as NSDictionary
      fileSize = dict.fileSize()
    } catch {
      print("Error: \(error)")
    }
    return Int(fileSize)
  }
  
  func sumFolderSize() {
    totalSize = 0
    let fileManager = FileManager.default
    let folder = NSHomeDirectory() + "/Documents/"
    let files = fileManager.subpaths(atPath: folder)
    if let files = files {
      for file in files {
        let fileSize = getSize(filePath: folder + file)
        totalSize += fileSize
      }
    }
  }
  
  func clearCache() {
    let fileManager = FileManager.default
    let folder = NSHomeDirectory() + "/Documents/"
    let files = fileManager.subpaths(atPath: folder)
    if let files = files {
      for file in files {
        do {
          try fileManager.removeItem(atPath: folder + file)
        } catch {
          print("Failed to clear cache.")
        }
      }
    }
    sumFolderSize()
  }
}

struct PageProfileClearCache_Previews: PreviewProvider {
  static var previews: some View {
    PageProfileClearCache()
  }
}
