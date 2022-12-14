//
//  MovieListErrors.swift
//  MovieList
//
//  Created by Rayan MEHDI on 14/12/2022.
//

import Foundation

enum MovieApiError :Int, Error {
    case unAuthorized = 401
    case notFound = 404
}

