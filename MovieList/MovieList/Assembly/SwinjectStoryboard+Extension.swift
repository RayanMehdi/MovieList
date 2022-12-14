//
//  SwinjectStoryboard+Extension.swift
//  MovieList
//
//  Created by Rayan MEHDI on 14/12/2022.
//

import Foundation
import Swinject
import SwinjectStoryboard
import RxSwift

extension SwinjectStoryboard {
    @objc class func setup() {

        defaultContainer.storyboardInitCompleted(MovieListViewController.self) { _ , c in
            c.viewModel = Assembler.sharedAssembler.resolver.resolve(MovieListViewModel.self)!
            c.disposeBag = DisposeBag()
        }
    }
}
