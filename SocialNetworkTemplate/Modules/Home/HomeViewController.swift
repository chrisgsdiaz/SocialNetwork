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

class HomeViewController: UIViewController {
    
    var appointmentTableView: UITableView! = UITableView(frame: .zero)
    var clearView: UIView!
    var userName: String!
    
    //MARK: Properties
    
    private let cellID = "AppointmentTableViewCell"
    let doctors = ["Dra. Ana Cristina Zuñiga Herrera", "Dra. Karen Ramirez", "Dr. Leonardo Antonio Guerrero Bautista", "Dr. Israel Reyes"]
    let specialties = ["Odontóloga", "Estomatologa", "Odontólogo", "Ortodoncista"]
    let dates = ["11 de junio 2023 a las 18:20 hrs.", "11 de julio 2023 a las 18:50 hrs.", "11 de agosto 2023 a las 18:40 hrs.", "11 de septiembre 2023 a las 18:10 hrs."]
    let images = ["ana", "karen", "leo", "israel"]
        
    private var dataSource = [Post]()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.title = "Mis Consultas"
        setupUI()
        setupTableView()
        //TODO: DESCOMENTAR PARA CORRECTO FUNCIONAMIENTO
        //getPosts()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        NotificationBanner(subtitle: "Bienvenido \(userName ?? "")", style: .success).show()
    }

}

// MARK: - UI interfaces

extension HomeViewController {
    
    private func setupUI() {
        
        clearView = UIView()
        clearView.backgroundColor = .clear
        clearView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(clearView)
        clearView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        clearView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        clearView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        clearView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
    }
    
    private func getPosts(){
        //1.- Indicar la carga al usuario
        SVProgressHUD.show()
        //2.- Consumir el servicio
        SN.get(endpoint: Endpoints.getPosts) { (response: SNResultWithEntity<[Post], ErrorResponse>) in
            //Cerramos el indicador de carga
            SVProgressHUD.dismiss()
            
            switch response {
            case .success(let posts):
                
                self.dataSource = posts
                self.appointmentTableView.reloadData()
                
            case .error(let error):
                
                NotificationBanner(title: "Error", subtitle: "Hubo un error en tu proceso de autenticación: \(error.localizedDescription)", style: .danger).show()
                
            case .errorResult(let entity):
                
                NotificationBanner(title: "Error", subtitle: "Hubo un error: \(entity.error)", style: .warning).show()
                
            }
        }
    }
    
}

// MARK: - TableView methods

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //TODO: COMENTAR
        return doctors.count
        //TODO: DESCOMENTAR PARA CORRECTO FUNCIONAMIENTO
        //return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
        if let cell = cell as? AppointmentTableViewCell {
            //TODO: COMENTAR
            cell.setupCellDummy(doctor: doctors[indexPath.row], area: specialties[indexPath.row], dateAppointment: dates[indexPath.row], imageDoctor: images[indexPath.row])
            //TODO: DESCOMENTAR PARA CORRECTO FUNCIONAMIENTO
            //cell.setupCellWith(post: dataSource[indexPath.row])
        }
        return cell
    }
    
    private func setupTableView() {
                
        appointmentTableView.register(AppointmentTableViewCell.self, forCellReuseIdentifier: cellID)
        appointmentTableView.dataSource = self
        appointmentTableView.delegate = self
        appointmentTableView.estimatedRowHeight = UITableView.automaticDimension
        appointmentTableView.rowHeight = UITableView.automaticDimension
        appointmentTableView.insetsContentViewsToSafeArea = false
        appointmentTableView.separatorStyle = .none
        appointmentTableView.allowsSelection = false
        //appointment.separatorColor = .gray
        appointmentTableView.showsVerticalScrollIndicator = false
        appointmentTableView.translatesAutoresizingMaskIntoConstraints = false
        clearView.addSubview(appointmentTableView)
        let height = UIApplication.shared.windows.filter({$0.isKeyWindow}).first?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0
        appointmentTableView.topAnchor.constraint(equalTo: clearView.topAnchor, constant: height+45).isActive = true
        appointmentTableView.leftAnchor.constraint(equalTo: clearView.leftAnchor).isActive = true
        appointmentTableView.rightAnchor.constraint(equalTo: clearView.rightAnchor).isActive = true
        appointmentTableView.bottomAnchor.constraint(equalTo: clearView.bottomAnchor).isActive = true
        
    }
}
