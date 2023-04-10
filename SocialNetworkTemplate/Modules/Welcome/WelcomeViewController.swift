//
//  WelcomeViewController.swift
//  SocialNetworkTemplate
//
//  Created by Christopher Guarneros Diaz on 29/03/23.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    var scrollView: UIScrollView!
    var clearView: UIView!
    var imageBackground: UIImageView!
    var titleLabel: UILabel!
    var subTitleLabel: UILabel!
    var loginButton: UIButton!
    var registerButton: UIButton!
    var contentButtonsView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        createBackgroundImageView()
        setupScrollView()
        setupElements()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        scrollView.contentSize = CGSize(width: view.frame.width, height: clearView.frame.height)
    }

}

// MARK: - UI interfaces

extension WelcomeViewController {
    private func createBackgroundImageView() {
        
        let gradient = CAGradientLayer()
        gradient.frame = view.bounds
        gradient.colors = [UIColor.clear.cgColor, UIColor.black.cgColor]
        
        imageBackground = UIImageView()
        imageBackground.contentMode = .scaleAspectFill
        imageBackground.translatesAutoresizingMaskIntoConstraints = false
        imageBackground.image = UtilsHelper.getImage(image: "wpDental") //loginBg
        imageBackground.layer.addSublayer(gradient)

        view.addSubview(imageBackground)
        imageBackground.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        imageBackground.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        imageBackground.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        imageBackground.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
    }
    
    private func setupScrollView(){
        
        scrollView = UIScrollView()
        scrollView.backgroundColor = .clear
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scrollView)
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
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
    
    private func setupElements() {
        
        titleLabel = UILabel()
        titleLabel.numberOfLines = 0
        titleLabel.lineBreakMode = .byWordWrapping
        titleLabel.textColor = .white
        titleLabel.textAlignment = .center
        titleLabel.text = "Sourident"
        titleLabel.font = UIFont.boldSystemFont(ofSize: 30)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        clearView.addSubview(titleLabel)
        titleLabel.centerYAnchor.constraint(equalTo: clearView.centerYAnchor).isActive = true
        //titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: clearView.leftAnchor, constant: 20).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: clearView.rightAnchor, constant: -20).isActive = true
        
        subTitleLabel = UILabel()
        subTitleLabel.numberOfLines = 0
        subTitleLabel.lineBreakMode = .byWordWrapping
        subTitleLabel.textColor = .white
        subTitleLabel.textAlignment = .center
        subTitleLabel.text = "Odontología especializada"
        subTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        clearView.addSubview(subTitleLabel)
        subTitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5).isActive = true
        subTitleLabel.leftAnchor.constraint(equalTo: clearView.leftAnchor, constant: 20).isActive = true
        subTitleLabel.rightAnchor.constraint(equalTo: clearView.rightAnchor, constant: -20).isActive = true
        
        
        // Section buttons
        
        contentButtonsView = UIView()
        contentButtonsView.backgroundColor = .clear
        contentButtonsView.clipsToBounds = true
        contentButtonsView.translatesAutoresizingMaskIntoConstraints = false
        clearView.addSubview(contentButtonsView)
        contentButtonsView.heightAnchor.constraint(equalToConstant: 180).isActive = true
        contentButtonsView.bottomAnchor.constraint(equalTo: clearView.bottomAnchor, constant: 0).isActive = true
        contentButtonsView.leftAnchor.constraint(equalTo: clearView.leftAnchor, constant: 20).isActive = true
        contentButtonsView.rightAnchor.constraint(equalTo: clearView.rightAnchor, constant: -20).isActive = true
        
        loginButton = UIButton()
        loginButton.backgroundColor = .white
        loginButton.layer.cornerRadius = 25
        loginButton.setTitle("Iniciar Sesión", for: .normal)
        loginButton.setTitleColor(.black, for: .normal)
        loginButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        loginButton.addTarget(self, action: #selector(loginButtonAction), for: .touchUpInside)
        loginButton.isUserInteractionEnabled = true
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        contentButtonsView.addSubview(loginButton)
        loginButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        loginButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30).isActive = true
        loginButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30).isActive = true
        
        registerButton = UIButton()
        registerButton.backgroundColor = .clear
        registerButton.setTitle("Registro", for: .normal)
        registerButton.setTitleColor(.white, for: .normal)
        registerButton.addTarget(self, action: #selector(registerButtonAction), for: .touchUpInside)
        registerButton.isUserInteractionEnabled = true
        registerButton.translatesAutoresizingMaskIntoConstraints = false
        contentButtonsView.addSubview(registerButton)
        registerButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 10).isActive = true
        registerButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        registerButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30).isActive = true
        registerButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30).isActive = true
        
        
        // KEY ELEMENT - IMPORTANT FOR INCREASE MAIN VIEW CONTAINER IN SCROLLVIEW
        
        clearView.heightAnchor.constraint(equalToConstant: view.frame.height).isActive = true
    }
}

// MARK: - Button Actions

extension WelcomeViewController {
    
    @objc func loginButtonAction(){
        let loginVC = LoginViewController()
        //loginVC.modalPresentationStyle = .fullScreen
        //self.present(loginVC, animated: true, completion: nil)                    //PRESENT MODAL
        self.show(loginVC, sender: nil)                                             //SAME AS BELOW, BUT THIS IS THE MODERN METHOD
        //self.navigationController?.pushViewController(loginVC, animated: true)
    }
    
    @objc func registerButtonAction(){
        let registerVC = RegisterViewController()
        self.show(registerVC, sender: nil)
    }
}
