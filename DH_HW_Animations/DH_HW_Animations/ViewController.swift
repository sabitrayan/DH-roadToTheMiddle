//
//  ViewController.swift
//  DH_HW_Animations
//
//  Created by ryan on 28.10.2021.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        setupLayer()
        setupView()
        setupContraints()
    }

    private var whiteLayer = CAShapeLayer()
    private var redLayer = CAShapeLayer()

    func setupLayer(){
        let whiteRect = CGRect(x: 0, y: 200, width: 410, height: 50)
        whiteLayer.path = UIBezierPath(roundedRect: whiteRect, cornerRadius: 10).cgPath
        whiteLayer.fillColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        view.layer.addSublayer(whiteLayer)

        let redRect = CGRect(x: -410, y: 200, width: 410, height: 50)
        redLayer.path = UIBezierPath(roundedRect: redRect, cornerRadius: 10).cgPath
        redLayer.fillColor = #colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1)
        view.layer.addSublayer(redLayer)
    }


    func basicAnimation() {
        let animate = CABasicAnimation(keyPath: #keyPath(CAShapeLayer.path))
        animate.fromValue = redLayer.path
        animate.toValue = whiteLayer.path
        animate.duration = 2.0
        animate.autoreverses = false
        animate.repeatCount = 1
        animate.fillMode = CAMediaTimingFillMode.forwards
        animate.isRemovedOnCompletion = false

        redLayer.add(animate, forKey: nil)
    }

    let playAnimationButton: UIButton = {
        $0.tintColor = .white
        $0.backgroundColor = .systemOrange
        $0.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        $0.layer.cornerRadius = 25
        $0.addTarget(self, action: #selector(playAnimationTouched), for: .touchUpInside)
        return $0
    }(UIButton())

    @objc private func playAnimationTouched() {
        basicAnimation()
    }

    private func setupView(){
        view.addSubview(playAnimationButton)
    }

    private func setupContraints(){
        playAnimationButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.centerX.equalToSuperview()
            make.width.equalTo(200)
            make.height.equalTo(50)
        }
    }




}

