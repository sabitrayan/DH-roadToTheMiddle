//
//  Circle.swift
//  twoCircle
//
//  Created by ryan on 24.10.2021.
//

import Foundation
import UIKit

class Circle: UIView {
    private var path: CGPath?

    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {

       // print(type(of: center.x-point.x))
        let answer = kobeitu(bounds.size.width/2-point.x) + kobeitu(bounds.size.height/2 - point.y) <= kobeitu(bounds.size.width/2)

//        print("answer \(answer)")
        guard let path = path else { return answer }

        if path.contains(point) {
            return false }
        else {
            return answer
        }
//        if path.contains(point) {
//            return false
//        }
//        else if self.path != nil {
//            return true
//        }
//        else{
//            return false
//        }

    }
   
    func setPath() {
        let subLayer = CAShapeLayer()
        subLayer.fillRule = CAShapeLayerFillRule.evenOdd
        layer.cornerRadius = bounds.height / 2

        let pathOfcircle = UIBezierPath(ovalIn: CGRect(x:  bounds.size.width / 4, y:  bounds.size.height/4, width: self.bounds.width/2, height: self.bounds.height/2))

        let path = UIBezierPath(rect: self.bounds)
        path.append(pathOfcircle)


        subLayer.path = path.cgPath
        self.layer.mask = subLayer

        self.path = pathOfcircle.cgPath
    }
    
}



extension Circle {
//    func kobeitu<T>(_ x: T)->T{
//        return x*x
//    }
    func kobeitu(_ x: CGFloat)->CGFloat{
        return x*x
    }
}

