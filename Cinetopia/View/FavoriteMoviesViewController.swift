//
//  FavoriteMoviesViewController.swift
//  Cinetopia
//
//  Created by Cecilia Reis on 14/05/24.
//

import UIKit

class FavoriteMoviesViewController: UIViewController {
   
    
    
    //MARK: - UI Components
    
    private lazy var colletionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 27, bottom: 20, right: 27)
        let colletionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        colletionView.translatesAutoresizingMaskIntoConstraints = false
        colletionView.register(FavoriteMovieCollectionViewCell.self, forCellWithReuseIdentifier: "FavoriteMovieCollectionViewCell")
        colletionView.register(FavoriteCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "FavoriteCollectionReusableView")
        colletionView.dataSource = self
        colletionView.delegate = self
        colletionView.backgroundColor = .clear
        return colletionView
    }()
    
    //MARK:   - View life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(true, animated: true)
        view.backgroundColor = .background
        addSubviews()
        setupContrainst()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        colletionView.reloadData()
    }
    
    //MARK: - Class methods
    
    func addSubviews() {
        view.addSubview(colletionView)
    }
    
    func setupContrainst() {
        NSLayoutConstraint.activate([
            colletionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            colletionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            colletionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            colletionView.bottomAnchor.constraint(equalTo: view.bottomAnchor   )
        ])
    }
}

extension FavoriteMoviesViewController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return MovieManager.shared.favoriteMovies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FavoriteMovieCollectionViewCell", for: indexPath) as? FavoriteMovieCollectionViewCell else{
            fatalError("Error create Colletion View")
        }
        
        let currentMovie = MovieManager.shared.favoriteMovies[indexPath.item]
        cell.setupView(currentMovie)
        cell.delegate = self
        
        return cell
    }
  
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
            guard let headerView = colletionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "FavoriteCollectionReusableView", for: indexPath) as? FavoriteCollectionReusableView else {
                fatalError("Fatal Error to create colletion headar")
            }
            
            headerView.setupTitle("Meus Filmes Favoritos  ")
            
            return headerView
        }
        return UICollectionReusableView()
    }
   
}

extension FavoriteMoviesViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width/3, height: 200)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 50)
    }
}

extension FavoriteMoviesViewController: FavoriteMovieCollectionViewCellDelegate {
    func didSelectFavoriteButton(_ sender: UIButton) {
        
        guard let cell = sender.superview as? FavoriteMovieCollectionViewCell else {
            return
        }
        
        guard let indexPath = colletionView.indexPath(for: cell) else {
            return
        }
        
        let selectedMovie = MovieManager.shared.favoriteMovies[indexPath.item]
        selectedMovie.changeSelectionStatus()
        MovieManager.shared.remove(selectedMovie)
        colletionView.reloadData()
    }
}
