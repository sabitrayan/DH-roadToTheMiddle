//
//  PopularViewController.swift
//  Diplom
//
//  Created by ryan on 22.11.2021.
//

import Foundation
import UIKit
import CoreData

class PopularViewController: BaseListController, UICollectionViewDelegateFlowLayout, UISearchBarDelegate {

//    MARK:- Identifier Cell
    fileprivate let cellId = "id1234"



//    MARK: - DataBaseLocal
    let database = DatabaseHandler.shared

//    MARK: - Reload collectionView
    var movies : [Popular]? {
        didSet {
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }

        }
    }

//   MARK: - SearchBar Message to the data not appareance
    fileprivate let searchController = UISearchController(searchResultsController: nil)
    fileprivate let enterSearchTermLabel: UILabel = {
            let label = UILabel()
            label.text  = "Please enter your movie Search"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()

//    MARK: - ViewDidLoad CollectionsViews
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
//        Allow register identifier cell
        collectionView.register(PopularViewCell.self, forCellWithReuseIdentifier: cellId)
        setupSearchBar()
        NetworkServicesCoreData()
        fetchDataToCoreData()

    }

//    MARK: - setupSearchBar
    fileprivate func setupSearchBar() {
        definesPresentationContext = true
        navigationItem.searchController = self.searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.delegate = self
    }

//    MARK: - Action to reloadTime Searching
    //    timer to reload data
        var timer: Timer?

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)

        //        Introduce some delay before performing the searh
        //        throttling the search
                timer?.invalidate()

        timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false, block: { (_) in
            self.movies = self.database.fetchSearch(search: searchText, Popular.self, entityName: "Popular")
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }

        })

    }


//    MARK:- Save Data to Api to Core Data Model
    func NetworkServicesCoreData() {
        NetworkServiesMovies.shared.sycnPopular(searchTerm: "popular") {
            self.movies = self.database.fetch(Popular.self)
        }
    }

// MARK: - OPTION TWO Save Data to Api to Core Data Model
    override func viewDidAppear(_ animated: Bool) {
//        NetworkServiesMovies.shared.sycnPopular(searchTerm: "popular") {
//            self.movies = self.database.fetch(Popular.self)
//        }
    }

//        MARK:- Fetch data to Core Data
    func fetchDataToCoreData() {
        movies = database.fetch(Popular.self)
    }
// MARK: - OPTION TWO Fetch data to Core Data
        override func viewWillAppear(_ animated: Bool) {
            //        let results = database.fetch(Movies.self)
            //        print(results.map { $0.title})
//                    movies = database.fetch(Popular.self)
        }

    //    MARK: - Protocols CollectionsViews
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let movies = movies?[indexPath.item] else { return }
//        print(movies)
        let Controller = DetailPopularViewController()
        Controller.navigationItem.title = movies.title
//        Controller.appId = Int(movies.id)
        Controller.movies =  movies

        navigationController?.pushViewController(Controller, animated: true)
    }


    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: 350)
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        //        saw data before dont load data
        enterSearchTermLabel.isHidden = movies!.count != 0

        return movies?.count ?? 0
//        return 5
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! PopularViewCell
        if movies!.count > 0 && indexPath.row < movies!.count {
            cell.movies = movies?[indexPath.item]
        }

//        MARK: - Use to pass action to button
        cell.didselectHandler = {
            guard let movies = self.movies?[indexPath.item] else { return }
            let Controller = VideosPopularController()
            Controller.navigationItem.title = movies.title
            self.navigationController?.pushViewController(Controller, animated: true)
            NetworkServiesMovies.shared.fetchVideos(id: movies.id) { resp, err in
                Controller.movies = resp
            }
        }
        return cell
    }

}

