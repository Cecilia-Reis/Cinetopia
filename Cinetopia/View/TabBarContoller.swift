//
//  TabBarContoller.swift
//  Cinetopia
//
//  Created by Cecilia Reis on 15/05/24.
//

import UIKit

class TabBarContoller: UITabBarController {
    // MARK: - View life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBarContoller()
        self.navigationItem.setHidesBackButton(true, animated: true   )
    }

    //MARK: - Class methods
    
    private func setupTabBarContoller() {
        let view = MoviesView()
        let interactor = MoviesInteractor()
        let presenter = MoviesPresenter(view: view, interactor: interactor)
        let home = UINavigationController(rootViewController: MoviesViewController(view: view, presenter: presenter))
        let symbolConfiguration = UIImage.SymbolConfiguration(scale: .medium)
        
        let homeSymbol = UIImage(systemName: "film", withConfiguration: symbolConfiguration)
        home.tabBarItem.image = homeSymbol
        home.tabBarItem.title = "Filmes Populares"
        
        let favorite = UINavigationController(rootViewController: FavoriteMoviesViewController())
        let symbolheart = UIImage(systemName: "heart",withConfiguration: symbolConfiguration)
        favorite.tabBarItem.image = symbolheart
        favorite.tabBarItem.title = "Favoritos"
        
        self.setViewControllers([home, favorite], animated: true)
    }

}
