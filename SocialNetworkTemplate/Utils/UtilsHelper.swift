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
    
    public class func resizeImage(image: UIImage, targetHeight: CGFloat) -> UIImage {
        // Get current image size
        let size = image.size

        // Compute scaled, new size
        let heightRatio = targetHeight / size.height
        let newSize = CGSize(width: size.width * heightRatio, height: size.height * heightRatio)
        let rect = CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height)

        // Create new image
        UIGraphicsBeginImageContextWithOptions(newSize, false, 0)
        image.draw(in: rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        // Return new image
        return newImage!
    }
    
    public class func showWhatsapp(phone: String) {        
        let urlWhats = "whatsapp://send?phone=\(phone)"
        if let urlString = urlWhats.addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed) {
            if let whatsappURL = URL(string: urlString) {
                if UIApplication.shared.canOpenURL(whatsappURL) {
                    UIApplication.shared.open(whatsappURL, options: [:], completionHandler: nil)
                } else {
                    if let urlWhats = URL(string: "itms-apps://itunes.apple.com/mx/app/id310633997") {
                        UIApplication.shared.open(urlWhats, options:  [:], completionHandler: nil)
                    }
                }
            }
        }
    }
    
}
