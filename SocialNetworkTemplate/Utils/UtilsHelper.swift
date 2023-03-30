//
//  UtilsHelper.swift
//  SocialNetworkTemplate
//
//  Created by Christopher Guarneros Diaz on 29/03/23.
//

import UIKit

class UtilsHelper: NSObject {

    public class func getImage(image: String) -> UIImage {
        let bundle = Bundle.main
        if let aImage = UIImage(named: image, in: bundle, compatibleWith: nil) {
            return aImage
        }
        return UIImage()
    }
    
}
