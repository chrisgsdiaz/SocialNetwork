//
//  HomeViewController.swift
//  SocialNetworkTemplate
//
//  Created by Christopher Guarneros Diaz on 03/04/23.
//

import UIKit
import Simple_Networking
import SVProgressHUD
import NotificationBannerSwift

class HomeViewController: BaseViewController {
    
    var appointmentTableView: UITableView! = UITableView(frame: .zero)
    var clearView: UIView!
    var userName: String!
    var contactButton: UIButton!
    var whiteView = UIView()
    
    //MARK: Properties
    
    private let cellID = "AppointmentTableViewCell"
    private var professionalDataSource = [ProfessionalInfo]()
    private var professionalDummyInfo = [ProfessionalInfo]()
    
    let ana = ProfessionalInfo(id: "1", author: User(email: "ana@sourident.com", names: "Dra. Ana Cristina Zuñiga Herrera", nickname: "Ana"), fieldArea: "Odontóloga", dateAppointment: "11 de junio 2023 a las 18:20 hrs.", hasImage: true, imageUrl: "ana", createdAt: "March16")
    let karen = ProfessionalInfo(id: "2", author: User(email: "karen@sourident.com", names: "Dra. Karen Ramirez", nickname: "Ana"), fieldArea: "Estomatologa", dateAppointment: "11 de julio 2023 a las 18:50 hrs.", hasImage: true, imageUrl: "karen", createdAt: "March16")
    let leo = ProfessionalInfo(id: "3", author: User(email: "leonardo@sourident.com", names: "Dr. Leonardo Antonio Guerrero Bautista", nickname: "Leo"), fieldArea: "Odontólogo", dateAppointment: "11 de agosto 2023 a las 18:40 hrs.", hasImage: true, imageUrl: "leo", createdAt: "March16")
    let israel = ProfessionalInfo(id: "4", author: User(email: "israel@sourident.com", names: "Dr. Israel Reyes", nickname: "isra"), fieldArea: "Ortodoncista", dateAppointment: "11 de septiembre 2023 a las 18:10 hrs.", hasImage: true, imageUrl: "israel", createdAt: "March16")
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupUI()
        //TODO: COMENTAR
        professionalDummyInfo.append(ana)
        professionalDummyInfo.append(karen)
        professionalDummyInfo.append(leo)
        professionalDummyInfo.append(israel)
        //TODO: DESCOMENTAR PARA CORRECTO FUNCIONAMIENTO
        //getProfessionalItems()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        NotificationBanner(subtitle: "Bienvenido \(userName ?? "")", style: .success).show()
    }

}

// MARK: - UI interfaces

extension HomeViewController {
    
    private func setupUI() {
        
        self.view.backgroundColor = institutionalColors.whiteColor
                
        appointmentTableView.register(AppointmentTableViewCell.self, forCellReuseIdentifier: cellID)
        appointmentTableView.dataSource = self
        appointmentTableView.delegate = self
        appointmentTableView.estimatedRowHeight = UITableView.automaticDimension
        appointmentTableView.rowHeight = UITableView.automaticDimension
        appointmentTableView.insetsContentViewsToSafeArea = false
        appointmentTableView.separatorStyle = .none
        appointmentTableView.allowsSelection = false
        appointmentTableView.backgroundColor = .clear
        appointmentTableView.showsVerticalScrollIndicator = false
        appointmentTableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(appointmentTableView)
        let height = UIApplication.shared.windows.filter({$0.isKeyWindow}).first?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0
        appointmentTableView.topAnchor.constraint(equalTo: view.topAnchor, constant: height+55).isActive = true
        appointmentTableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        appointmentTableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        appointmentTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        contactButton = UIButton(frame: .zero)
        let targetHeight = CGFloat(35)
        let newImage = UtilsHelper.resizeImage(image: UIImage(named: "wpWhatsApp")!, targetHeight: targetHeight)
        contactButton.setImage(newImage, for: .normal)
        contactButton.layer.borderColor = institutionalColors.grayLightColor.cgColor
        contactButton.layer.borderWidth = 2
        contactButton.layer.cornerRadius = 30
        contactButton.backgroundColor = institutionalColors.grayLightColor
        contactButton.isUserInteractionEnabled = true
        contactButton.translatesAutoresizingMaskIntoConstraints = false
        contactButton.addTarget(self, action: #selector(saveAction), for: .touchUpInside)
        view.addSubview(contactButton)
        contactButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20).isActive = true
        contactButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        contactButton.widthAnchor.constraint(equalToConstant: 60).isActive = true
        contactButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        self.view.bringSubviewToFront(contactButton)
        
    }
}

// MARK: - TableView methods

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //TODO: COMENTAR
        return professionalDummyInfo.count
        //TODO: DESCOMENTAR PARA CORRECTO FUNCIONAMIENTO
        //return professionalDataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
        if let cell = cell as? AppointmentTableViewCell {
            //TODO: COMENTAR
            cell.setupCellWithDummy(professionalItem: professionalDummyInfo[indexPath.row])
            //TODO: DESCOMENTAR PARA CORRECTO FUNCIONAMIENTO
            //cell.setupCellWith(professionalItem: professionalDataSource[indexPath.row])
        }
        return cell
    }
   
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let contextItem = UIContextualAction(style: .destructive, title: "Cancelar cita") {  (contextualAction, view, boolValue) in
            
            //TODO: COMENTAR
            self.deleteAppointmentDummyAt(indexPath: indexPath)
            //TODO: DESCOMENTAR PARA CORRECTO FUNCIONAMIENTO
            //self.deleteAppointmentAt(indexPath: indexPath)
        }
        let swipeActions = UISwipeActionsConfiguration(actions: [contextItem])

        return swipeActions
    }
}

// MARK: - Buttons methods

extension HomeViewController {
    @objc func saveAction(){
        UtilsHelper.showWhatsapp(phone: "522226964313")
    }
}


// MARK: - Call services

extension HomeViewController {
    private func getProfessionalItems(){
        //1.- Indicar la carga al usuario
        SVProgressHUD.show()
        //2.- Consumir el servicio
        SN.get(endpoint: Endpoints.getPosts) { (response: SNResultWithEntity<[ProfessionalInfo], ErrorResponse>) in
            //Cerramos el indicador de carga
            SVProgressHUD.dismiss()
            
            switch response {
            case .success(let professionalItems):
                
                self.professionalDataSource = professionalItems
                self.appointmentTableView.reloadData()
                
            case .error(let error):
                
                NotificationBanner(title: "Error", subtitle: "Hubo un error en tu proceso de autenticación: \(error.localizedDescription)", style: .danger).show()
                
            case .errorResult(let entity):
                
                NotificationBanner(title: "Error", subtitle: "Hubo un error: \(entity.error)", style: .warning).show()
                
            }
        }
    }
    
    private func deleteAppointmentAt(indexPath: IndexPath) {
        //1.- Indicar la carga al usuario
        SVProgressHUD.show()
        
        let appointmentID = professionalDataSource[indexPath.row].id
        let endpoint = Endpoints.delete + appointmentID
        
        SN.delete(endpoint: endpoint) { (result: SNResultWithEntity<GeneralResponse, ErrorResponse>) in
            //Cerramos el indicador de carga
            SVProgressHUD.dismiss()
            
            switch result {
            case .success:
                
                //Borrar el post de professionalDataSource
                self.professionalDataSource.remove(at: indexPath.row)
                
                //Borrar la celda de la tabla
                self.appointmentTableView.deleteRows(at: [indexPath], with: .left)
                
            case .error(let error):
                
                NotificationBanner(title: "Error", subtitle: "Hubo un error en tu proceso de autenticación: \(error.localizedDescription)", style: .danger).show()
                
            case .errorResult(let entity):
                
                NotificationBanner(title: "Error", subtitle: "Hubo un error: \(entity.error)", style: .warning).show()
            }
        }
    }
}

// MARK: - Standar methods

extension HomeViewController {
    
    private func deleteAppointmentDummyAt(indexPath: IndexPath) {
        self.professionalDummyInfo.remove(at: indexPath.row)
        self.appointmentTableView.deleteRows(at: [indexPath], with: .left)
    }
}

// MARK: - NavigationBar

extension HomeViewController: NavigationViewDelegate{
    
    private func setupNavigationBar() {
        navigationView.setTitle(title: "Mis consultas")
        navigationView.setUpView(like: NavigationItemType.NONE)
        navigationView.delegate = self
    }
    
}
