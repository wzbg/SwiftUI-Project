//
//  FetchModelMessageList.swift
//  SwiftUI-Project
//
//  Created by huanbing on 2020/2/4.
//  Copyright © 2020 unrealce. All rights reserved.
//

import Foundation

class FetchModelMessageList: ObservableObject {
  @Published var items: [ModelMessage] = []
  
  static let url = URL(string: "http://www.hdjc8.com/json/message.json")!
  
  func fetch() {
    URLSession.shared.dataTask(with: Self.url) { data, response, error in
      guard let data = data, error == nil else {
        return
      }
      let jsonDecoder = JSONDecoder()
      let modelObject = try? jsonDecoder.decode(ModelMessageList.self, from: data)
      DispatchQueue.main.async {
        self.items = modelObject!.items
        print(self.items)
      }
    }.resume()
  }
}
