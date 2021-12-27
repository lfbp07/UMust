//
//  MovieRequest.swift
//  UMustApp
//
//  Created by Luis Pereira on 26/12/21.
//

import Foundation

class MovieRequest {
    public class func fetchMovie(id: String,completion: @escaping ((MovieDataModel) -> Void))
    {
        
        let url:URL? = URL(string: "https://api.themoviedb.org/3/movie/\(id)?api_key=205e6b399ee3b7f57ff808d68d29e471&language=en-US")
        
        let task = URLSession.shared.dataTask(with: url!, completionHandler: {
            (data, response, error) in
            
            guard let httpResponse = response as? HTTPURLResponse
            else { return }
            
            if httpResponse.statusCode == 200 {
                
                if let safeData = data {
                    
                    do {
                        let model = try JSONDecoder().decode(MovieDataModel.self, from: safeData)
                        DispatchQueue.main.async {
                            completion(model)
                        }
                    } catch {
                        print(error.localizedDescription + " erro aqui")
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

