//
//  SearchViewController.swift
//  Diplom
//
//  Created by ryan on 22.11.2021.
//

import UIKit

class SearchViewController: BaseListController, UICollectionViewDelegateFlowLayout, UISearchBarDelegate {

    //    MARK:- Identifier Cell
        fileprivate let cellId = "id1234"

    //MARK:- SEARCH CONTROLLER Managed

        fileprivate let  searchController = UISearchController(searchResultsController: nil)

        fileprivate let enterSearchTermLabel : UILabel = {
            let label = UILabel()
            label.text = "Please enter search term movie"
            label.textAlignment = .center
            label.font = UIFont.boldSystemFont(ofSize: 20)
            return label
        }()

//    MARK:- ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor  = .white
        //        Allow register identifier cell
        collectionView.register(SearchViewCell.self, forCellWithReuseIdentifier: cellId)
        //        enter search term messa to data dont load
        collectionView.addSubview(enterSearchTermLabel)
        enterSearchTermLabel.fillSuperview(padding: .init(top: 100, left: 50, bottom: 0, right: 50))
        setupSearchBar()

        moviesServies()
    }

    //    MARK: - SEACRH BAR SETUP
        fileprivate func setupSearchBar() {
            definesPresentationContext = true
            navigationItem.searchController = self.searchController
            navigationItem.hidesSearchBarWhenScrolling = false
            searchController.obscuresBackgroundDuringPresentation = false
            searchController.searchBar.delegate = self
        }


    //  MARK:-  timer to reload data
        var timer: Timer?

        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {

    //        Introduce some delay before performing the searh
    //        throttling the search
            timer?.invalidate()

            timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false, block: { (_) in
    //            this will actually fire my search
                //        MARK: SEARCH BAR DATA RESULTS
                NetworkServiesMovies.shared.fecthSearch(searchTerm: searchText) { (res, err) in
                            if let err = err {
                                print("Faied to search result", err)
                                return
                            }
                            self.appResults = res

                            DispatchQueue.main.async {
                                self.collectionView.reloadData()
                            }

                        }
            })

        }
//    MARK: - Save Results to api with the user Search
    fileprivate var appResults = [Results]()
    //    MARK: - Function  to  search Movie to into services
    func moviesServies() {
        NetworkServiesMovies.shared.fecthSearch(searchTerm: "Avengers") { results, err in
            if let err = err {
                print("Failed to fetch apps:", err)
                return
            }
            // Save Results to api rest
            self.appResults = results
    //                reload data
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }

    //    MARK: - Protocols Collections Views
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: 350)
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //        saw data before dont load data
        enterSearchTermLabel.isHidden = appResults.count != 0

        return appResults.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! SearchViewCell

            cell.appResult = appResults[indexPath.item]

        return cell
    }
}
