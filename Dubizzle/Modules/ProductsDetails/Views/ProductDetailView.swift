//
//  ProductDetailView.swift
//  Dubizzle
//
//  Created by Muhammad Haseeb Siddiqui on 4/5/22.
//

import UIKit
import SDWebImage

typealias ProductDetailInterfaceView = ProductDetailInterface & UIView


protocol ProductDetailInterface: AnyObject {
    func setupData(_ viewModel: ProductDetailViewModel)
}


class ProductDetailView: UIView, ProductDetailInterface {

    let productImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .lightGray
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let titleLabel: UILabel = {
       let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        label.numberOfLines = 0
        return label
    }()
    
    
    let priceLabel: UILabel = {
       let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        return label
    }()
    
    
    let postedOnLabel: UILabel = {
       let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        return label
    }()
    
    init() {
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setupView() {
        // creating container stack to hold subviews
        let view = UIView()
        view.backgroundColor = .white
        
        addSubviewAndPinEdges(view)
        
        let stackView = UIStackView()
        stackView.alignment = .leading
        stackView.distribution = .fill
        stackView.axis = .vertical
        stackView.spacing = 8
        
        stackView.addArrangedSubview(productImageView)
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(priceLabel)
        stackView.addArrangedSubview(postedOnLabel)
        stackView.addArrangedSubview(UIView())
        
        // adding constraints for stack
        view.addSubviewAndPinEdges(stackView)
        
        // adding constrainst for image
        productImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint
            .activate([
                productImageView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.3),
                productImageView.widthAnchor.constraint(equalTo: view.widthAnchor)
            ])

   
        
    }
    
    func setupData(_ viewModel: ProductDetailViewModel) {
        productImageView.sd_setImage(with: viewModel.imageURL)
        priceLabel.text = viewModel.price
        titleLabel.text = viewModel.title
        postedOnLabel.text = viewModel.postedOn
    }
    
}
