//
//  VideoPopularViewCell.swift
//  Diplom
//
//  Created by ryan on 22.11.2021.
//

import Foundation
import UIKit
import AVKit
import AVFoundation

class VideoPopularViewCell: UICollectionViewCell {

    var videosPopular : ResultVideo? {
        didSet {
            updateVideo()
        }
    }

    func updateVideo() {
        guard let videos = videosPopular else {return}
        activityIndicator.isHidden = true
        nameLabel.text = videos.name
        if let url = URL(string: videos.key ){
            playVideo(url: url)
        }

//        playerView.load(withVideoId: "\(videos.key)")
//        playerView.load(withVideoId: "\(videos.key)", playerVars: ["playsinline": 1, "controls": 1, "autohide": 1, "showinfo": 1, "modestbranding" : 1])
    }

    //    MARK: -label
        let nameLabel: UILabel = {
            let label = UILabel()
            label.text = "APP MOVIE"
            label.numberOfLines = 2
            return label
        }()



    func playVideo(url: URL) {
        let player = AVPlayer(url: url)
        let vc = AVPlayerViewController()
        vc.player = player
        playerView.
        self.present(vc, animated: true) { vc.player?.play() }
    }

    let playerView: UIView! = {
       let view = UIView()
        view.backgroundColor = .black
        view.layer.cornerRadius = 8
        view.clipsToBounds = true
//        uiView.widthAnchor.constraint(equalToConstant: 335).isActive = true
        view.heightAnchor.constraint(equalToConstant: 200).isActive = true
        view.layer.borderWidth = 0.5
        view.layer.borderColor = UIColor(white: 0.5, alpha: 0.5).cgColor
        view.contentMode = .scaleAspectFill
        return view
    }()


   lazy var activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView()
    activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.style = .medium
        //activityIndicator.center = playerView.center
        activityIndicator.startAnimating()
        return activityIndicator
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
//        backgroundColor = .red


        let stackViewLabel = UIStackView(arrangedSubviews: [
        nameLabel
        ])
        stackViewLabel.axis = .horizontal
        let stackVideo = UIStackView(arrangedSubviews: [activityIndicator])
        stackVideo.alignment = .center
        stackVideo.axis  = .horizontal
        let stackViewMain = UIStackView(arrangedSubviews: [
        stackViewLabel, stackVideo
        ])
        stackViewMain.axis = .vertical
        stackVideo.alignment = .center
        stackVideo.spacing = 2
        addSubview(stackViewMain)
        stackViewMain.fillSuperview(padding: .init(top: 15, left: 15, bottom: 15, right: 15))
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
