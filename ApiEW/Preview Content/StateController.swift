//
//  StateController.swift
//  ApiEW
//
//  Created by Alexander Bater on 17/03/2023.
//

import Foundation

class StateController: ObservableObject {
    @Published var quote3: String = ""
    
    func getQuote() {
        let baseUrl = "https://api.kanye.rest"
        
        guard let url = URL(string: baseUrl) else {
            print("Invalid URL")
            return
        }
        
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let data = data {
                if let quote = self.parseJson(json: data)?.quote {
                    DispatchQueue.main.async {
                        self.quote3 = quote
                    }
                }
            }
        }.resume()
    }
    
    func parseJson(json: Data) -> Quote?{
        let decoder = JSONDecoder()
        
        do {
            let quote = try decoder.decode(Quote.self, from: json)
            return quote
        } catch {
            print("Error decoding JSON: \(error)")
            return nil
        }
    }
}
