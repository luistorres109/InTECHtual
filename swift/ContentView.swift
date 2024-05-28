import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            TestView()
                .tabItem {
                    Label("Testes", systemImage:  "list.bullet.clipboard")
                }
            ChecklistView()
                .tabItem {
                    Label("Checklist", systemImage:  "checklist.checked")
                }
            NoticiasView()
                .tabItem {
                    Label("Notícias", systemImage:  "newspaper")
                }
            AjustesView()
                .tabItem {
                    Label("Ajustes", systemImage:  "gearshape")
                }
        }
    }
}

#Preview {
    ContentView()
}
