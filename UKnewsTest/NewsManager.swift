//

import UIKit

@MainActor
final class NewsManager: ObservableObject {
  
  @Published var news = [NewsModel]()
  
  static let defaultImageUrl = "https://thumbs.dreamstime.com/b/news-newspapers-folded-stacked-word-wooden-block-puzzle-dice-concept-newspaper-media-press-release-42301371.jpg"
  
  init() {
    loadNews(country: "gb")             
  }
  
 
  func loadNews(country: String) {
    Task {
      do {
        let urlString = "https://newsapi.org/v2/top-headlines?country=\(country)&apiKey=347ea76b36f4455b85cf7afe8b84ea74"
        let url = URL(string: urlString)!
        let (data, _) = try await URLSession.shared.data(from: url)
        self.news = try JSONDecoder().decode(NewsAPI.self, from: data).articles
      } catch {
        print(error)
      }
    }
  }

}

