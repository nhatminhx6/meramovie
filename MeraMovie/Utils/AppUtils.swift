//
//  AppUtils.swift
//  MeraMovie
//
//  Created by NhatMinh on 03/09/2023.
//

import Foundation

class AppUtils {
    // save movie'id to UserDefault as Array
    class func saveToWatchList(id: Int) {
        var numbers: [Int] = AppUtils.getWatchList()
        numbers.append(id)
        print("MERA saveToWatchList  \(numbers)")
        UserDefaults.standard.set(numbers, forKey: WATCHLIST_KEY)

    }
    
    // remove movie'id watch list
    class func removeFropmWatchList(id: Int) {
        var numbers: [Int] = AppUtils.getWatchList()
        if let idx = numbers.firstIndex(of: id) {
            numbers.remove(at: idx)
            UserDefaults.standard.set(numbers, forKey: WATCHLIST_KEY)
        } else {
            print("CAN NOT REMOVE")
        }
        

    }
    
    // get watch list ids
    class func getWatchList() -> [Int]{
        let savedNumbers = UserDefaults.standard.array(forKey: WATCHLIST_KEY) as? [Int]
        return savedNumbers ?? []
    }
    
    class func checkMovieInWatchList(id: Int)-> Bool {
        var isOnWatchList: Bool = false
        let ids = AppUtils.getWatchList()
        if (ids.firstIndex(of: id) != nil) {
            isOnWatchList = true
        }
        return isOnWatchList
    }
}
