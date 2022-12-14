//
//  Assembler+Extension.swift
//  MovieList
//
//  Created by Rayan MEHDI on 14/12/2022.
//

import Foundation
import Swinject

extension Assembler {
    static let sharedAssembler: Assembler = {
        var container = Container()
        var assembler = Assembler([
            ViewModelAssembly(),
            RepositoryAssembly()
        ], container: container)
        
        return assembler
    }()
}
