//

import SwiftUI

struct ContentView: View {
  @EnvironmentObject var newsManager: NewsManager
  
  var dateFormatter: DateFormatter {
    let dateFormatter = DateFormatter()
    dateFormatter.dateStyle = .short
    return dateFormatter
  }
  
  var body: some View {
    NavigationView {
    ScrollView {
      ForEach(newsManager.news) { newsItem in
        NavigationLink {
          DetailView(newsItem: newsItem)
        } label: {
          RowView(newsItem: newsItem)
            .multilineTextAlignment(.leading)
        }
      }
      }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
      .environmentObject(NewsManager())
  }
}
