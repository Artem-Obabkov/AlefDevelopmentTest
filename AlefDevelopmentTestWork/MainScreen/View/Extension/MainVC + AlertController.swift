//
//  MainVC + AlertController.swift
//  AlefDevelopmentTestWork
//
//  Created by pro2017 on 10/11/2021.
//

import Foundation
import UIKit

extension MainViewController {
    
    func createAlert(with title: String, message: String) {
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
        
        let cancelAction = UIAlertAction(title: "Отменить", style: .cancel) { _ in }
        
        let deleteAction = UIAlertAction(title: "Удалить", style: .destructive) { [weak self] alert in
            
            self?.nameTF.text = ""
            self?.ageTF.text = ""
            
            self?.childs.removeAll()
            self?.tableView.reloadData()
            
        }
        
        alertController.addAction(deleteAction)
        alertController.addAction(cancelAction)
        
        self.present(alertController, animated: true)
    }
}
