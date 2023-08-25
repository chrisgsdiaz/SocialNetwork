//
//  ProfessionalInfo.swift
//  SocialNetworkTemplate
//
//  Created by Christopher Guarneros Diaz on 25/08/23.
//

import Foundation

struct ProfessionalInfo: Codable {
    let id: String
    let author: User
    let fieldArea: String
    let dateAppointment: String
    let hasImage: Bool
    let imageUrl: String
    let createdAt: String
}
