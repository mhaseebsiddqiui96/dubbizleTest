//
//  UIView+Extensions.swift
//  Dubizzle
//
//  Created by Muhammad Haseeb Siddiqui on 4/4/22.
//

import UIKit

public extension UIView {
 
    func addSubviewAndPinEdges(_ child: UIView) {
        addSubview(child)
        child.pinEdges(to: self)
    }

    func pinEdges(to other: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        leadingAnchor.constraint(equalTo: other.safeAreaLayoutGuide.leadingAnchor).isActive = true
        trailingAnchor.constraint(equalTo: other.safeAreaLayoutGuide.trailingAnchor).isActive = true
        topAnchor.constraint(equalTo: other.safeAreaLayoutGuide.topAnchor).isActive = true
        bottomAnchor.constraint(equalTo: other.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
}
