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
    
    //MARK: - Properties
    var movies: BehaviorRelay<[MovieWithPoster]>!
    var movieRepository: MovieRepository!
    var disposeBag: DisposeBag!
    
    //TODO: Add error and loading observables
    
    //MARK: - Initializer
    init(movies: BehaviorRelay<[MovieWithPoster]>, movieRepository: MovieRepository, disposeBag: DisposeBag) {
        self.movies = movies
        self.movieRepository = movieRepository
        self.disposeBag = disposeBag
    }
    
    //MARK: - Methods
    
    func getMovies() {
        movieRepository.getMovies().subscribe(onNext: { [unowned self] response in
            for moviesResponse in response.results {
                movieRepository.getPoster(forMovie: moviesResponse).subscribe(onNext: { [unowned self] imageResponse in
                    let newMovie = MovieWithPoster(movie: moviesResponse, poster: imageResponse)
                    let newValue = movies.value + [newMovie]
                    movies.accept(newValue)
                    
                })
                .disposed(by: disposeBag)
            }
        }).disposed(by: disposeBag)
    }
    
    
    
}
