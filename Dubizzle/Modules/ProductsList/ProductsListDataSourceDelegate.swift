//
//  ProductsListDataSourceDelegate.swift
//  Dubizzle
//
//  Created by Muhammad Haseeb Siddiqui on 4/6/22.
//

import Foundation
import UIKit

class ProductListDatasourceAndDelegate: NSObject {

    private var models: [ProductListItemViewModel] = []

    func setModels(_ models: [ProductListItemViewModel]) {
        self.models = models
    }
}

extension ProductListDatasourceAndDelegate: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: ProductTableViewCell.identifier, for: indexPath) as! ProductTableViewCell
        
        let viewModel = self.models[indexPath.row]
        
        cell.setupData(viewModel)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.models[indexPath.row].cellTapped?()
    }
}
