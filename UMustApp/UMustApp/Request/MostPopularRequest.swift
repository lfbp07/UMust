//
//  MostPopularRequest.swift
//  UMustApp
//
//  Created by Luis Pereira on 25/12/21.
//

import Foundation

class MostPopularRequest {
    public class func fetchMostPopular(completion: @escaping ((MostPopularResponseModel) -> Void)) {
        
        let url:URL? = URL(string: "https://api.themoviedb.org/3/movie/popular?api_key=205e6b399ee3b7f57ff808d68d29e471&language=en-US&page=1")
        
        let task = URLSession.shared.dataTask(with: url!, completionHandler: {
            (data, response, error) in
            
            guard let httpResponse = response as? HTTPURLResponse
            else { return }
            
            if httpResponse.statusCode == 200 {
                
                if let safeData = data {
                    
                    do {
                        let model = try JSONDecoder().decode(MostPopularResponseModel.self, from: safeData)
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
    
    public class func downloadPoster(path: String, completion: @escaping ((Data) -> Void)) {
        let url:URL? = URL(string: "https://image.tmdb.org/t/p/original/\(path)")
        
        let task = URLSession.shared.dataTask(with: url!, completionHandler: {
            (data, response, error) in
            
            guard let httpResponse = response as? HTTPURLResponse
            else { return }
            
            if httpResponse.statusCode == 200 {
                
                if let safeData = data {
                    DispatchQueue.main.async {
                        completion(safeData)
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

