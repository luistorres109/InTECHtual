import Foundation

class ViewModel: ObservableObject{
    @Published var heroes: [Heroes] = []
    
    func fetch(){
        guard let url = URL(string: "http://127.0.0.1:1880/reading") else{
            return
        }
        
        let task = URLSession.shared.dataTask(with: url){ [weak self] data, _, error in
            guard let data = data, error == nil else{
                return
            }
            
            do {
                let parsed = try JSONDecoder().decode([Heroes].self, from: data)
                DispatchQueue.main.async {
                    self?.heroes = parsed
                }
            } catch {
                print(error)
            }
        }
        task.resume()
    }
}
