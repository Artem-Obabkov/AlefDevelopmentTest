//
//  ChildCellExtension.swift
//  AlefDevelopmentTestWork
//
//  Created by pro2017 on 09/11/2021.
//

import Foundation
import UIKit

extension ChildCell {
    
    func setupCellDesign() {
        
        // Дизайн для NameView
        self.nameView.layer.cornerRadius = 5
        
        // Дизайн для AgeView
        self.ageView.layer.cornerRadius = 5
    }
    
    func addAnimation(to button: UIButton) {
        
        // Анимация кнопки
        button.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
        
        UIView.animate(withDuration: 0.5,
                       delay: 0,
                       usingSpringWithDamping: 0.3,
                       initialSpringVelocity: 0.9,
                       options: .allowUserInteraction) {
            
            button.transform = CGAffineTransform(scaleX: 1, y: 1)
            
        }
    }
    
}
