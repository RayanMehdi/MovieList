//
//  MovieRepository.swift
//  MovieList
//
//  Created by Rayan MEHDI on 14/12/2022.
//

import Foundation
import RxSwift
import Alamofire

let decoder: JSONDecoder = {
    let decoder = JSONDecoder()
    decoder.keyDecodingStrategy = .convertFromSnakeCase
    return decoder
}()

enum MovieApiError :Int, Error {
    case unAuthorized = 401
    case notFound = 404
    
}


class MovieRepository {
    
    let apiKey = "623b49dece629025a2b1ae6ccc0dc079"
    let baseUrl = "https://api.themoviedb.org/3/movie"
    
    
    func getPoster(forMovie movie: Movie) -> Observable<UIImage>{
        let parameters = ["api_key": apiKey]
        return Observable.create { obs in
            AF.request(movie.posterURL ?? "", parameters: parameters).validate()
                .response{ response in
                    switch response.result {
                    case .success(let data):
                        guard let image = data else
                        {
                            break
                        }
                        obs.onNext(UIImage(data: image)!)
                        return
                    case .failure(let error):
                        return
                    }
                    
                }
            return Disposables.create()
            
        }
        
    }
    
    func getMovies() -> Observable<MovieResponse> {
        let parameters = ["api_key": apiKey]
        let url = baseUrl + "/popular?api_key=\(apiKey)"
        return Observable.create { obs in
            AF.request(url, parameters: parameters).validate()
                .responseDecodable(of: MovieResponse.self ) { response in
                    switch response.result {
                    case .success:
                        guard let data = response.data else {
                            return
                        }
                        do {
                            let movies = try decoder.decode(MovieResponse.self, from: data)
                            obs.onNext(movies)
                        } catch {
                            obs.onError(error)
                        }
                    case .failure(let error):
                        if let statusCode = response.response?.statusCode,
                           let reason = MovieApiError(rawValue: statusCode)
                        {
                            obs.onError(reason)
                        }
                        obs.onError(error)
                    }
                }
            return Disposables.create()
            
        }
        
    }
    
}
