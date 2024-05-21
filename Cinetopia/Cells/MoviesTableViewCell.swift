//
//  MoviesTableViewCell.swift
//  Cinetopia
//
//  Created by Cecilia Reis on 06/05/24.
//

import UIKit
import Kingfisher

protocol MoviesTableViewCellDelegate: AnyObject {
    func didSelectFavoriteButton(sender: UIButton)
}

class MoviesTableViewCell: UITableViewCell {

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
        label.font = .systemFont(ofSize: 20.0, weight: .bold)
        label.textColor = .white
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var movieReleseDateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 18)
        label.textColor = .white.withAlphaComponent(0.75)
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var favoriteButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        let iconImage = UIImage(systemName: "heart")?.withTintColor(.buttonBackground, renderingMode: .alwaysOriginal)
        button.setImage(iconImage, for: .normal)
        //button.addTarget(self, action: #selector(didTapFavoriteButton), for: .touchUpInside)
        return button
    }()
    
   weak var delegate: MoviesTableViewCellDelegate? 
    
    func configureCell(movie: Movie) {
        movieTitleLabel.text = movie.title
        let url = URL(string: movie.image)
        moviePosterImaveView.kf.setImage(with: url)
        movieReleseDateLabel.text = "Lançamento: \(movie.releaseDate)"
        
        let heart = UIImage(systemName: "heart")?.withTintColor(.buttonBackground,renderingMode: .alwaysOriginal)
        let heartFill = UIImage(systemName: "heart.fill")?.withTintColor(.buttonBackground,renderingMode: .alwaysOriginal)
        
        if movie.isSelected ?? false {
            favoriteButton.setImage(heartFill, for: .normal)
        } else {
            favoriteButton.setImage(heart, for: .normal)
        }
        
    }
    
    private func addSubview() {
        addSubview(moviePosterImaveView) 
        addSubview(movieTitleLabel)
        addSubview(movieReleseDateLabel)
        contentView.addSubview(favoriteButton)
    }
    
    private func setupContranits(){
        NSLayoutConstraint.activate([
            moviePosterImaveView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            moviePosterImaveView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            moviePosterImaveView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
            moviePosterImaveView.widthAnchor.constraint(equalToConstant: 100),
           
            movieTitleLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -16),
            movieTitleLabel.leadingAnchor.constraint(equalTo: moviePosterImaveView.trailingAnchor, constant: 16),
            movieTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            movieReleseDateLabel.topAnchor.constraint(equalTo: movieTitleLabel.bottomAnchor, constant: 8),
            movieReleseDateLabel.leadingAnchor.constraint(equalTo: moviePosterImaveView.trailingAnchor, constant: 16),
            
            favoriteButton.topAnchor.constraint(equalTo: movieReleseDateLabel.bottomAnchor, constant: 8),
            favoriteButton.leadingAnchor.constraint(equalTo: moviePosterImaveView.trailingAnchor, constant: 16),
            favoriteButton.heightAnchor.constraint(equalToConstant: 25),
            favoriteButton.widthAnchor.constraint(equalToConstant: 25)
        ])
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview()
        setupContranits()
        backgroundColor = .background
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    @objc
    func didTapFavoriteButton(sender: UIButton) {
        delegate?.didSelectFavoriteButton(sender: sender)
    }

}
