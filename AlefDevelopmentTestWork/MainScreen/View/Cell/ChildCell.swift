//
//  ChildCell.swift
//  AlefDevelopmentTestWork
//
//  Created by pro2017 on 09/11/2021.
//

import UIKit

class ChildCell: UITableViewCell {
    
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var ageTF: UITextField!
    
    // Функции для регистрации ячейки
    static func registerNib() -> UINib {
        return UINib(nibName: "ChildCell", bundle: nil)
    }
    
    static func cellIdentifier() -> String {
        return "ChildCell"
    }
    
    @IBAction func deleteButtonAction(_ sender: UIButton) {
        print("Item deleted")
    }
    
}
