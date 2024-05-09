import SwiftUI
import MapKit

struct SheetView: View {
    @State  var x: Location
    var body: some View {
        Text(x.pais)
            .font(.title)
        Spacer()
            .frame(height: 150)
        AsyncImage(url: URL(string: x.flag)) { image in
            image
                .resizable()
                .aspectRatio(contentMode: .fill)
            
        } placeholder: {
            Color.gray
        }
        .frame(width: 350, height: 60)
        Spacer()
            .frame(height: 150)
        Text(x.description)
    }
}

#Preview {
    SheetView(x: Location(name:"Belo Horizonte", coordinate: CLLocationCoordinate2D(latitude: -19.924557, longitude: -43.991597), flag:"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT9odmN0oTnXho1ldt-pNAXnqid1cBnq2tontGAcPxObw&s", description: "Belo Horizonte é a capital do estado de Minas Gerais, no sudeste do Brasil.", pais: "Brasil"))
}
