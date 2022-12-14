//
//  ViewModelAssembly.swift
//  MovieList
//
//  Created by Rayan MEHDI on 14/12/2022.
//

import Foundation
import Swinject
import RxRelay
import RxSwift


class ViewModelAssembly: Assembly {
    func assemble(container: Container) {
        container.register(MovieListViewModel.self) { r in
            MovieListViewModel(movies: BehaviorRelay<[MovieWithPoster]>(value: []), movieRepository: r.resolve(MovieRepository.self)!, disposeBag: DisposeBag())
        }.inObjectScope(.container)
    }
}
