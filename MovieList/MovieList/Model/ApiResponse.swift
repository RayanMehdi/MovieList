//
//  ApiResponse.swift
//  MovieList
//
//  Created by Rayan MEHDI on 14/12/2022.
//

import Foundation


struct MovieResponse: Decodable {
    let results: [Movie]
}
