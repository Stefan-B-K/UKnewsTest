//

import UIKit

@MainActor
final class NewsManager: ObservableObject {
  
  // from Info.plist --> value set to $(API_KEY), reading value from Config.xcconfig
  private let newsApiKey = Bundle.main.infoDictionary?["NewsApiKey"] as! String
  
  @Published var news = [NewsModel]()
  
  init() {
    loadNews(country: "us")         // "us" has images
  }
  
  // load news for specific country code ( https://newsapi.org/docs/endpoints/sources )
  func loadNews(country: String) {
    Task {
      do {
        let urlString = "https://newsapi.org/v2/top-headlines?country=\(country)&apiKey=\(newsApiKey)"
        let url = URL(string: urlString)!
        let (data, _) = try await URLSession.shared.data(from: url)
        self.news = try JSONDecoder().decode(NewsAPI.self, from: data).articles
      } catch {
        print(error)
      }
    }
  }

}

