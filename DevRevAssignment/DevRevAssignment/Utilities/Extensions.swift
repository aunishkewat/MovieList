//
//  Extensions.swift
//  DevRevAssignment
//
//  Created by ST IOS Dev10 on 03/03/24.
//

import Foundation
import UIKit

extension UIImageView {
    func loadImage(fromURL urlString: String) {
        if let imageURL = URL(string: urlString) {
            URLSession.shared.dataTask(with: imageURL) { data, response, error in
                if let error = error {
                    print("Error downloading image: \(error.localizedDescription)")
                    return
                }
                if let data = data, let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self.image = image
                    }
                }
            }.resume()
        }

    }
}


extension DateFormatter {
    static let movieReleaseDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd MMM yyyy"
        return formatter
    }()
}

extension UIView {
    class var identifier: String {
        return String(describing: self)
    }
    
    class var nib: UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
}

extension UIViewController {
    
    func navigateToNextViewController(controller : UIViewController){
        DispatchQueue.main.async {
            if let navVC = self.navigationController{
                navVC.pushViewController(controller, animated: true)
            } else {
                controller.modalPresentationStyle = .fullScreen
                self.present(controller,animated: false,completion: nil)
            }
        }
    }
    
    func navigateToBackViewController() {
        DispatchQueue.main.async {
            if let navVC = self.navigationController {
                navVC.popViewController(animated: true)
            } else {
                self.dismiss(animated: false, completion: nil)
            }
        }
    }
}
