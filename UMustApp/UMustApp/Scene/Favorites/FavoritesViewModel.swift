

import Foundation
import UIKit
import CoreData

class FavoritesViewModel {
    
    var delegate: FavoriteViewModelProtocol?
    var movieToSave: [NSManagedObject] = []
    
    func fetchMovies() {
        for obj in movieToSave {
            if let movieID = obj.value(forKey: "id") as? String {
                MovieRequest.fetchMovie(id: movieID, completion: { movie, statusCode in
                    if statusCode == 200 {
                        let result = FavoriteResult(id: movie?.id ?? 0, originalTitle: movie?.originalTitle ?? "", overview: movie?.overview ?? "", posterPath: movie?.posterPath ?? "", releaseDate: movie?.releaseDate ?? "", genreIDS: movie?.genres ?? [])
                        self.delegate?.updateCellWithText(model: result)
                    } else if statusCode == 401 {
                        self.delegate?.showErrorAlert(message: "401 Unauthorized")
                    } else if statusCode == 404 {
                        self.delegate?.showErrorAlert(message: "404 Not Found")
                    } else {
                        self.delegate?.showErrorAlert(message: "Unexpected error")
                    }
                })
            }
        }
        
    }
    
    func downLoadPoster(path: String, id: Int) {
        MostPopularRequest.downloadPoster(path: path, completion: {
            data in
            self.delegate?.updateCellWithImage(data: data, id: id)
        })
    }
    
    func fetchLocal() {
        
        guard let appDelegate =
                UIApplication.shared.delegate as? AppDelegate else {
                    return
                }
        
        let managedContext =
        appDelegate.persistentContainer.viewContext
        
        let fetchRequest =
        NSFetchRequest<NSManagedObject>(entityName: "Movie")
        
        do {
            movieToSave = try managedContext.fetch(fetchRequest)
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
    }
    
    func deleteLocalData(movieID: String) {
        
        guard let appDelegate =
                UIApplication.shared.delegate as? AppDelegate else {
                    return
                }
        
        let managedContext =
        appDelegate.persistentContainer.viewContext
        
        let obj = movieToSave.first(where: { movie in
            if let id = movie.value(forKey: "id") as? String {
                return id == movieID
            }
            return false
        })
        
        if let deleteObj = obj {
            managedContext.delete(deleteObj)
        }
        
        do{
            try managedContext.save()
        }
        catch{
            print(error.localizedDescription)
        }
        
    }
    
    func cleanLocalData() {
        fetchLocal()
        guard let appDelegate =
                UIApplication.shared.delegate as? AppDelegate else {
                    return
                }
        
        let managedContext =
        appDelegate.persistentContainer.viewContext
        
        for obj in movieToSave {
            managedContext.delete(obj)
        }
        
        do{
            try managedContext.save()
        }
        catch{
            print(error.localizedDescription)
        }
        
    }
}
