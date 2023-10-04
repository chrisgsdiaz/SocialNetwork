//
//  UIViewExtension.swift
//  SocialNetworkTemplate
//
//  Created by Christopher Guarneros Diaz on 03/10/23.
//

import UIKit

extension UIView {
    func addShadow() {
        self.layer.cornerRadius = 8
                self.layer.shadowOffset = CGSize(width: 0, height: 3)
                self.layer.shadowRadius = 3
                self.layer.shadowOpacity = 0.3
                self.layer.shadowColor = UIColor.black.cgColor
                self.layer.shadowPath = UIBezierPath(roundedRect: self.bounds,
        byRoundingCorners: .allCorners, cornerRadii: CGSize(width: 8, height:
        8)).cgPath
                self.layer.shouldRasterize = true
                self.layer.rasterizationScale = UIScreen.main.scale
    }
}
