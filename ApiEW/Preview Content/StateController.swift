//
//  StateController.swift
//  ApiEW
//
//  Created by Alexander Bater on 17/03/2023.
//

import Foundation

class StateController: ObservableObject {
    @Published var age: String = ""
    
    func getAge(name: String) {
        let baseUrl = "https://api.agify.io"
        let query = "?name=\(name)"
        
        guard let url = URL(string: baseUrl + query) else {
            print("Invalid URL")
            return
        }
        
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let data = data {
                if let age = self.parseJson(json: data)?.age {
                    DispatchQueue.main.async {
                        self.age = "The age of \(name) is \(age)"
                    }
                }
            }
        }.resume()
    }
    
    func parseJson(json: Data) -> AgeResponse?{
        let decoder = JSONDecoder()
        
        do {
            let response = try decoder.decode(AgeResponse.self, from: json)
            return response
        } catch {
            print("Error decoding JSON: \(error)")
            return nil
        }
    }
}
