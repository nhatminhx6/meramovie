//
//  MovieListViewModel.swift
//  MeraMovie
//
//  Created by NhatMinh on 30/08/2023.
//

import Foundation


enum MovieSortType {
    case title
    case releaseDate
}

protocol MovieListViewModelCoordinatorDelegate: AnyObject {
    func didTapOnMovie(movieData: MovieModel)
}

protocol MovieListViewModel{
    
    var data : [MovieModel]?{ get }
    var service : MovieService{ get }
    var coordinatorDelegate : MovieListViewModelCoordinatorDelegate?{get set}
    var title : String{ get }
    
    var showData : (()->())? { get set}
    var showLoader : (()->())?{get set}
    var hideLoader : (()->())?{get set}
    func refreshData()
    
    func didTapOnMovie(of index : Int)
    func heightForRow(at index : Int)->Int
    func numberOfRowsInSection(section : Int)->Int
    func viewDidLoad()
    
    func getMovie(at index : Int)-> MovieModel
    func sortMovie(by type : MovieSortType, completion: (()->())?   ) -> Void
}


class MovieListViewModelImp : MovieListViewModel {
  
    var data: [MovieModel]?
    var service: MovieService
    var title: String{
        return "Movies"
    }
    weak var coordinatorDelegate: MovieListViewModelCoordinatorDelegate?
    
    
    var showData: (() -> ())?
    var reloadData: (() -> ())?
    var showLoader: (() -> ())?
    var hideLoader: (() -> ())?
    
    private var shouldShowLoader = false{
        didSet{
            (self.shouldShowLoader) ? self.showLoader?() : self.hideLoader?()
        }
    }
    
    init(service : MovieService) {
        self.service = service
        shouldShowLoader = true
        self.getData()
    }
    
    func didTapOnMovie(of index: Int) {
        self.coordinatorDelegate?.didTapOnMovie(movieData: self.data![index])
    }
    
    func heightForRow(at index: Int) -> Int {
        return 140
    }
    
    func numberOfRowsInSection(section: Int) -> Int {
        return (data != nil) ? (data?.count)! : 0
    }
    func viewDidLoad() {
        (shouldShowLoader) ? self.showLoader?() : self.hideLoader?()
    }
    
    func getMovie(at index: Int) -> MovieModel {
        return self.data![index]
    }
    
    func refreshData() {
        self.getData()
    }

    func getData(){
        self.service.getMovies { [weak self](data) in
            guard let `self` = self else { return }
            self.data = data
            self.shouldShowLoader = false
            self.showData?()
        }
    }

    func sortMovie(by type: MovieSortType, completion: (() -> ())?) {
        switch type {
            case.title :
                self.data =  self.data?.sorted(by: {$0.title < $1.title})
            case.releaseDate:
                self.data =  self.data?.sorted(by: {$0.getReleaseYear() > $1.getReleaseYear()})
                
        }
        completion?()
    }

    
}
