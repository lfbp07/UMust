//
//  MovieDetailViewModel.swift
//  UMustApp
//
//  Created by Luis Pereira on 26/12/21.
//

import Foundation
import UIKit
import CoreData

class MovieDetailViewModel {
    init(movie: Result, poster: UIImage) {
        self.movie = movie
        self.poster = poster
    }
    
    let movie: Result
    let poster: UIImage
    var delegate: MovieDetailViewModelProtocol?
    var movieToSave: [NSManagedObject] = []
    
    func fetchGenreName() {
        GenreRequest.fetchGenreNames(completion: {genreResponse in
            genreResponse.genres.forEach({ genre in
                if self.movie.genreIDS.contains(genre.id) {
                    self.delegate?.addGenreName(genre: genre.name)
                }
            })
        })
    }
    
    func fetchVideos() {
        VideosRequest.fetchVideos(id: movie.id, completion: { videoResponde in
            videoResponde.results.forEach({ video in
                if video.site == "YouTube" {
                    self.delegate?.addVideo(id: video.key)
                }
            })
        })
    }
    
    func saveLocal(movieID: String) {
        
        guard let appDelegate =
                UIApplication.shared.delegate as? AppDelegate else {
                    return
                }
        
        let managedContext =
        appDelegate.persistentContainer.viewContext
        
        let entity =
        NSEntityDescription.entity(forEntityName: "Movie",
                                   in: managedContext)!
        
        let person = NSManagedObject(entity: entity,
                                     insertInto: managedContext)
        
        person.setValue(movieID, forKeyPath: "id")
        
        do {
            try managedContext.save()
            movieToSave.append(person)
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
    
    func fetchLocal() {
        
        guard let appDelegate =
                UIApplication.shared.delegate as? AppDelegate else {
                    return
                }
        
        let managedContext =
        appDelegate.persistentContainer.viewContext
        
        //2
        let fetchRequest =
        NSFetchRequest<NSManagedObject>(entityName: "Movie")
        
        //3
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

