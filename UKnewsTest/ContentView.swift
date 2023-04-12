//

import SwiftUI

struct ContentView: View {
  @EnvironmentObject var newsManager: NewsManager
  @State private var isUKnews = true
  
  var body: some View {
   
    VStack {
      Button((isUKnews ? "US" : "UK") + " news") {
        isUKnews.toggle()
      }
      .padding()
      .background(Color.gray)
      .font(.headline)
      .fontWeight(.bold)
      .foregroundColor(.black)
      .cornerRadius(15)
      .frame(width: 150, height: 50)
      
      ScrollView {
        ForEach(newsManager.news) { newsItem in
          HStack () {
            AsyncImage(url: URL(string: newsItem.urlToImage ?? NewsManager.defaultImageUrl)) { image in
              image.resizableFrame(width: 100, height: 100)
            } placeholder: {
              ProgressView()
            }
            
            VStack (alignment: .leading) {
              Text(newsItem.title)
              Spacer()
              Button("Read More...") {
                UIApplication.shared.open(URL(string: newsItem.url)!)
              }
            }
          }
          .padding()
          .frame(maxWidth: .infinity, alignment: .leading)
        }
      }
      .onChange(of: isUKnews) { newValue in
        newsManager.loadNews(country: isUKnews ? "gb" : "us")
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


extension Image {
  func resizableFrame(width: CGFloat? = nil, height: CGFloat? = nil, alignment: Alignment = .center) -> some View  {
    self
      .resizable()
      .aspectRatio(1, contentMode: .fit)
      .frame(width: width, height: height, alignment: alignment)
  }
}
