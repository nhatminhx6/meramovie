//
//  MovieService.swift
//  MeraMovie
//
//  Created by NhatMinh on 30/08/2023.
//

import Foundation


protocol MovieService {
    var dataStore : MovieDataStore { get }
   
    func getMovies(response : @escaping([MovieModel])->())
    func getMovie(by id : Int, response : @escaping(MovieModel?)->())
}



class MovieServiceImp : MovieService {
    
    var dataStore: MovieDataStore

    init(dataStore : MovieDataStore) {
        self.dataStore = dataStore
    }
    func getMovies(response: @escaping ([MovieModel]) -> ()) {
        let data = dataStore.getMovies()
        response(data)
    }
    
    func getMovie(by id: Int, response: @escaping (MovieModel?) -> ()) {
        let data = dataStore.getMovie(by: id)
        response(data)
    }
    
}
