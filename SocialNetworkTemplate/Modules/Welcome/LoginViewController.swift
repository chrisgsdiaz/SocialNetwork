//
//  LoginViewController.swift
//  SocialNetworkTemplate
//
//  Created by Christopher Guarneros Diaz on 29/03/23.
//

import UIKit

class LoginViewController: BaseViewController {
    
    var scrollView: UIScrollView!
    var clearView: UIView!
    var contentBottomImageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupScrollView()
        createBackgroundBottomImageView()
        setupElements()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        scrollView.contentSize = CGSize(width: view.frame.width, height: clearView.frame.height)
    }
    

}

// MARK: - UI interfaces

extension LoginViewController {
    
    private func setupScrollView(){
        
        scrollView = UIScrollView()
        scrollView.backgroundColor = .clear
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scrollView)
        
        //scrollView.topAnchor.constraint(equalTo: navigationView.bottomAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: navigationView.bottomAnchor, constant: -20).isActive = true
        scrollView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        scrollView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        clearView = UIView()
        clearView.backgroundColor = .clear
        clearView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(clearView)
        clearView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        clearView.leftAnchor.constraint(equalTo: scrollView.leftAnchor).isActive = true
        clearView.rightAnchor.constraint(equalTo: scrollView.rightAnchor).isActive = true
        clearView.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
        clearView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        
    }
    
    private func createBackgroundBottomImageView() {
        
        contentBottomImageView = UIImageView()
        contentBottomImageView.contentMode = .scaleAspectFill
        contentBottomImageView.image = UtilsHelper.getImage(image: "bottomImage")
        contentBottomImageView.clipsToBounds = true
        contentBottomImageView.translatesAutoresizingMaskIntoConstraints = false
        clearView.addSubview(contentBottomImageView)
        contentBottomImageView.heightAnchor.constraint(equalToConstant: 180).isActive = true
        contentBottomImageView.bottomAnchor.constraint(equalTo: clearView.bottomAnchor, constant: 20).isActive = true
        contentBottomImageView.leftAnchor.constraint(equalTo: clearView.leftAnchor, constant: 0).isActive = true
        contentBottomImageView.rightAnchor.constraint(equalTo: clearView.rightAnchor, constant: 0).isActive = true
        
    }
    
    private func setupElements() {
        
        // KEY ELEMENT - IMPORTANT FOR INCREASE MAIN VIEW CONTAINER IN SCROLLVIEW
        
        //clearView.heightAnchor.constraint(equalToConstant: view.frame.height).isActive = true
        clearView.heightAnchor.constraint(greaterThanOrEqualToConstant: view.frame.height - navigationView.frame.height).isActive = true
        
    }
    
}

extension LoginViewController: NavigationViewDelegate{
    
    private func setupNavigationBar() {
        navigationView.setTitle(title: "Iniciar sesión")
        navigationView.setUpView(like: NavigationItemType.BACK)
        navigationView.delegate = self
    }
    
    func leftButtonPressed() {
        print("Hola")
        if let navigationControllers = navigationController?.viewControllers {
            for controller in navigationControllers {
                if controller.isKind(of: WelcomeViewController.self) {
                    //navigationView.popToViewController(controller, animated: true)
                }
            }
        }
    }
}
