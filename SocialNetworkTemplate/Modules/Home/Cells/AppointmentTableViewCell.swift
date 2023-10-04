//
//  AppointmentTableViewCell.swift
//  SocialNetworkTemplate
//
//  Created by Christopher Guarneros Diaz on 11/04/23.
//

import UIKit
import Kingfisher

class AppointmentTableViewCell: UITableViewCell {
    
    // MARK: - Variables
    
    var clearView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = institutionalColors.whiteColor
        view.layer.shadowColor = institutionalColors.grayLightColor.cgColor
        view.layer.shadowOffset = CGSize(width: 3, height: 3)
        view.layer.shadowOpacity = 1.0
        view.layer.shadowRadius = 10.0
        view.layer.masksToBounds = false        
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var boldDoctorLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.textAlignment = .left
        label.textColor = .black
        label.font = label.font.boldItalic.withSize(10)
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var doctorLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.textAlignment = .left
        label.textColor = .black.withAlphaComponent(0.8)
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var boldFieldAreaLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.textAlignment = .left
        label.textColor = .black
        label.font = label.font.boldItalic.withSize(10)
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var fieldAreaLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.textAlignment = .left
        label.textColor = .black.withAlphaComponent(0.8)
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var boldDateAppointmentLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.textAlignment = .left
        label.textColor = .black
        label.font = label.font.boldItalic.withSize(10)
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var dateAppointmentLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.textAlignment = .left
        label.textColor = .black.withAlphaComponent(0.8)
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var doctorImageView: UIImageView = {
        let img = UIImageView(frame: .zero)
        img.contentMode = .scaleAspectFill
        img.clipsToBounds = true
        img.layer.cornerRadius = 50
        img.layer.borderColor = institutionalColors.whiteColor.cgColor
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    var brandImageView: UIImageView = {
        let img = UIImageView(frame: .zero)
        img.contentMode = .scaleAspectFit
        img.clipsToBounds = true
        img.layer.borderColor = institutionalColors.whiteColor.cgColor
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupConstraints()
        setupLabels()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupConstraints(){
        
        self.contentView.backgroundColor = institutionalColors.whiteColor
        
        self.contentView.addSubview(clearView)
        clearView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5).isActive = true
        clearView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20).isActive = true
        clearView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -20).isActive = true
        clearView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5).isActive = true
        
        self.contentView.addSubview(doctorImageView)
        doctorImageView.centerYAnchor.constraint(equalTo: clearView.centerYAnchor).isActive = true
        doctorImageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        doctorImageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        doctorImageView.leftAnchor.constraint(equalTo: clearView.leftAnchor, constant: 10).isActive = true
        
        self.contentView.addSubview(brandImageView)
        brandImageView.topAnchor.constraint(equalTo: doctorImageView.bottomAnchor, constant: 10).isActive = true
        brandImageView.centerXAnchor.constraint(equalTo: doctorImageView.centerXAnchor).isActive = true
        brandImageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        brandImageView.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        self.contentView.addSubview(boldDoctorLabel)
        boldDoctorLabel.topAnchor.constraint(equalTo: clearView.topAnchor, constant: 15).isActive = true
        boldDoctorLabel.leftAnchor.constraint(equalTo: doctorImageView.rightAnchor, constant: 10).isActive = true
        boldDoctorLabel.rightAnchor.constraint(equalTo: clearView.rightAnchor).isActive = true
        
        self.contentView.addSubview(doctorLabel)
        doctorLabel.topAnchor.constraint(equalTo: boldDoctorLabel.bottomAnchor, constant: 5).isActive = true
        doctorLabel.leftAnchor.constraint(equalTo: doctorImageView.rightAnchor, constant: 10).isActive = true
        doctorLabel.rightAnchor.constraint(equalTo: clearView.rightAnchor).isActive = true
        
        self.contentView.addSubview(boldFieldAreaLabel)
        boldFieldAreaLabel.topAnchor.constraint(equalTo: doctorLabel.bottomAnchor, constant: 15).isActive = true
        boldFieldAreaLabel.leftAnchor.constraint(equalTo: doctorImageView.rightAnchor, constant: 10).isActive = true
        boldFieldAreaLabel.rightAnchor.constraint(equalTo: clearView.rightAnchor).isActive = true
        
        self.contentView.addSubview(fieldAreaLabel)
        fieldAreaLabel.topAnchor.constraint(equalTo: boldFieldAreaLabel.bottomAnchor, constant: 5).isActive = true
        fieldAreaLabel.leftAnchor.constraint(equalTo: doctorImageView.rightAnchor, constant: 10).isActive = true
        fieldAreaLabel.rightAnchor.constraint(equalTo: clearView.rightAnchor).isActive = true
        
        self.contentView.addSubview(boldDateAppointmentLabel)
        boldDateAppointmentLabel.topAnchor.constraint(equalTo: fieldAreaLabel.bottomAnchor, constant: 15).isActive = true
        boldDateAppointmentLabel.leftAnchor.constraint(equalTo: doctorImageView.rightAnchor, constant: 10).isActive = true
        boldDateAppointmentLabel.rightAnchor.constraint(equalTo: clearView.rightAnchor).isActive = true
        
        self.contentView.addSubview(dateAppointmentLabel)
        dateAppointmentLabel.topAnchor.constraint(equalTo: boldDateAppointmentLabel.bottomAnchor, constant: 5).isActive = true
        dateAppointmentLabel.leftAnchor.constraint(equalTo:  doctorImageView.rightAnchor, constant: 10).isActive = true
        dateAppointmentLabel.rightAnchor.constraint(equalTo: clearView.rightAnchor).isActive = true
        dateAppointmentLabel.bottomAnchor.constraint(equalTo: clearView.bottomAnchor, constant: -10).isActive = true
        
    }
    
    func setupLabels() {
        self.boldDoctorLabel.text = "Médico especialista"
        self.boldFieldAreaLabel.text = "Especialidad"
        self.boldDateAppointmentLabel.text = "Fecha y hora"
        self.brandImageView.image = UtilsHelper.getImage(image: "wpBrand")
    }
    
    func setupCellWith(professionalItem: ProfessionalInfo) {
        doctorLabel.text = professionalItem.author.names
        fieldAreaLabel.text = professionalItem.fieldArea
        dateAppointmentLabel.text = professionalItem.dateAppointment
        
        if professionalItem.hasImage {
            doctorImageView.kf.setImage(with: URL(string: professionalItem.imageUrl))
        } else {
            doctorImageView.isHidden = true
        }
    }
    
    //TODO: COMENTAR
    func setupCellWithDummy(professionalItem: ProfessionalInfo) {
        
        self.doctorLabel.text = professionalItem.author.names
        self.fieldAreaLabel.text = professionalItem.fieldArea
        self.dateAppointmentLabel.text = professionalItem.dateAppointment
        if professionalItem.hasImage {
            self.doctorImageView.image = UtilsHelper.getImage(image: professionalItem.imageUrl)
        } else {
            self.doctorImageView.isHidden = true
        }
        
    }
}
