import UIKit

class MarvelApi {
   class func serviceApi(_ completion: @escaping (API) -> Void) {
        guard let url = URL(string: "https://mcuapi.herokuapp.com/api/v1/movies") else {
            print("URL inválida.")
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("Erro na requisição: \(error)")
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                print("Resposta inválida do servidor.")
                return
            }
            
            if httpResponse.statusCode == 200 {
                if let data = data {
                    do {
                        let decoder = JSONDecoder()
                        let apiResponse = try decoder.decode(API.self, from: data)
                        completion(apiResponse)
                    } catch {
                        print("Erro na decodificação dos dados: \(error)")
                    }
                } else {
                    print("Nenhum dado retornado.")
                }
            } else {
                print("Status de resposta inválido: \(httpResponse.statusCode)")
            }
        }
        task.resume()
    }
}

