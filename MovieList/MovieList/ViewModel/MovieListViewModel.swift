//
//  MovieListViewModel.swift
//  MovieList
//
//  Created by Rayan MEHDI on 14/12/2022.
//

import Foundation
import RxSwift
import RxCocoa

class MovieListViewModel {
    
    let movies: BehaviorRelay<[Movie]> = BehaviorRelay(value: [])
    let movieRepository: MovieRepository! = MovieRepository()
    let disposeBad = DisposeBag()
    
    
    func getMovies() {
        movieRepository.getMovies().subscribe(onNext: { [unowned self] response in
            movies.accept(response.results)            
        }).disposed(by: disposeBad)
    }
    
    
    
}
