import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView{
            BrushView()
                .tabItem{
                    Label("Rosa", systemImage:  "paintbrush.fill")
                }
            
            PaintBrushView()
                .tabItem{
                    Label("Rosa", systemImage:  "paintbrush.pointed.fill")
                }
            
            InkView()
                .tabItem{
                    Label("Cinza", systemImage: "paintpalette")
                }
            
            ListView()
                .tabItem{
                    Label("Lista", systemImage: "list.bullet")
                }
        }
    }
}
