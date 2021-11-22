//
//  VideosTopRatedViewCell.swift
//  Diplom
//
//  Created by ryan on 22.11.2021.
//

import Foundation
import UIKit
//import youtube_ios_player_helper

class VideosTopRatedViewCell: UICollectionViewCell {

    var videosTopRated : ResultVideo? {
        didSet {
            //updateVideo()
        }
    }

//    func updateVideo() {
//        guard let videos = videosTopRated else {return}
//        activityIndicator.isHidden = true
//        nameLabel.text = videos.name
////        playerView.load(withVideoId: "\(videos.key)")
//        playerView.load(withVideoId: "\(videos.key)", playerVars: ["playsinline": 1, "controls": 1, "autohide": 1, "showinfo": 1, "modestbranding" : 1])
//    }
//
//    //    MARK: -label
//        let nameLabel: UILabel = {
//            let label = UILabel()
//            label.text = "APP MOVIE"
//            label.numberOfLines = 2
//            return label
//        }()
//
//    let playerView: YTPlayerView! = {
//       let uiView = YTPlayerView()
//        uiView.backgroundColor = .black
//        uiView.layer.cornerRadius = 8
//        uiView.clipsToBounds = true
////        uiView.widthAnchor.constraint(equalToConstant: 335).isActive = true
//        uiView.heightAnchor.constraint(equalToConstant: 200).isActive = true
//        uiView.layer.borderWidth = 0.5
//        uiView.layer.borderColor = UIColor(white: 0.5, alpha: 0.5).cgColor
//        uiView.contentMode = .scaleAspectFill
//        return uiView
//    }()
//
//
//   lazy var activityIndicator: UIActivityIndicatorView = {
//        let activityIndicator = UIActivityIndicatorView()
//    activityIndicator.translatesAutoresizingMaskIntoConstraints = false
//        activityIndicator.style = .medium
//        activityIndicator.center = playerView.center
//        activityIndicator.startAnimating()
//        return activityIndicator
//    }()
//
//    override init(frame: CGRect) {
//        super.init(frame: frame)
////        backgroundColor = .red
//
//        let stackViewLabel = UIStackView(arrangedSubviews: [
//        nameLabel
//        ])
//        stackViewLabel.axis = .horizontal
//        let stackVideo = UIStackView(arrangedSubviews: [activityIndicator,playerView])
//        stackVideo.alignment = .center
//        stackVideo.axis  = .horizontal
//        let stackViewMain = UIStackView(arrangedSubviews: [
//        stackViewLabel, stackVideo
//        ])
//        stackViewMain.axis = .vertical
//        stackVideo.alignment = .center
//        stackVideo.spacing = 2
//        addSubview(stackViewMain)
//        stackViewMain.fillSuperview(padding: .init(top: 15, left: 15, bottom: 15, right: 15))
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
}
