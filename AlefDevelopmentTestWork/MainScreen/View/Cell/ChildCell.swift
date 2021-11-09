//
//  ChildCell.swift
//  AlefDevelopmentTestWork
//
//  Created by pro2017 on 09/11/2021.
//

import UIKit

// Протокол, для передачи данных на MainVC
protocol ChildCellDelegate {
    func shouldDelete()
    func addNotification()
}

class ChildCell: UITableViewCell {
    
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var ageTF: UITextField!
    
    @IBOutlet weak var nameView: UIView!
    @IBOutlet weak var ageView: UIView!
    
    
    // Создаем экземпляр протокола для передачи данных
    var delegate: ChildCellDelegate?
    
    // Функции для регистрации ячейки
    static func registerNib() -> UINib {
        return UINib(nibName: "ChildCell", bundle: nil)
    }
    
    static func cellIdentifier() -> String {
        return "ChildCell"
    }
    
    @IBAction func deleteButtonAction(_ sender: UIButton) {
        
        addAnimation(to: sender)
        
        // Передаем данные
        if self.delegate != nil {
            delegate!.shouldDelete()
        }
        
    }
    
    @IBAction func nameTFAction(_ sender: UITextField) {
        
        if self.delegate != nil {
            delegate!.addNotification()
        }
    }
    
    @IBAction func ageTFAction(_ sender: UITextField) {
        
        if self.delegate != nil {
            delegate!.addNotification()
        }
    }
    
}
