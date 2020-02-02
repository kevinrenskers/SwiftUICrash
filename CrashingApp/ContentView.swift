import SwiftUI

final class AppStore: ObservableObject {
  @Published var showingDetails = false
}

struct RootView: View {
  @EnvironmentObject private var store: AppStore

  var body: some View {
    Group {
      if store.showingDetails {
        DetailsView()
      } else {
        ListView()
      }
    }
  }
}

struct DetailsView: View {
  @EnvironmentObject private var store: AppStore

  var body: some View {
    NavigationView {
      ZStack {
        GeometryReader { geo in
          Image("bg")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .edgesIgnoringSafeArea(.all)
            .frame(width: geo.size.width, height: geo.size.height)
        }

        Button("List") {
          self.store.showingDetails = false // <- this works fine
        }
        .padding(20)
        .background(Color.white)
      }
      .navigationBarTitle(Text("Details"))
      .navigationBarItems(trailing: trailingNavigationBarItem)
    }
  }

  private var trailingNavigationBarItem: some View {
    Button("List") {
      self.store.showingDetails = false // <- this crashes the app!
    }
  }
}

struct ListView: View {
  @EnvironmentObject private var store: AppStore

  var body: some View {
    NavigationView {
      Button("Load details") {
        self.store.showingDetails = true
      }
      .padding(20)
      .background(Color.white)
      .navigationBarTitle("List")
    }
  }
}
