//
//  FetchModelQuizDetailList.swift
//  SwiftUI-Project
//
//  Created by huanbing on 2020/2/4.
//  Copyright © 2020 unrealce. All rights reserved.
//

import Foundation

class FetchModelQuizDetailList: ObservableObject {
  @Published var items: [ModelQuizDetail] = []
  @Published var item: ModelQuizDetail?
  
  static let url = URL(string: "http://www.hdjc8.com/json/quizDetail.json")!
  
  func fetch() {
    URLSession.shared.dataTask(with: Self.url) { data, response, error in
      guard let data = data, error == nil else {
        return
      }
      let jsonDecoder = JSONDecoder()
      let modelObject = try? jsonDecoder.decode(ModelQuizDetailList.self, from: data)
      DispatchQueue.main.async {
        self.items = modelObject!.items
        print(self.items)
        self.getItem()
      }
    }.resume()
  }
  
  func getItem() {
    item = items.randomElement()!
  }
}
