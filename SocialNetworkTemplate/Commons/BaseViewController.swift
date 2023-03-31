//
//  BaseViewController.swift
//  SocialNetworkTemplate
//
//  Created by Christopher Guarneros Diaz on 30/03/23.
//

import UIKit

class BaseViewController: UIViewController {
    
    var navigationView: NavigationView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createView()
        addViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.interactivePopGestureRecognizer?.isEnabled = false
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
}

extension BaseViewController {
    func createView() {
        navigationController?.navigationBar.isHidden = true
        navigationController?.setNavigationBarHidden(true, animated: false)
        view.backgroundColor = .white
        navigationView = NavigationView(context: self, leftItemType: .NONE, centerItemType: .NONE, rigthItemType: .NONE)
    }
    
    func addViews() {
        view.addSubview(navigationView)
    }

}




