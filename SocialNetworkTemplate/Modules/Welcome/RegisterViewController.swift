//
//  RegisterViewController.swift
//  SocialNetworkTemplate
//
//  Created by Christopher Guarneros Diaz on 29/03/23.
//

import UIKit
import NotificationBannerSwift
import Simple_Networking
import SVProgressHUD

class RegisterViewController: BaseViewController {

    var scrollView: UIScrollView!
    var clearView: UIView!
    var contentStackView: UIStackView!
    var titleLabel: UILabel!
    var emailTextField: UITextField!
    var registerNameTextField: UITextField!
    var phoneTextField: UITextField!
    var passwordTextField: UITextField!
    var registerButton: UIButton!
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

extension RegisterViewController {
    
    private func setupScrollView(){
        
        scrollView = UIScrollView()
        scrollView.backgroundColor = .clear
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scrollView)
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
        contentBottomImageView.contentMode = .scaleAspectFit
        contentBottomImageView.image = UtilsHelper.getImage(image: "wpBrand") //bottomImage
        contentBottomImageView.clipsToBounds = true
        contentBottomImageView.translatesAutoresizingMaskIntoConstraints = false
        clearView.addSubview(contentBottomImageView)
        contentBottomImageView.heightAnchor.constraint(equalToConstant: 100).isActive = true //180
        contentBottomImageView.bottomAnchor.constraint(equalTo: clearView.bottomAnchor, constant: -40).isActive = true // 20
        contentBottomImageView.leftAnchor.constraint(equalTo: clearView.leftAnchor, constant: 30).isActive = true //0
        contentBottomImageView.rightAnchor.constraint(equalTo: clearView.rightAnchor, constant: -30).isActive = true //0
        
    }
    
    private func setupElements() {
        
        contentStackView = UIStackView()
        contentStackView.distribution = .fill
        contentStackView.spacing = 20
        contentStackView.axis = .vertical
        contentStackView.translatesAutoresizingMaskIntoConstraints = false
        clearView.addSubview(contentStackView)
        contentStackView.topAnchor.constraint(equalTo: clearView.topAnchor, constant: 30).isActive = true
        contentStackView.leftAnchor.constraint(equalTo: clearView.leftAnchor, constant: 30).isActive = true
        contentStackView.rightAnchor.constraint(equalTo: clearView.rightAnchor, constant: -30).isActive = true
        
        titleLabel = UILabel()
        titleLabel.numberOfLines = 0
        titleLabel.lineBreakMode = .byWordWrapping
        titleLabel.textColor = .black
        titleLabel.textAlignment = .left
        titleLabel.text = "Completa los siguientes datos:"
        titleLabel.font = UIFont.boldSystemFont(ofSize: 15)
        contentStackView.addArrangedSubview(titleLabel)
        
        emailTextField = UITextField()
        emailTextField.keyboardType = .emailAddress
        emailTextField.autocapitalizationType = .none
        emailTextField.autocorrectionType = .no
        emailTextField.placeholder = "Email"
        emailTextField.layer.masksToBounds = true
        emailTextField.layer.borderWidth = 0.5
        emailTextField.layer.cornerRadius = 8.0
        emailTextField.layer.borderColor = UIColor.gray.cgColor
        emailTextField.borderStyle = .roundedRect
        emailTextField.delegate = self
        contentStackView.addArrangedSubview(emailTextField)
        
        registerNameTextField = UITextField()
        registerNameTextField.keyboardType = .asciiCapable
        registerNameTextField.autocapitalizationType = .none
        registerNameTextField.autocorrectionType = .no
        registerNameTextField.placeholder = "Nombre y Apellido"
        registerNameTextField.layer.masksToBounds = true
        registerNameTextField.layer.borderWidth = 0.5
        registerNameTextField.layer.cornerRadius = 8.0
        registerNameTextField.layer.borderColor = UIColor.gray.cgColor
        registerNameTextField.borderStyle = .roundedRect
        registerNameTextField.delegate = self
        contentStackView.addArrangedSubview(registerNameTextField)
        
        phoneTextField = UITextField()
        phoneTextField.keyboardType = .numberPad
        phoneTextField.autocapitalizationType = .none
        phoneTextField.autocorrectionType = .no
        phoneTextField.placeholder = "Número telefonico"
        phoneTextField.layer.masksToBounds = true
        phoneTextField.layer.borderWidth = 0.5
        phoneTextField.layer.cornerRadius = 8.0
        phoneTextField.layer.borderColor = UIColor.gray.cgColor
        phoneTextField.borderStyle = .roundedRect
        phoneTextField.delegate = self
        contentStackView.addArrangedSubview(phoneTextField)
        
        passwordTextField = UITextField()
        passwordTextField.keyboardType = .asciiCapable
        passwordTextField.autocapitalizationType = .none
        passwordTextField.autocorrectionType = .no
        passwordTextField.isSecureTextEntry = true
        passwordTextField.placeholder = "Password"
        passwordTextField.layer.masksToBounds = true
        passwordTextField.layer.borderWidth = 0.5
        passwordTextField.layer.cornerRadius = 8.0
        passwordTextField.layer.borderColor = UIColor.gray.cgColor
        passwordTextField.borderStyle = .roundedRect
        passwordTextField.delegate = self
        contentStackView.addArrangedSubview(passwordTextField)
        
        registerButton = UIButton()
        registerButton.backgroundColor = institutionalColors.mainBackgroundColor //UIColor.systemGreen
        registerButton.layer.cornerRadius = 25
        registerButton.setTitle("Registro", for: .normal)
        registerButton.setTitleColor(.white, for: .normal)
        registerButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        registerButton.addTarget(self, action: #selector(registerButtonAction), for: .touchUpInside)
        registerButton.isUserInteractionEnabled = true
        registerButton.translatesAutoresizingMaskIntoConstraints = false
        registerButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        contentStackView.setCustomSpacing(50, after: passwordTextField)
        contentStackView.addArrangedSubview(registerButton)
        
        // KEY ELEMENT - IMPORTANT FOR INCREASE MAIN VIEW CONTAINER IN SCROLLVIEW AND REMOVE NAVIGATIONBAR HEIGHT
        
        //clearView.heightAnchor.constraint(equalToConstant: view.frame.height).isActive = true
        clearView.heightAnchor.constraint(greaterThanOrEqualToConstant: view.frame.height - navigationView.frame.height).isActive = true
        
    }
    
}

// MARK: - Button Actions

extension RegisterViewController {
    
    @objc func registerButtonAction(){
        view.endEditing(true)
        performRegister()
    }
    
}

// MARK: - Private Methods

extension RegisterViewController {
    
    private func performRegister(){
        guard let email = emailTextField.text, !email.isEmpty, email.isValidEmail() else {
            //TODO: DESCOMENTAR PARA CORRECTO FUNCIONAMIENTO
            //NotificationBanner(title: "Error", subtitle: "Debes especificar un correo válido.", style: .warning).show()
            self.goHome()
            return
        }
        guard let name = registerNameTextField.text, !name.isEmpty else {
            NotificationBanner(title: "Error", subtitle: "Debes especificar un nombre y apellido.", style: .warning).show()
            return
        }
        guard let password = passwordTextField.text, !password.isEmpty else {
            NotificationBanner(title: "Error", subtitle: "Debes especificar una contraseña.", style: .warning).show()
            return
        }
        
        let registerRequest = RegisterRequest(email: email, password: password, names: name)
        SVProgressHUD.show()
        
        SN.post(endpoint: Endpoints.register, model: registerRequest) { (response: SNResultWithEntity<LoginResponse, ErrorResponse>) in
            
            SVProgressHUD.dismiss()
            
            switch response {
            case .success(let response):
                self.goHome()
            case .error(let error):
                //TODO: DESCOMENTAR PARA CORRECTO FUNCIONAMIENTO
                //NotificationBanner(title: "Error", subtitle: "Hubo un error en tu proceso de autenticación: \(error.localizedDescription)", style: .danger).show()
                
                //TODO: COMENTAR HARDCODE
                self.goHome()
                
            case .errorResult(let entity):
                NotificationBanner(title: "Error", subtitle: "Hubo un error: \(entity.error)", style: .warning).show()
                
            }
        }
    }
    
    private func goHome() {
        let homeVC = HomeViewController()
        homeVC.userName = "Leonardo"//TODO: DESCOMENTAR -> response.user.names
        let navController = UINavigationController(rootViewController: homeVC)
        navController.modalPresentationStyle = .fullScreen
        self.present(navController, animated: true)
    }
}

extension RegisterViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let maxLength = 10
        let currentString = (textField.text ?? "") as NSString
        let newString = currentString.replacingCharacters(in: range, with: string)

        return newString.count <= maxLength
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField == emailTextField {
            textField.resignFirstResponder()
            registerNameTextField.becomeFirstResponder()
        } else if textField == registerNameTextField {
            textField.resignFirstResponder()
            phoneTextField.becomeFirstResponder()
        } else if textField == phoneTextField {
            textField.resignFirstResponder()
            passwordTextField.becomeFirstResponder()
        } else if textField == passwordTextField {
            textField.resignFirstResponder()
        }
       return true
    }
    
}

extension RegisterViewController: NavigationViewDelegate{
    
    private func setupNavigationBar() {
        navigationView.setTitle(title: "Registro")
        navigationView.setUpView(like: NavigationItemType.BACK)
        navigationView.delegate = self
    }
    
    func leftButtonPressed() {
        navigationController?.popViewController(animated: true)
    }
}
