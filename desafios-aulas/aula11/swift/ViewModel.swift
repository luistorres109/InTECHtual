import Foundation

class ViewModel: ObservableObject{
    @Published var leitor: [LeitorGas] = []
    
    func fetch(){
        guard let url = URL(string: "http://127.0.0.1:1880/gashorarioget") else{
            return
        }
        
        let task = URLSession.shared.dataTask(with: url){ [weak self] data, _, error in
            guard let data = data, error == nil else{
                return
            }
            
            do {
                let parsed = try JSONDecoder().decode([LeitorGas].self, from: data)
                DispatchQueue.main.async {
                    self?.leitor = parsed
                }
            } catch {
                print(error)
            }
            
        }
        task.resume()
    }
}
