//
//  UINavigationController+Extensions.swift
//  Dubizzle
//
//  Created by Muhammad Haseeb Siddiqui on 4/7/22.
//

import UIKit

extension UINavigationController {
    func setAppNavigationColor() {
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .white
        appearance.titleTextAttributes = [.foregroundColor: UIColor.darkText]
        
        
        self.navigationBar.tintColor = .darkText
        self.navigationBar.standardAppearance = appearance
        self.navigationBar.compactAppearance = appearance
        self.navigationBar.scrollEdgeAppearance = appearance
        self.navigationBar.isTranslucent = false
    }
}

