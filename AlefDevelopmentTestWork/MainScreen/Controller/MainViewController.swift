//
//  MainViewController.swift
//  AlefDevelopmentTestWork
//
//  Created by pro2017 on 09/11/2021.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var ageTF: UITextField!
    
    @IBOutlet weak var nameView: UIView!
    @IBOutlet weak var ageView: UIView!
    
    
    @IBOutlet weak var addChildButton: UIButton!
    @IBOutlet weak var clearButton: UIButton!
    
    
    
    var childs = [Child]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Настраиваем дизайн
        viewsDesign()
        buttonDesign()
        
        // Добавляем жест для яскрытия клавиатуры
        addTapGesture()
        
        // Регистрируем ячейку
        tableView.register(ChildCell.registerNib(), forCellReuseIdentifier: ChildCell.cellIdentifier())
        
    }
    
    
    @IBAction func addChildAction(_ sender: UIButton) {
        self.addAnimation(to: sender)
        self.view.endEditing(true)
        
        let child = Child(name: nil, age: nil)
        self.childs.append(child)
        
        print("Массив: \(self.childs)")
        
        self.tableView.reloadData()
        
        if childs.count == 5 {
            self.addChildButton.isHidden = true
            return
        }
    }
    
    @IBAction func clearButtonAction(_ sender: UIButton) {
        self.addAnimation(to: sender)
        self.addChildButton.isHidden = false
        
        print("Массив перед удалением: \(self.childs)")
        self.childs.removeAll()
        
        self.tableView.reloadData()
    }
    
}

// MARK: - TableViewDelegate, TableViewDataSource

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return childs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: ChildCell.cellIdentifier()) as! ChildCell
        
        let child = childs[indexPath.row]
        
        // Указываем делегату ячейки
        cell.delegate = self
        
        // Настраиваем ячейку
        cell.setupCellDesign()
        cell.indexPath = indexPath
        
        cell.setupWith(child: child)
        
        return cell
    }
    
    
    // Закрываем клавиатуру при нажатии на экран
    private func addTapGesture() {
        
        // Добавляем жест для скрытия клавиатуры при нажатии на tableView
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        
        tapGesture.cancelsTouchesInView = true
        
        self.view.addGestureRecognizer(tapGesture)
    }
    
    @objc func hideKeyboard() {
        self.view.endEditing(true)
    }
    
}

// MARK: - Get data from cells

extension MainViewController: ChildCellDelegate {
    
    func shouldDelete(at indexPath: IndexPath) {
        
        self.childs.remove(at: indexPath.row)
        
        self.tableView.reloadData()
        
        if self.childs.count < 5 {
            self.addChildButton.isHidden = false
        }
    }
    
    func addNotification(at indexPath: IndexPath, child: Child) {
        
        print("Элемент массива номер: '\(indexPath.row)")
        print("Массив перед удалением", self.childs)
        self.childs[indexPath.row] = child
        
        print("Массив после редактирования \(self.childs)")
        self.tableView.reloadData()
        
        
//        // Добавить нотификаторы для подъема и опускания collection view
//        NotificationCenter.default.addObserver(self, selector: #selector(handleKeyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
//
//        NotificationCenter.default.addObserver(self, selector: #selector(handleKeyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        print("Text view открылось")
    }
    
    
    @objc func handleKeyboardWillShow(notification: Notification) {
        
        //collectionView.scrollToItem(at: IndexPath(row: messagesList.count - 1, section: chatSection), at: .top, animated: false)
    }
    
    @objc func handleKeyboardWillHide(notification: Notification) {
        print("Клавиатура спряталаьс")
        
        //collectionView.scrollToItem(at: IndexPath(row: messagesList.count - 1, section: chatSection), at: .top, animated: false)
    }
}

