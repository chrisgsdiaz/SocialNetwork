//
//  AppointmentDetail.swift
//  SocialNetworkTemplate
//
//  Created by Christopher Guarneros Diaz on 03/10/23.
//

import UIKit

class AppointmentDetailViewController: BaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        self.title = "hola"
    }
}

// MARK: - NavigationBar

extension AppointmentDetailViewController: NavigationViewDelegate{
    
    private func setupNavigationBar() {
        navigationView.setTitle(title: "Detalle de mi consulta")
        navigationView.setUpView(like: NavigationItemType.BACK)
        navigationView.delegate = self
    }
    
    func leftButtonPressed() {
        navigationController?.popViewController(animated: true)
    }
    
}
