//
//  MoviesPresenter.swift
//  Cinetopia
//
//  Created by Cecilia Reis on 16/05/24.
//

import UIKit

protocol MoviesPresenterToViewControllerProtocol: AnyObject{
    func setViewController(_ viewController: MoviesViewControllerToPresenterProtocol)
    func viewDidLoad()
    func viewDidAppear()
}

protocol MoviesPresenterToViewProtocol: AnyObject {
    func didSelect(movie:Movie)
    func didSelectFavoriteButton(_ movie:Movie)
    func didSearchText(_ search: UISearchBar, textDidChange searchText: String, _ movies: [Movie], _ filteredMovies: inout [Movie])
}

class MoviesPresenter: MoviesPresenterToViewControllerProtocol {
        
    //MARK: - Attributes
    
    private var controller: MoviesViewControllerToPresenterProtocol?
    private var view: MoviesViewProtocol?
    private var interactor: MoviesPresenterToInteractorProtocol?

    
    //MARK: - Init
    
    init(view: MoviesViewProtocol, interactor: MoviesPresenterToInteractorProtocol) {
        self.view = view
        self.interactor = interactor
    }
    
    //MARK: - MoviesPresenterToViewControllerProtocol
    
    func setViewController(_ viewController: MoviesViewControllerToPresenterProtocol) {
        self.controller = viewController
    }
    
    func viewDidLoad() {
        view?.setPresenter(self)
        Task {
            await fecthMovies()
        }
    }
    
    func viewDidAppear() {
        view?.reloadData() 
    }
    
    //MARK: - Class methods
    
    private func fecthMovies() async {
        do {
            guard let movies = try await interactor?.fecthMovies() else {return}
            view?.setupView(with: movies)
            view?.reloadData()
        }catch (let error) {
            print(error)
        }
    }
    
}

extension MoviesPresenter: MoviesPresenterToViewProtocol {
    func didSelect(movie: Movie) {
        controller?.didSelectMovie(movie )
    }
    
    func didSelectFavoriteButton(_ movie: Movie) {
        movie.changeSelectionStatus()
        MovieManager.shared.add(movie)
    }
    
    func didSearchText(_ search: UISearchBar, textDidChange searchText: String, _ movies: [Movie], _ filteredMovies: inout [Movie]) {
        if searchText.isEmpty{
            view?.toggle(false)
         } else {
             filteredMovies = movies.filter { movie in
                 movie.title.lowercased().contains(searchText.lowercased())
             }
             view?.toggle(true)
         }
    }
    
    
}
