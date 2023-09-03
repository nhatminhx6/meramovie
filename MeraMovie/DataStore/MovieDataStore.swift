//
//  DataStore.swift
//  MeraMovie
//
//  Created by NhatMinh on 29/08/2023.
//

import Foundation
import UIKit

protocol MovieDataStore {
    func getMovies()->[MovieModel]
    func getMovie(by id : Int)->MovieModel?
}

final class MovieDataStoreImp : MovieDataStore{

    
    private let movies: [MovieModel] = [
        MovieModel(id: 1, title: "Tenet", description: "Armed with only one word, Tenet, and fighting for the survival of the entire world, a Protagonist journeys through a twilight world of international espionage on a mission that will unfold in something beyond real time", rating: 7.8, duration: "2h 30 min", genre: "Action, Sci-Fi", releasedDate: "3 September 2020", trailerUrl: "​https://www.youtube.com/watch?v=LdOM0x0XDMo", thumbnail: UIImage(named: "Tenet")!, fakeTimeStamp: 1598918400 ),
        MovieModel(id: 2, title: "Spider-Man", description: "Teen Miles Morales becomes the Spider-Man of his universe, and must join with five spider-powered individuals from other dimensions to stop a threat for all realities", rating: 8.4, duration: "1h 57min", genre: "Action, Animation, Adventure", releasedDate: "14 December 2018", trailerUrl: "​​https://www.youtube.com/watch?v=tg52up16eq0", thumbnail: UIImage(named: "Spider_Man")!, fakeTimeStamp: 1543622400),
        MovieModel(id: 3, title: "Knives Out", description: "A detective investigates the death of a patriarch of an eccentric, combative family.", rating: 7.9, duration: "2h 10min", genre: "Comedy, Crime, Drama", releasedDate: "27 November 2019", trailerUrl: "​​​ ​https://www.youtube.com/watch?v=qGqiHJTsRkQ", thumbnail: UIImage(named: "Knives_Out")!, fakeTimeStamp: 1572566400),
        MovieModel(id: 4, title: "Guardians of the Galaxy", description: "A group of intergalactic criminals must pull together to stop a fanatical warrior with plans to purge the universe", rating:8.0, duration: "22h 1min", genre: "Action, Adventure, Comedy", releasedDate: "1 August 2014", trailerUrl: "​​​ ​https://www.youtube.com/watch?v=d96cjJhvlMA", thumbnail: UIImage(named: "Guardians_of_The_Galaxy")!, fakeTimeStamp: 1414800000),
        MovieModel(id: 5, title: "Age of Ultron", description: "When Tony Stark and Bruce Banner try to jump-start a dormant peacekeeping program called Ultron, things go horribly wrong and it's up to Earth's mightiest heroes to stop the villainous Ultron from enacting his terrible plan", rating:7.3, duration: "2h 21min", genre: "Action, Adventure, Sci-Fi", releasedDate: "1 May 2015", trailerUrl: "​​​ ​https://www.youtube.com/watch?v=d96cjJhvlMA", thumbnail: UIImage(named: "Avengers")!, fakeTimeStamp: 1430438400)
    ]
    
    func getMovies() -> [MovieModel] {
        return movies
    }
    
    func getMovie(by id: Int) -> MovieModel? {
        return (id <= (movies.count - 1) && id >= 0 ) ? movies[id] : nil
    }
    

    
    
}
