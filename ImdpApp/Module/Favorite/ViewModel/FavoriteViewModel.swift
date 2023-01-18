//
//  FavoriteViewModel.swift
//  ImdpApp
//
//  Created by Ahmed Hamam on 07/01/2023.
//

import Foundation
import CoreData
import UIKit
class FavoriteViewModel{
    static let shared = FavoriteViewModel()
    var viewContext: NSManagedObjectContext?
    var favBindingResult : (()->()) = {}
    
    init(){
        let appdelegate = UIApplication.shared.delegate as! AppDelegate
        
        viewContext = appdelegate.persistentContainer.viewContext
        
    }
    
    
    
    
    
    
    
    func saveToCoreData(movies:Movie, viewContext:NSManagedObjectContext){
        viewContext.perform {
            let movieEntity = MovieEntity(context: viewContext)
            
            movieEntity.title = movies.title
            movieEntity.image = movies.image
            
            print("Title= \(movies.title ?? "")" )
            do {
                try viewContext.save()
            } catch {
                fatalError("Failure to save context: \(error)")
            }
            self.getSavedData()
        }
        self.favBindingResult()
    }
    
    
    func saveTVsToCoreData(tv: TVs,viewContext:NSManagedObjectContext){
        viewContext.perform {
            let tvsEntity = TVsEntity(context: viewContext)
            
            tvsEntity.title = tv.title
            tvsEntity.image = tv.image
            print(tv.title ?? "no title")
            do {
                try viewContext.save()
            } catch {
                fatalError("Failure to save context: \(error)")
            }
            self.getSavedData()
        }
        self.favBindingResult()
    }
    
    func getSavedData(){
        
        
        guard let viewContext = viewContext else {return}
        
        do{
            TopMoviesViewController.arrCoreMovies = try viewContext.fetch(MovieEntity.fetchRequest())
            print("getMovies= \( TopMoviesViewController.arrCoreMovies.count)")
        }catch{
            print(error)
        }
        do{
            
            TVsViewController.arrCoreTVs = try viewContext.fetch(TVsEntity.fetchRequest())
        }catch{
            print(error)
        }
        self.favBindingResult()
    }
    
    func findMovieInCoreData(movie: Movie)->Bool{
        guard let viewContext = viewContext else {fatalError()}
        var arrMovie = [MovieEntity]()
        do{
            arrMovie  = try viewContext.fetch(MovieEntity.fetchRequest())
            print("getMovies= \( TopMoviesViewController.arrCoreMovies.count)")
        }catch{
            print(error)
        }
        for index in arrMovie{
            if index.title == movie.title{
                return true
            }
        }
        return false
    }
    func findTVsInCoreData(tvs: TVs)->Bool{
        guard let viewContext = viewContext else {fatalError()}
        var arrTVs = [TVsEntity]()
        do{
            arrTVs  = try viewContext.fetch(TVsEntity.fetchRequest())
            print("getTVs= \( TVsViewController.arrCoreTVs.count)")
        }catch{
            print(error)
        }
        for index in arrTVs{
            if index.title == tvs.title{
                return true
            }
        }
        return false
    }
    
    
    
    
}
