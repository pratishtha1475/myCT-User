//
//  UIView+Utils.swift
//  MyCtStore-User
//
//  Created by Ishita Ginoya on 07/06/22.
//

import Foundation
import UIKit
//MARK: - UIView extension
extension UIView {
     func set(corner: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corner, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
         mask.path = path.cgPath
        layer.mask = mask
    }
    
    func set(borderColor: UIColor, borderWidth: CGFloat) {
        self.layer.borderColor = borderColor.cgColor
        self.layer.borderWidth = borderWidth
        self.layer.masksToBounds = true
    }
    
    func set(cornerRadius: CGFloat) {
        self.layer.cornerRadius = cornerRadius
        self.layer.masksToBounds = true
    }
    
    func set(backgroundColor: UIColor) {
        self.layer.backgroundColor = backgroundColor.cgColor
        self.layer.masksToBounds = true
    }
}
//MARK: - text field extension
extension UITextField {
    enum Direction {
        case Left
        case Right
    }
    
    func withImage(direction: Direction, image: UIImage) {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 45))
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = #colorLiteral(red: 0.2310000062, green: 0.4120000005, blue: 0.4709999859, alpha: 1)
        imageView.frame = CGRect(x: 10, y: 8, width: 25, height: 25)
        view.addSubview(imageView)
        let seperatorView = UIView()
        view.addSubview(seperatorView)
        if(Direction.Left == direction){
            seperatorView.frame = CGRect(x: 45, y: 0, width: 5, height: 45)
            self.leftViewMode = .always
            self.leftView = view
        } else {
            seperatorView.frame = CGRect(x: 0, y: 0, width: 5, height: 45)
            self.rightViewMode = .always
            self.rightView = view
        }
    }
    
    func togglePasswordImage(button: UIButton) {
        isSecureTextEntry = !isSecureTextEntry
        if (isSecureTextEntry) {
            button.setImage(UIImage(systemName: "eye.slash"), for: .normal)
        } else {
            button.setImage(UIImage(systemName: "eye"), for: .normal)
        }
    }
}
//MARK: - UIButton extension
extension UIButton {
    func checkBoxAnimation(closure:@escaping () -> Void) {
        guard let image = self.imageView else { return }
        
        UIView.animate(withDuration: 0.1, delay: 0.1, options: .curveLinear, animations: {
            image.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
        }) { success in
            UIView.animate(withDuration: 0.1, delay: 0, options: .curveLinear, animations: {
                self.isSelected = !self.isSelected
                closure()
                image.transform = .identity
            }, completion: nil)
        }
    }
}

extension String {
    var trimmed: String {
        return String(self.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines))
    }
    
    func removeSingleDoubleQuotes() -> String {
        var resultstr = self.replacingOccurrences(of: "'", with: "")
        resultstr = resultstr.replacingOccurrences(of: "\"", with: "")
        return resultstr
    }
}
