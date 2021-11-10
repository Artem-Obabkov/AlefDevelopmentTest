//
//  ChildCell.swift
//  AlefDevelopmentTestWork
//
//  Created by pro2017 on 09/11/2021.
//

import UIKit

// Протокол, для передачи данных на MainVC
protocol ChildCellDelegate {
    func shouldDelete(at indexPath: IndexPath)
    func addNotification(at indexPath: IndexPath, child: Child)
}

class ChildCell: UITableViewCell {
    
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var ageTF: UITextField!
    
    @IBOutlet weak var nameView: UIView!
    @IBOutlet weak var ageView: UIView!
    
    
    // Создаем экземпляр протокола для передачи данных
    var delegate: ChildCellDelegate?
    
    var indexPath: IndexPath?
    var currentChild: Child?
    
    // Функции для регистрации ячейки
    static func registerNib() -> UINib {
        return UINib(nibName: "ChildCell", bundle: nil)
    }
    
    static func cellIdentifier() -> String {
        return "ChildCell"
    }
    
    override class func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    @IBAction func deleteButtonAction(_ sender: UIButton) {
        
        addAnimation(to: sender)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(150)) {
            
            self.nameTF.text = ""
            self.ageTF.text = ""
            self.contentView.endEditing(true)
            
            // Передаем данные
            if self.delegate != nil, let indexPath = self.indexPath {
                self.delegate!.shouldDelete(at: indexPath)
            }
        }
    }
    
    @IBAction func nameTFAction(_ sender: UITextField) {
        
        if self.delegate != nil, let indexPath = indexPath, self.currentChild != nil {
            
            // Устанавливаем занчения
            self.currentChild!.name = nameTF.text
            
            delegate!.addNotification(at: indexPath, child: self.currentChild!)
        }
        
    }
    
    
    @IBAction func ageTFAction(_ sender: UITextField) {
        
        if self.delegate != nil, let indexPath = indexPath, self.currentChild != nil {
            
            // Устанавливаем занчения

            if let ageInt = Int(ageTF.text!) {
                self.currentChild!.age = ageInt
            }
            
            delegate!.addNotification(at: indexPath, child: self.currentChild!)
        }
        
    }
    
    
    func setupWith(child: Child) {
        
        self.currentChild = child
        
        if self.currentChild?.name == nil && self.currentChild?.age == nil {
            
            self.nameTF.text = ""
            self.ageTF.text = ""
        }
        
        self.nameTF.text = self.currentChild?.name
        
        if self.currentChild?.age != nil {
            
            self.ageTF.text = String( (self.currentChild?.age)! )
            
        } else if self.currentChild?.age == nil {
            self.ageTF.text = ""
        }
    }
}

