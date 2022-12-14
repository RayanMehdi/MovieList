//
//  Movie.swift
//  MovieList
//
//  Created by Rayan MEHDI on 14/12/2022.
//

import Foundation

struct Movie: Decodable, Equatable, Identifiable {
    let id: Int?
    let title: String?
    let overview: String?
    let posterPath: String?
    var posterURL: URL? {
        URL(string: "https://image.tmdb.org/t/p/w400/\(posterPath ?? "")")!
    }
}


