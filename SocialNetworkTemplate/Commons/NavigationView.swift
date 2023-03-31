//
//  NavigationView.swift
//  SocialNetworkTemplate
//
//  Created by Christopher Guarneros Diaz on 30/03/23.
//

import UIKit

public enum NavigationItemType {
    case NONE
    case BACK
    case CLOSE
}

@objc protocol NavigationViewDelegate {
    @objc optional func leftButtonPressed()
    @objc optional func centerButtonPressed()
    @objc optional func rightButtonPressed()
}

class NavigationView: UIView {

    var bottomView: UIView!
    var backgroundImageView: UIImageView!
    weak var delegate: NavigationViewDelegate?
    private var leftView: UIView!
    private var centerView: UIView!
    private var lineTypeImageView: UIImageView!
    private var titleLabel: UILabel!
    private var subTitleLabel: UILabel!
    private var rightView: UIView!
    private var claroImageView: UIImageView!
    var statusBarHeight: CGFloat = UIApplication.shared.windows.filter{$0.isKeyWindow}.first?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0

    convenience init(context: UIViewController, leftItemType: NavigationItemType, centerItemType: NavigationItemType, rigthItemType: NavigationItemType) {
        let height = UIApplication.shared.windows.filter({$0.isKeyWindow}).first?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0
        self.init(frame: CGRect(x: 0, y: 0, width: context.view.frame.width, height: height+80))
        self.backgroundColor = .white
        
    }
    
    func setUpView(like: NavigationItemType) {
      
        claroImageView = UIImageView(image: UIImage(named: "Logo_claro"))
        switch like {
        case .BACK:
            let backButton = UIButton(type: .system)
            //backButton.setBackgroundImage(UIImage(named: "flechaRegreso"), for: .normal)
            backButton.setImage(UIImage(named: "flechaRegreso"), for: .normal)
            backButton.clipsToBounds = true
            backButton.imageView?.contentMode = .scaleAspectFill
            backButton.tintColor = .black
            backButton.addTarget(self, action: #selector(leftButtonPressed), for: .touchUpInside)
            leftView = backButton
            setUpLeftView()
        case .CLOSE:
            let backButton = UIButton(type: .system)
            backButton.setImage(UIImage(named: "iconClose"), for: .normal)
            backButton.tintColor = .black
            backButton.addTarget(self, action: #selector(rightButtonPressed), for: .touchUpInside)
            rightView = backButton
            setUpRigthView()
        case .NONE:
            return
        }
    }
    
    
    func setUpLeftView() {
        leftView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(leftView)
        leftView.topAnchor.constraint(equalTo: self.topAnchor, constant: statusBarHeight).isActive = true
        leftView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 5).isActive = true
        leftView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10).isActive = true
        leftView.widthAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    func setUpRigthView() {
        rightView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(rightView)
        rightView.topAnchor.constraint(equalTo: self.topAnchor, constant: statusBarHeight + 5).isActive = true
        rightView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -5).isActive = true
        rightView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5).isActive = true
        rightView.widthAnchor.constraint(equalToConstant: 50).isActive = true
    }

    func setTitle(title: String) {
        let labelTitle = UILabel()
        labelTitle.text = title
        labelTitle.textColor = .black
        labelTitle.textAlignment = .center
        labelTitle.numberOfLines = 0
        labelTitle.font = UIFont.boldSystemFont(ofSize: 16)
        centerView = labelTitle
        centerView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(centerView)
        centerView.topAnchor.constraint(equalTo: topAnchor, constant: statusBarHeight).isActive = true
        centerView.leftAnchor.constraint(equalTo: leftAnchor, constant: 65).isActive = true
        centerView.rightAnchor.constraint(equalTo: rightAnchor, constant: -65).isActive = true
        centerView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10).isActive = true
    }
    
}

extension NavigationView {
    @objc private func leftButtonPressed() {
        delegate?.leftButtonPressed!()
    }
    
    @objc private func centerButtonPressed() {
        delegate?.centerButtonPressed!()
    }
    
    @objc private func rightButtonPressed() {
        delegate?.rightButtonPressed!()
    }
}

