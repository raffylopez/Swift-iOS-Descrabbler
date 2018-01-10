//
//  ScrabbleTileView.swift
//  RafIosScrabbleSolver
//
//  Created by Volare on 16/09/2017.
//  Copyright © 2017 Gensys Telerik. All rights reserved.
//

import UIKit

class ScrabbleTileView: UIView {
    var letter_:Character = "M"
    var letter:Character {
        get {
            return letter_
        }
        set {
            letter_ = newValue
        }
    }
    
    func cg_offset(cgPoint:CGPoint, dX:Float, dY: Float)->CGPoint {
        return CGPoint(x:cgPoint.x + CGFloat.init(dX), y:cgPoint.y + CGFloat.init(dY))
    }
    func cg_diff(a:CGPoint, b:CGPoint)->CGPoint {
        return CGPoint(x:a.x - b.x, y:a.y - b.y)
    }
    override func draw(_ rect: CGRect) {
        let dot = UIBezierPath(ovalIn:CGRect(x: rect.origin.x, y: rect.origin.y, width: 20, height: 20))
        UIColor.white.setFill()
        UIColor.white.setStroke()
        dot.stroke()
        dot.fill()
        
        let path = UIBezierPath(rect: rect)
        UIColor.blue.setFill()
        UIColor.blue.setStroke()
        path.lineWidth = 1.0
        path.fill()
        path.stroke()
        let lbl = UILabel(frame: rect)
        lbl.textAlignment = .center
        lbl.layer.borderColor = UIColor.green.cgColor
        lbl.layer.borderWidth = 2
        lbl.text = String(letter_).uppercased()
        lbl.textColor = UIColor.white
        let uifd = UIFontDescriptor().withFamily("Helvetica Neue").withFace("Thin")
        let font = UIFont(descriptor: uifd, size: 42.0)
        lbl.font = font
//        lbl.center = CGPoint(x: 100, y: 100)
//        lbl.center = cg_offset(cgPoint:self.bounds.origin, dX:100, dY:50)
//        lbl.center = cg_offset(cgPoint:self.bounds.origin, dX:100, dY:50)
        lbl.center = cg_diff(a:self.center,b:self.frame.origin)
        print(lbl.center)
        print(self.frame.origin)
        print(self.center)
        self.addSubview(lbl)
    }

}
