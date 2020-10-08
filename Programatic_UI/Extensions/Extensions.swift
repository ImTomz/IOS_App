//
//  Extensions.swift
//  Programatic_UI
//
//  Created by Tomas Boda on 07/10/2020.
//  Copyright © 2020 Tomas Boda. All rights reserved.
//

import UIKit

extension UIView {

    enum ViewSide {
        case Left, Right, Top, Bottom
    }
    
    //Adding border to view
    func addBorder(toSide side: ViewSide, withColor color: CGColor, andThickness thickness: CGFloat) {

        let border = CALayer()
        border.backgroundColor = color

        switch side {
        case .Left: border.frame = CGRect(x: frame.minX, y: frame.minY, width: thickness, height: frame.height); break
        case .Right: border.frame = CGRect(x: frame.maxX, y: frame.minY, width: thickness, height: frame.height); break
        case .Top: border.frame = CGRect(x: frame.minX, y: frame.minY, width: frame.width, height: thickness); break
        case .Bottom: border.frame = CGRect(x: frame.minX, y: frame.maxY, width: frame.width, height: thickness); break
        }

        layer.addSublayer(border)
    }
}

