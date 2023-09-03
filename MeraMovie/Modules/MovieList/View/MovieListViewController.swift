//
//  MovieListViewController.swift
//  MeraMovie
//
//  Created by NhatMinh on 31/08/2023.
//

import Foundation
import UIKit


class MovieListViewController: UIViewController {
    
    var viewModel: MovieListViewModel!
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = self.viewModel.title
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(UINib(nibName: "MovieTableViewCell", bundle: nil), forCellReuseIdentifier: "MovieTableViewCell")
        self.viewModel.viewDidLoad()
        self.bindDataOnTableView()
        
        let sort = UIBarButtonItem(title: "Sort", style: .plain, target: self, action: #selector(sortAction))
        navigationItem.rightBarButtonItems = [sort]
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.viewModel.refreshData()
        self.bindDataOnTableView()
    }
    
  
    @objc func sortAction() {
        let alert = UIAlertController(title: "", message: "Please select an option to sort movies", preferredStyle: .actionSheet)
        
        alert.addAction(UIAlertAction(title: "Title", style: .default , handler:{ (UIAlertAction)in
            self.viewModel.sortMovie(by: .title) {
                self.tableView.reloadData()
            }
        }))
        
        alert.addAction(UIAlertAction(title: "Release date", style: .default , handler:{ (UIAlertAction)in
            self.viewModel.sortMovie(by: .releaseDate) {
                self.tableView.reloadData()
            }
        }))
        self.present(alert, animated: true, completion: nil)
        
    }
    
    private func bindDataOnTableView(){
        self.viewModel?.showData = { [weak self] in
            guard let `self` = self else { return }
            self.tableView.reloadData()
        }
    }
    
    
    
}

extension MovieListViewController : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection(section: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MovieTableViewCell") as! MovieTableViewCell? else {
            fatalError()
        }
        let movie = self.viewModel.getMovie(at: indexPath.row)
        cell.setupData(movie: movie)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(self.viewModel.heightForRow(at: indexPath.row))
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.viewModel.didTapOnMovie(of: indexPath.row)
    }
}
