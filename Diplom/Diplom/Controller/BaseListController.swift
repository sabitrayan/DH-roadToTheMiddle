//
//  BaseListController.swift
//  Diplom
//
//  Created by ryan on 22.11.2021.
//

import Foundation
import UIKit
//    MARK: - Protocols CollectionsViewController to allow modify View to all Controller
class BaseListController : UICollectionViewController {
    //    pass view to tabBar to UICollectionViewController
        init() {
            super.init(collectionViewLayout: UICollectionViewFlowLayout())
        }

        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
}
