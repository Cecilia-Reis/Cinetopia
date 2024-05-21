//
//  FavoriteCollectionReusableView.swift
//  Cinetopia
//
//  Created by Cecilia Reis on 14/05/24.
//

import UIKit

class FavoriteCollectionReusableView: UICollectionReusableView {
    
    //MARK: - UI Componentes
    
    private lazy var headerLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 28.0, weight: .bold)
        label.textColor = .white
        label.textAlignment = .left
        return label
    }()
    
    //MARK: - Life cycle View
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupTitle(_ text: String) {
        headerLabel.text = text
    }
    
    private func setupConstraints() {
        addSubview(headerLabel)
        NSLayoutConstraint.activate([
            headerLabel.topAnchor.constraint(equalTo: topAnchor),
            headerLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            headerLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            headerLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
