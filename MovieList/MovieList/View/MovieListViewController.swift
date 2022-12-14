//
//  ViewController.swift
//  MovieList
//
//  Created by Rayan MEHDI on 14/12/2022.
//

import UIKit
import RxSwift
import RxCocoa

class MovieListViewController: UIViewController {
    
    //MARK: - Properties
    
    var viewModel = MovieListViewModel()
    let disposeBag = DisposeBag()
    
    //MARK: - Outltets
    
    @IBOutlet weak var movieListTableView: UITableView!
    
    //MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTableViewDatasource()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.getMovies()
    }
    

    
}

//MARK: - Rx Setup

extension MovieListViewController {
    
    func setUpTableViewDatasource() {
        
        viewModel.movies
            .bind(to: movieListTableView
                .rx
                .items(cellIdentifier: "MovieListCell", cellType: MovieListCell.self)) { row, movie, cell in
                    cell.configureWithMovie(movie)
                }
                .disposed(by: disposeBag)
        

    }
}

//MARK: - tableview datasource

extension MovieListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieListCell", for: indexPath) as! MovieListCell
        
        cell.titleLabel.text = "TEST"
        
        return cell
    }
}
