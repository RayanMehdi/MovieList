//
//  RepositoryAssembly.swift
//  MovieList
//
//  Created by Rayan MEHDI on 14/12/2022.
//

import Foundation
import Swinject
import RxRelay
import RxSwift

class RepositoryAssembly: Assembly {
    func assemble(container: Container) {
        container.register(MovieRepository.self) { _ in
            MovieRepository(apiKey: "623b49dece629025a2b1ae6ccc0dc079", baseUrl: "https://api.themoviedb.org/3/movie")
        }.inObjectScope(.container)
    }
}
