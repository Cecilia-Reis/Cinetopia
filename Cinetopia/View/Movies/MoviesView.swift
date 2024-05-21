//
//  MoviesView.swift
//  Cinetopia
//
//  Created by Cecilia Reis on 16/05/24.
//

import UIKit

protocol MoviesViewProtocol: AnyObject {
    func setPresenter(_ presenter: MoviesPresenterToViewProtocol?)
    func setupView(with movies: [Movie])
    func reloadData()
    func reloadRow(at indexPath: IndexPath)
    func toggle(_ isActive:Bool)
}

class MoviesView: UIView {
    
    //MARK: - Attibutes
    private var filteredMovies: [Movie] = []
    private var isSearchActive: Bool = false
    private var movies:[Movie] = []

    private var presenter: MoviesPresenterToViewProtocol?

    //MARK: - UI Componets
    
    private lazy var moviesTable: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .clear
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(MoviesTableViewCell.self, forCellReuseIdentifier: "MoviesCell")
        return tableView
    }()
    
    private(set) lazy var searchBar:UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.placeholder = "Pesquisar"
        searchBar.searchTextField.backgroundColor = .white
        searchBar.delegate = self
        return searchBar
    }()
    
    //MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .background
        addSubViews()
        setupContraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Class methods 
    
    private func addSubViews() {
        addSubview(moviesTable)
    }
    
    private func setupContraints() {
        NSLayoutConstraint.activate([
            moviesTable.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            moviesTable.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            moviesTable.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            moviesTable.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor)
        ])
    }
}

extension MoviesView: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return isSearchActive ? filteredMovies.count : movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "MoviesCell", for: indexPath) as? MoviesTableViewCell {
            let movie = isSearchActive ? filteredMovies[indexPath.row] : movies[indexPath.row]
            cell.configureCell(movie: movie)
            cell.delegate = self
            cell.selectionStyle = .none
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let movie = isSearchActive ? filteredMovies[indexPath.row] : movies[indexPath.row]
        presenter?.didSelect(movie: movie)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        160
    }
}

extension MoviesView: MoviesTableViewCellDelegate {
    func didSelectFavoriteButton(sender: UIButton) {
        guard let cell = sender.superview?.superview as? MoviesTableViewCell else {
            return
        }
        
        guard let indexPath = moviesTable.indexPath(for: cell) else {
            return
        }
        
        let selectedMovie = movies[indexPath.row]
        presenter?.didSelectFavoriteButton(selectedMovie)
        moviesTable.reloadRows(at: [indexPath], with: .automatic)
        
    }
}

extension MoviesView: MoviesViewProtocol {
    func setPresenter(_ presenter: MoviesPresenterToViewProtocol?) {
        self.presenter = presenter
    }
    

    func setupView(with movies: [Movie]) {
        self.movies = movies
    }
    
    func reloadData() {
        DispatchQueue.main.async {
            self.moviesTable.reloadData()
        }
    }
        
    func reloadRow(at indexPath: IndexPath) {
        moviesTable.reloadRows(at: [indexPath], with: .automatic)
    }
    
    func toggle(_ isActive: Bool) {
        self.isSearchActive = isActive
    }
    

}

extension MoviesView: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        presenter?.didSearchText(searchBar, textDidChange: searchText, movies, &filteredMovies)
        moviesTable.reloadData()
    }
}
