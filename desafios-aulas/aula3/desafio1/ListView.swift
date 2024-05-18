import SwiftUI

struct ListView: View {
    var body: some View {
        List{
            HStack{
                Text("Item 1")
                Spacer()
                Image(systemName: "paintbrush")
            }
            
            HStack{
                Text("Item 2")
                Spacer()
                Image(systemName: "paintbrush.pointed")
            }
            HStack{
                Text("Item 3")
                Spacer()
                Image(systemName: "paintpalette")
            }
        }
    }
}
