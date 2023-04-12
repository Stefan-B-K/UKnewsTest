//

import SwiftUI

@main
struct UKnewsTestApp: App {
  var body: some Scene {
    WindowGroup {
      ContentView()
        .environmentObject(NewsManager())
    }
  }
}
