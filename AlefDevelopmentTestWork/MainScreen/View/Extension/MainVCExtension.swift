//
//  MainVCExtension.swift
//  AlefDevelopmentTestWork
//
//  Created by pro2017 on 09/11/2021.
//

import Foundation
import UIKit

extension MainViewController {
        
    func viewsDesign() {
        
        // Дизайн для NameView
        self.nameView.layer.cornerRadius = 5
        
        // Дизайн для AgeView
        self.ageView.layer.cornerRadius = 5
        
        // Убираем нижние разделители
        let footerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 1))
        self.tableView.tableFooterView = footerView
    }
    
    func buttonDesign() {
        
        // Дизайн кнопки добавить
        self.addChildButton.layer.cornerRadius = 20
        self.addChildButton.backgroundColor = UIColor.clear
        
        self.addChildButton.layer.borderWidth = 1.5
        self.addChildButton.layer.borderColor = UIColor.darkGray.cgColor
        
        // Дизайн кнопки очистить
        self.clearButton.layer.cornerRadius = 20
        self.clearButton.backgroundColor = UIColor.clear
        
        self.clearButton.layer.borderWidth = 1.5
        self.clearButton.layer.borderColor = UIColor.red.cgColor
    }
    
    func addAnimation(to button: UIButton) {
        
        // Анимация кнопки
        button.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
        
        UIView.animate(withDuration: 0.5,
                       delay: 0,
                       usingSpringWithDamping: 0.3,
                       initialSpringVelocity: 0.9,
                       options: .allowUserInteraction) {
            
            button.transform = CGAffineTransform(scaleX: 1, y: 1)
            
        }
    }
    
}
