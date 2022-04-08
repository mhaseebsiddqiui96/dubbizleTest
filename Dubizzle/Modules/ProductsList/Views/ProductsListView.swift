//
//  ProductsListView.swift
//  Dubizzle
//
//  Created by Muhammad Haseeb Siddiqui on 4/4/22.
//

import UIKit

typealias ProductsListInterfaceView = ProductsListInterface & UIView

protocol ProductsListInterface: AnyObject {
    func showActivityIndicator()
    func hideActivityIndicator()
    func setDataSourceAndDelegateForProductsTableView(_ source: UITableViewDataSource & UITableViewDelegate)
    func reloadListOfProducts()
    func showError(with message: String)
}

class ProductsListView: UIView, ProductsListInterface {

    // views
    let productsTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(
            ProductTableViewCell.self,
            forCellReuseIdentifier: ProductTableViewCell.identifier
        )
        tableView.accessibilityIdentifier = UIElementsIdentifiers.ProductList.initialProductsTableView
        return tableView
    }()
    
    var activityView: UIActivityIndicatorView!
    
    init() {
        super.init(frame: .zero)
        addProductsTableView()
        addAcitivityIndicator()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //
    private func addProductsTableView() {
        addSubviewAndPinEdges(productsTableView)
    }
    
    func setDataSourceAndDelegateForProductsTableView(_ source: UITableViewDataSource & UITableViewDelegate) {
        productsTableView.dataSource = source
        productsTableView.delegate = source
        
    }
    
    func reloadListOfProducts() {
        productsTableView.reloadData()
        productsTableView.accessibilityIdentifier = UIElementsIdentifiers.ProductList.finalProductsTableView
    }
    
    
    func addAcitivityIndicator() {
        activityView = UIActivityIndicatorView(style: .large)
        
        addSubview(activityView)
        activityView?.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([activityView.centerXAnchor.constraint(equalTo: centerXAnchor),
                                     activityView.centerYAnchor.constraint(equalTo: centerYAnchor)])
        activityView.accessibilityIdentifier = UIElementsIdentifiers.ProductList.showLoader

    }
    
    func showActivityIndicator() {
        
        activityView?.startAnimating()
    }

    func hideActivityIndicator(){
        if (activityView != nil){
            activityView?.stopAnimating()
        }
    }
    
    func showError(with message: String) {
        
    }
    
}
