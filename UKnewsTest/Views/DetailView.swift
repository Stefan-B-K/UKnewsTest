//

import SwiftUI

struct DetailView: View {
  let newsItem: NewsModel
  
  var body: some View {
    HStack () {
      
      
      VStack (alignment: .leading) {
        Text(newsItem.title)
          .font(.title2)
        
        Group {
          if let urlToImage = newsItem.urlToImage,
              let url = URL(string: urlToImage) {
            HStack(alignment: .center) {
              AsyncImage(url: url) { image in
                image
                  .resizable()
                  .scaledToFit()
              } placeholder: {
                ProgressView()
                  .scaleEffect(3)
                  .padding()
              }
            }
          } else {
            Image("news-dice")
          }
        }
        .frame(maxWidth: .infinity, alignment: .center)
        
        HStack(alignment: .center) {
          Button("Read More") {
            UIApplication.shared.open(URL(string: newsItem.url)!)
          }
          .padding(8)
          .background(Color.gray)
          .clipShape(Capsule())
          .foregroundColor(.white)
          .padding()
          .frame(maxWidth: .infinity, alignment: .center)
        }
        
        Spacer()
        
      }
    }
    .padding()
    .frame(maxWidth: .infinity, alignment: .leading)
  }
}

struct DetailView_Previews: PreviewProvider {
  static var previews: some View {
    DetailView(newsItem: NewsModel(title: "As Louisville police investigate what led up to bank shooting that left 5 dead, several victims remain hospitalized - CNN", author: "Google", source: Source(name: "Google"), publishedAt: "2023-04-11T11:34:00Z", urlToImage: "https://media.cnn.com/api/v1/images/stellar/prod/230411111053-kentucky-shooting-police-0410.jpg?c=16x9&q=w_800,c_fill", url: "https://"))
  }
}
