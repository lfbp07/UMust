//
//  MostPopularRequest.swift
//  UMustApp
//
//  Created by Luis Pereira on 25/12/21.
//

import Foundation

class GenreRequest {
    public class func fetchGenreNames(completion: @escaping ((GenreResposeModel) -> Void)) {
        
        let url:URL? = URL(string: "https://api.themoviedb.org/3/genre/movie/list?api_key=205e6b399ee3b7f57ff808d68d29e471&language=en-US")
        
        let task = URLSession.shared.dataTask(with: url!, completionHandler: {
            (data, response, error) in
            
            guard let httpResponse = response as? HTTPURLResponse
            else { return }
            
            if httpResponse.statusCode == 200 {
                
                print("Most popular resquest ok")
                
                if let safeData = data {
                    
                    do {
                        let model = try JSONDecoder().decode(GenreResposeModel.self, from: safeData)
                        DispatchQueue.main.async {
                            completion(model)
                        }
                    } catch {
                        print(error.localizedDescription)
                    }
                }
                
            } else if httpResponse.statusCode == 401 {
                print("Unauthorized")
            } else if httpResponse.statusCode == 404 {
                print("Not Found")
            }
            
        })
        task.resume()
    }
    
}

struct GenreResposeModel: Codable {
    let genres: [Genre]
}

struct Genre: Codable {
    let id: Int
    let name: String
}

