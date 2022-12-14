//
//  MovieRepository.swift
//  MovieList
//
//  Created by Rayan MEHDI on 14/12/2022.
//

import Foundation
import RxSwift
import Alamofire


class MovieRepository {
    //MARK: - Properties
    
    var apiKey: String! 
    var baseUrl: String!
    let decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
    
    //MARK: - Initializer
    init(apiKey: String, baseUrl: String) {
        self.apiKey = apiKey
        self.baseUrl = baseUrl
    }
    
    //MARK: - Methods
    
    //TODO: Implement Error Handling
    func getPoster(forMovie movie: Movie) -> Observable<UIImage>{
        return Observable.create { obs in
            AF.request(movie.posterURL ?? "", parameters: [:]).validate()
                .response{ response in
                    switch response.result {
                    case .success(let data):
                        guard let image = data else
                        {
                            break
                        }
                        obs.onNext(UIImage(data: image)!)
                        return
                    case .failure(_):
                        return
                    }
                    
                }
            return Disposables.create()
            
        }
        
    }
    
    //TODO: Implement Error Handling
    func getMovies() -> Observable<MovieResponse> {
        
        let url = baseUrl + "/popular?api_key=\(apiKey!)"
        return Observable.create { obs in
            AF.request(url, parameters: [:]).validate()
                .responseDecodable(of: MovieResponse.self ) { response in
                    switch response.result {
                    case .success:
                        guard let data = response.data else {
                            return
                        }
                        do {
                            let movies = try self.decoder.decode(MovieResponse.self, from: data)
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
