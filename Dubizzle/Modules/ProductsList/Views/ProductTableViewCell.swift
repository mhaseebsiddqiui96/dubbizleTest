//
//  ProductTableViewCell.swift
//  Dubizzle
//
//  Created by Muhammad Haseeb Siddiqui on 4/4/22.
//

import UIKit
import SDWebImage

class ProductTableViewCell: UITableViewCell {
    
    static let identifier = "ProductTableViewCell"
    
    let productThumbnail: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .lightGray
        return imageView
    }()
    
    let productNameLabel: UILabel = {
        let label = UILabel()
        let priority = UILayoutPriority(249)
        label.setContentHuggingPriority(priority, for: .horizontal)
        return label
    }()
    
    let productPriceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .light)
        label.setContentCompressionResistancePriority(UILayoutPriority(1000), for: .horizontal)
        label.textColor = .darkGray
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier:  ProductTableViewCell.identifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        // creating container stack to hold subviews
        let stackView = UIStackView()
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.axis = .horizontal
        stackView.spacing = 8
        
        stackView.addArrangedSubview(productThumbnail)
        stackView.addArrangedSubview(productNameLabel)
        stackView.addArrangedSubview(productPriceLabel)
        
        // adding constrainst for image
        productThumbnail.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint
            .activate([
                productThumbnail.heightAnchor.constraint(equalToConstant: 50),
                productThumbnail.widthAnchor.constraint(equalToConstant: 50)
            ])

        // adding constraints for stack
        addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint
            .activate([
                stackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 8),
                stackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -8),
                stackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 8),
                stackView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -8)
            ])
        
    }
    
    func setupData(_ viewModel: ProductListItemViewModel) {
        self.productPriceLabel.text = viewModel.price
        self.productNameLabel.text = viewModel.title
        self.productThumbnail.sd_setImage(with: viewModel.imageURL)
    }
    
}
