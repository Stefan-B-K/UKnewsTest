// structures mirrored from the API response / JSON

import Foundation

struct NewsAPI: Decodable {
  let articles: [NewsModel]
}

struct NewsModel: Decodable, Identifiable, Hashable {
  var id: some Hashable { url }
  let title: String
  let author: String?
  let source: Source
  let publishedAt: String
  let urlToImage: String?
  let url: String
}

struct Source: Decodable, Equatable, Hashable {
  let name: String
}


