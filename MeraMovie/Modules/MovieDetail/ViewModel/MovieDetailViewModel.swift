//
//  MovieDetailViewModel.swift
//  MeraMovie
//
//  Created by NhatMinh on 02/09/2023.
//

import Foundation

protocol MovieDetailViewModel {
    var data : MovieModel{ get }
    var title : String{ get }
    var showData : ((MovieModel, Bool)->())?{ get set }
    var stausChanged : ((Bool)->())?{ get set }
    func viewDidLoad()
    var isOnWatchList: Bool {get set}
    func addOrRemoveToWatchList()

}

class MovieDetailViewModelImp : MovieDetailViewModel{
    var data: MovieModel
    var isOnWatchList: Bool
    var title: String{
        return data.title
    }
    var showData: ((MovieModel, Bool) -> ())?
    var stausChanged: ((Bool) -> ())?
    init(data : MovieModel) {
        self.data = data
        self.isOnWatchList = false
        self.isOnWatchList =  AppUtils.checkMovieInWatchList(id: data.id)
    }
   
    func viewDidLoad() {
        self.showData?(self.data, isOnWatchList)
        self.stausChanged?(self.isOnWatchList)
    }
    
    func addOrRemoveToWatchList() {
        
        if self.isOnWatchList {
            AppUtils.removeFropmWatchList(id:self.data.id )
            self.isOnWatchList = false
        } else {
            AppUtils.saveToWatchList(id: self.data.id)
            self.isOnWatchList = true
            
        }
        
        self.stausChanged?(self.isOnWatchList)
        
    }
    
 
}
