//
//  AppointmentTableViewCell.swift
//  SocialNetworkTemplate
//
//  Created by Christopher Guarneros Diaz on 11/04/23.
//

import UIKit

class AppointmentTableViewCell: UITableViewCell {
    
    // MARK: - Variables
    
    var clearView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = institutionalColors.grayLightColor.withAlphaComponent(0.2)
        view.clipsToBounds = true
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var fieldAreaLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.textAlignment = .left
        label.textColor = .black
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var doctorLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.textAlignment = .left
        label.textColor = .black
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var dateAppointmentLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.textAlignment = .left
        label.textColor = .black
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var doctorImageView: UIImageView = {
        let img = UIImageView(frame: .zero)
        img.contentMode = .scaleAspectFill
        img.clipsToBounds = true
        img.layer.cornerRadius = 45
        img.layer.borderColor = UIColor.white.cgColor
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
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupConstraints(){
        
        contentView.addSubview(clearView)
        clearView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5).isActive = true
        clearView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20).isActive = true
        clearView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -20).isActive = true
        clearView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5).isActive = true
        
        clearView.addSubview(doctorImageView)
        doctorImageView.centerYAnchor.constraint(equalTo: clearView.centerYAnchor).isActive = true
        doctorImageView.heightAnchor.constraint(equalToConstant: 90).isActive = true
        doctorImageView.widthAnchor.constraint(equalToConstant: 90).isActive = true
        doctorImageView.leftAnchor.constraint(equalTo: clearView.leftAnchor, constant: 10).isActive = true
        
        clearView.addSubview(doctorLabel)
        doctorLabel.topAnchor.constraint(equalTo: clearView.topAnchor, constant: 15).isActive = true
        doctorLabel.leftAnchor.constraint(equalTo: doctorImageView.rightAnchor, constant: 10).isActive = true
        doctorLabel.rightAnchor.constraint(equalTo: clearView.rightAnchor).isActive = true
        
        clearView.addSubview(fieldAreaLabel)
        fieldAreaLabel.topAnchor.constraint(equalTo: doctorLabel.bottomAnchor, constant: 10).isActive = true
        fieldAreaLabel.leftAnchor.constraint(equalTo: doctorImageView.rightAnchor, constant: 10).isActive = true
        fieldAreaLabel.rightAnchor.constraint(equalTo: clearView.rightAnchor).isActive = true
        
        clearView.addSubview(dateAppointmentLabel)
        dateAppointmentLabel.topAnchor.constraint(equalTo: fieldAreaLabel.bottomAnchor, constant: 10).isActive = true
        dateAppointmentLabel.leftAnchor.constraint(equalTo:  doctorImageView.rightAnchor, constant: 10).isActive = true
        dateAppointmentLabel.rightAnchor.constraint(equalTo: clearView.rightAnchor).isActive = true
        dateAppointmentLabel.bottomAnchor.constraint(equalTo: clearView.bottomAnchor, constant: -10).isActive = true
        
    }
    
    func setupCellWith(post: Post) {
        doctorLabel.text = post.author.names
    }

}
