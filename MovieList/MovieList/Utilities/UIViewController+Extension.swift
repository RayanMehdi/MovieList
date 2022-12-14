//
//  UIViewController+Extension.swift
//  MovieList
//
//  Created by Rayan MEHDI on 14/12/2022.
//

import Foundation
import UIKit
import SwiftMessages

extension UIViewController {
    
    func showError(error: Error) {
        let view = MessageView.viewFromNib(layout: .messageView)
        view.configureTheme(.error)
        view.configureContent(body: error.localizedDescription)
        SwiftMessages.show(view: view)
    }
}


