//

import Foundation

struct NewsAPI: Codable {
  let articles: [NewsModel]
}

struct NewsModel: Codable, Identifiable, Hashable {
  var id: some Hashable { url }
  let title: String
  let urlToImage: String?
  let url: String
}
