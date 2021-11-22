//
//  DetailTopRatedViewController.swift
//  Diplom
//
//  Created by ryan on 22.11.2021.
//

import Foundation
import UIKit

class DetailTopRatedViewController: BaseListController, UICollectionViewDelegateFlowLayout {

//    var appId: Int! {
//        didSet {
//            print("Here is my id", appId!)
//        }
//    }

    //    MARK - Variable Popular to pass into controller
        var movies: TopRated?

    //    MARK:- Identifier Cell
        fileprivate let cellId = "id1234"

    //    MARK: - ViewDidLoad
        override func viewDidLoad() {
            super.viewDidLoad()
            collectionView.backgroundColor = .white

            //        Allow register identifier cell
                    collectionView.register(DetailTopRatedViewCell.self, forCellWithReuseIdentifier: cellId)
    //        the title is more small Navegation item title
                navigationItem.largeTitleDisplayMode = .never
        }

    //    MARK: - Protocols CollectionsViews
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: 450)
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
//        return 5
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! DetailTopRatedViewCell
//        if movies!.count > 0 && indexPath.row < movies!.count {
//            cell.movies = movies?[indexPath.item]
            cell.movies = movies
//        }

        return cell
    }
}
