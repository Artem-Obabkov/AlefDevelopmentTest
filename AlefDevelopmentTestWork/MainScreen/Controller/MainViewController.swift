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
        addAnimation(to: sender)
        
        tableView.isHidden = false
        
        let child = Child(name: "", age: "")
        childs.append(child)
        
        tableView.reloadData()
        
    }
    
    @IBAction func clearButtonAction(_ sender: UIButton) {
        addAnimation(to: sender)
        
    }
    
}

// MARK: - TableViewDelegate, TableViewDataSource

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return childs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: ChildCell.cellIdentifier()) as! ChildCell
        
        // Указываем делегату ячейки
        cell.delegate = self
        
        // Настраиваем ячейку
        cell.setupCellDesign()
        
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
    
    func shouldDelete() {
        print("Удалить")
    }
    
    func addNotification() {
        
        // Добавить нотификаторы для подъема и опускания collection view
        NotificationCenter.default.addObserver(self, selector: #selector(handleKeyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(handleKeyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        print("Text view открылось")
    }
    
    
    @objc func handleKeyboardWillShow(notification: Notification) {
        
        //collectionView.scrollToItem(at: IndexPath(row: messagesList.count - 1, section: chatSection), at: .top, animated: false)
    }
    
    @objc func handleKeyboardWillHide(notification: Notification) {
        
        //collectionView.scrollToItem(at: IndexPath(row: messagesList.count - 1, section: chatSection), at: .top, animated: false)
    }
}

