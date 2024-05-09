import SwiftUI
import MapKit

struct Location: Identifiable{
    var id = UUID()
    var name: String
    var coordinate: CLLocationCoordinate2D
    var flag: String
    var description: String
    var pais: String
}

var cidades = [
    Location(name:"Belo Horizonte", coordinate: CLLocationCoordinate2D(latitude: -19.924557, longitude: -43.991597), flag:"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT9odmN0oTnXho1ldt-pNAXnqid1cBnq2tontGAcPxObw&s", description: "Belo Horizonte é a capital do estado de Minas Gerais, no sudeste do Brasil.", pais: "Brasil"),
    Location(name:"Paris", coordinate: CLLocationCoordinate2D(latitude: 48.8534100, longitude: 2.3488000), flag:"https://static.todamateria.com.br/upload/fr/an/frana_a.jpg", description: "Paris é a capital e a mais populosa cidade da França, com uma população estimada em 2020 de 2 148 271 habitantes em uma área de 105 quilômetros quadrados.\nDesde o século XVII, Paris é um dos principais centros de finanças, diplomacia, comércio, moda, ciência e artes da Europa.", pais: "França"),
    Location(name:"Tokyo", coordinate: CLLocationCoordinate2D(latitude: 35.652832, longitude: 139.839478), flag:"https://s4.static.brasilescola.uol.com.br/be/2022/11/bandeira-do-japao.jpg", description: "Tóquio, oficialmente Metrópole de Tóquio, é a capital do Japão e uma das 47 prefeituras do país. Situa-se em Honshu, a maior ilha do arquipélago.", pais: "Japão")
]

struct ContentView: View {
    @State private var show: Bool = false
    @State private var position = MapCameraPosition.region(MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 0, longitude: 0),
        span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1)
        
    ))
    @State private var pais1: String = ""
    var body: some View {
        ZStack{
            VStack{
                Map(position: $position){
                    ForEach(cidades){ c in
                        Annotation(c.name, coordinate: c.coordinate){
                            Image(systemName: "mappin.circle.fill")
                                .onTapGesture {
                                    show.toggle()
                                }
                                .sheet(isPresented: $show){
                                    SheetView(x: c)
                                }
                        }
                    }
                }
            }
            
            VStack{
                Text("World Map")
                Text(pais1)
                Spacer()
                    .frame(height: 550)
                HStack(spacing: 30){
                    ForEach(cidades) { e in
                        AsyncImage(url: URL(string: e.flag)) { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                            
                        } placeholder: {
                            Color.gray
                        }
                        .frame(width: 80, height: 60)
                        .onTapGesture {
                            position = MapCameraPosition.region(MKCoordinateRegion(
                                center: e.coordinate,
                                span: MKCoordinateSpan(latitudeDelta: 1000, longitudeDelta: 1000)
                                ))
                            pais1 = e.pais
                        }
                        .frame(alignment: .bottom)
                    }
                }
            }
        }
    }
}
