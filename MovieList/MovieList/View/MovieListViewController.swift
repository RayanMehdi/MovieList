//
//  ViewController.swift
//  MovieList
//
//  Created by Rayan MEHDI on 14/12/2022.
//

import UIKit
import RxSwift
import RxCocoa
import Swinject

class MovieListViewController: UIViewController {
    
    //MARK: - Properties
    
    var viewModel : MovieListViewModel!
    var disposeBag : DisposeBag!
    
    //MARK: - Init
    init(viewModel: MovieListViewModel, disposeBag: DisposeBag) {
        self.viewModel = viewModel
        self.disposeBag = disposeBag
        super.init(nibName: "MovieListViewController", bundle: .main)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
       // fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Outltets
    
    @IBOutlet weak var movieListTableView: UITableView!
    
    //MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTableViewDatasource()
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

