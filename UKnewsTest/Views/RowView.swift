//

import SwiftUI

struct RowView: View {
  let newsItem: NewsModel
  
    var body: some View {
      VStack (alignment: .leading) {
        Text(newsItem.publishedAt.utcToLocal())
          .font(.subheadline)

        Text(newsItem.title)
          .fontWeight(.medium)
          .lineLimit(3)
          .padding(.bottom, 2)
        VStack (alignment: .leading) {
          Text("Author: " + ((newsItem.author?.isEmpty ?? false)
                             ? "Unknown"
                             : (newsItem.author ?? "Unknown"))
          )
            .lineLimit(1)
          Text("Source: " + newsItem.source.name)
        }
        .font(.callout.italic())
      }
      .padding()
      .frame(maxWidth: .infinity, alignment: .leading)
      .background(Color.gray).cornerRadius(15)
      .padding(.horizontal, 10)
      .foregroundColor(Color.primary)
    }
}

struct RowView_Previews: PreviewProvider {
    static var previews: some View {
        RowView(newsItem: NewsModel(title: "As Louisville police investigate what led up to bank shooting that left 5 dead, several victims remain hospitalized - CNN", author: "Google", source: Source(name: "Google"), publishedAt: "2023-04-11T11:34:00Z", urlToImage: nil, url: "https://"))
    }
}
