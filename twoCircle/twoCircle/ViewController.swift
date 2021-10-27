//
//  ViewController.swift
//  twoCircle
//
//  Created by ryan on 24.10.2021.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    let viewA: Circle = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = #colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1)
        $0.clipsToBounds = true
        return $0
    }(Circle())

    let viewB: Circle = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
        $0.clipsToBounds = true
        return $0
    }(Circle())


    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        //viewA.layer.cornerRadius = view.bounds.height / 2
        viewB.setPath()

    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupViews()

        setupConstraints()
        tapView()
    }

    private func tapView(){
        let tapA = UITapGestureRecognizer(target: self, action: #selector(self.tapViewA))
        viewA.addGestureRecognizer(tapA)

        let tapB = UITapGestureRecognizer(target: self, action:  #selector(self.tapViewB))
        viewB.addGestureRecognizer(tapB)
    }
    private func setupViews(){
        view.addSubview(viewA)
        view.addSubview(viewB)

    }


    private func setupConstraints() {
        viewA.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
            $0.height.equalTo(300)
            $0.width.equalTo(300)
        }
        viewB.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
            $0.height.equalTo(200)
            $0.width.equalTo(200)
        }
    }

    @objc func tapViewA() {
        print(#function)
    }

    @objc func tapViewB() {
        print(#function)
    }



}


extension Circle {
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        layer.cornerRadius = bounds.height / 2
    }
}
