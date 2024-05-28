import Foundation

class CronosViewModel:ObservableObject {
    @Published var cronos: [batata] = []
    func fetch() {
        guard let url = URL(string:"http://192.168.128.30:1880/getproject") else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data, error == nil else{
                return
            }
            
            do {
                let parsed = try JSONDecoder().decode([batata].self, from:data)
                DispatchQueue.main.async {
                    self?.cronos = parsed
                }
            } catch {
                print(error)
            }
        }
        task.resume()
    }
    
    func post(_ b : batata) {
        guard let url = URL(string:"http://192.168.128.55:1880/postproject") else {
            return
        }
        
        var request = URLRequest(url: url)
        
        request.httpMethod = "POST"
        
        var header = request.allHTTPHeaderFields ?? [:]
        header["Content-Type"] = "application/json"
        request.allHTTPHeaderFields = header
        
        do {
            let encoded = try JSONEncoder().encode(b)
            request.httpBody = encoded
            print(String(data: request.httpBody!, encoding: .utf8) ?? "NUM FOI")
        } catch {
            print(error)
        }
        
        var task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let httpResponse = response as? HTTPURLResponse  else {
                print("Error")
                return
            }
            
            if httpResponse.statusCode == 200{
                print("FUNFO")
            }else{
                print(httpResponse.statusCode)
            }
        }
        task.resume()
    }
}
