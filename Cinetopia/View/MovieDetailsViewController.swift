//
//  MovieDetailsViewController.swift
//  Cinetopia
//
//  Created by Cecilia Reis on 07/05/24.
//

import UIKit
import Kingfisher

class MovieDetailsViewController: UIViewController {
    
    private lazy var MovietitleDetailsLabel:UILabel = {
        let label = UILabel()
        label.text = movie.title
        label.textAlignment = .center
        label.numberOfLines = 0
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 30.0, weight: .bold)
        return label
    }()
    
    private lazy var MovieDetailsImage:UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 32.0
        imageView.layer.masksToBounds = true
        let url = URL(string: movie.image)
        imageView.kf.setImage(with: url)
        return imageView
    }()
    
    private lazy var MovieClassifyLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.text = "Classficação dos usuários: \(movie.rate)"
        label.font = .systemFont(ofSize: 20.0, weight: .bold)
        label.textColor = .white
        return label
    }()
    
    private lazy var MovieSinposeLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textColor = .white
        label.font = .systemFont(ofSize: 18)
        label.text = movie.synopsis
        label.textAlignment = .center
        return label
    }()
    
    var movie: Movie
    
    init(movie: Movie) {
        self.movie = movie
        super.init(nibName: nil, bundle: nil)
        }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .background
        addSubviews()
        setupContraints()
        
    }
    
    func addSubviews() {
        view.addSubview(MovietitleDetailsLabel)
        view.addSubview(MovieDetailsImage)
        view.addSubview(MovieClassifyLabel)
        view.addSubview(MovieSinposeLabel)
    }
    
    func setupContraints() {
        NSLayoutConstraint.activate([
            MovietitleDetailsLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            MovietitleDetailsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            MovietitleDetailsLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            MovieClassifyLabel.topAnchor.constraint(equalTo: MovieDetailsImage.bottomAnchor, constant: 30),
            MovieClassifyLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            MovieClassifyLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            MovieDetailsImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            MovieDetailsImage.widthAnchor.constraint(equalToConstant: 180),
            MovieDetailsImage.heightAnchor.constraint(equalToConstant: 264),
            MovieDetailsImage.topAnchor.constraint(equalTo: MovietitleDetailsLabel.bottomAnchor, constant: 32),
        
            MovieSinposeLabel.topAnchor.constraint(equalTo: MovieClassifyLabel.bottomAnchor, constant: 20),
            MovieSinposeLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            MovieSinposeLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16)
        ])
    }
    
}

 
