//
//  FavoriteMovieViewController.swift
//  Cinetopia
//
//  Created by Cecilia Reis on 14/05/24.
//

import UIKit

protocol FavoriteMovieCollectionViewCellDelegate: AnyObject{
    func didSelectFavoriteButton(_ sender: UIButton)
}

class FavoriteMovieCollectionViewCell: UICollectionViewCell {
    
    //MARK: - UI Componentes
        
    private lazy var moviePosterImaveView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 12
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    private lazy var movieTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.textColor = .white
        label.textAlignment = .center  
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var favoriteButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        let iconImage = UIImage(systemName: "heart.fill")?.withTintColor(.buttonBackground, renderingMode: .alwaysOriginal)
        button.setImage(iconImage, for: .normal)
        button.addTarget(self, action: #selector(didTapFavoriteButton), for: .touchUpInside)
        return button
    }()
    
    weak var delegate: FavoriteMovieCollectionViewCellDelegate?
    
    //MARK: - View life cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        setupContraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Class methods
    
    func addSubviews() {
        addSubview(moviePosterImaveView)
        addSubview(movieTitleLabel)
        addSubview(favoriteButton)
    }
    
    func setupContraints() {
        moviePosterImaveView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        moviePosterImaveView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        moviePosterImaveView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        moviePosterImaveView.heightAnchor.constraint(equalToConstant: 140).isActive = true
        
        movieTitleLabel.topAnchor.constraint(equalTo: moviePosterImaveView.bottomAnchor, constant: 12).isActive = true
        movieTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        movieTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        
        favoriteButton.topAnchor.constraint(equalTo: movieTitleLabel.bottomAnchor, constant: 7).isActive = true
        favoriteButton.heightAnchor.constraint(equalToConstant: 25).isActive = true
        favoriteButton.widthAnchor.constraint(equalToConstant: 25).isActive = true
        favoriteButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    }

    func setupView(_ movie: Movie) {
        let url = URL(string: movie.image)
        moviePosterImaveView.kf.setImage(with: url)
        
        movieTitleLabel.text = movie.title
  }
    
    // MARK: - IBAction

    @objc
    func didTapFavoriteButton(_ sender: UIButton) {
        delegate?.didSelectFavoriteButton(sender)
    }
}
