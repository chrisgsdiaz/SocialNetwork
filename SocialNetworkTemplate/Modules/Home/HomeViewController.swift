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
    
    var appointment: UITableView! = UITableView(frame: .zero)
    var clearView: UIView!
    var userName: String!
    
    //MARK: Properties
    
    private let cellID = "AppointmentTableViewCell"
    let images = ["ana", "karen", "leo", "israel"]
    let brandImage = "wpBrand"

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.title = "Mis Consultas"
        setupUI()
        setupTableView()
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
    
    private func getPost(){
        
    }
    
}

// MARK: - TableView methods

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
        if let cell = cell as? AppointmentTableViewCell {
            cell.boldDoctorLabel.text = "Médico especialista"
            cell.doctorLabel.text = "Ana Cristina Zuñiga Herrera"
            cell.boldFieldAreaLabel.text = "Especialidad"
            cell.fieldAreaLabel.text = "Ortodoncia"
            cell.boldDateAppointmentLabel.text = "Fecha y hora"
            cell.dateAppointmentLabel.text = "11 de junio 2023 a las 18:20 hrs."
            cell.doctorImageView.image = UtilsHelper.getImage(image: images[0])
            cell.brandImageView.image = UtilsHelper.getImage(image: "wpBrand")
        }
        return cell
    }
    
    private func setupTableView() {
                
        appointment.register(AppointmentTableViewCell.self, forCellReuseIdentifier: cellID)
        appointment.dataSource = self
        appointment.delegate = self
        appointment.estimatedRowHeight = UITableView.automaticDimension
        appointment.rowHeight = UITableView.automaticDimension
        appointment.insetsContentViewsToSafeArea = false
        appointment.separatorStyle = .none
        appointment.allowsSelection = false
        //appointment.separatorColor = .gray
        appointment.showsVerticalScrollIndicator = false
        appointment.translatesAutoresizingMaskIntoConstraints = false
        clearView.addSubview(appointment)
        let height = UIApplication.shared.windows.filter({$0.isKeyWindow}).first?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0
        appointment.topAnchor.constraint(equalTo: clearView.topAnchor, constant: height+45).isActive = true
        appointment.leftAnchor.constraint(equalTo: clearView.leftAnchor).isActive = true
        appointment.rightAnchor.constraint(equalTo: clearView.rightAnchor).isActive = true
        appointment.bottomAnchor.constraint(equalTo: clearView.bottomAnchor).isActive = true
        
    }
}
