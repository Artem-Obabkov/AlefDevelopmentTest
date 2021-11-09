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
    
    @IBOutlet weak var addChildButton: UIButton!
    @IBOutlet weak var clearButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Регистрируем ячейку
        tableView.register(ChildCell.registerNib(), forCellReuseIdentifier: ChildCell.cellIdentifier())
    }
    
    
    @IBAction func addChildAction(_ sender: UIButton) {
    }
    
    @IBAction func clearButtonAction(_ sender: UIButton) {
    }
    
}

// MARK: - TableViewDelegate, TableViewDataSource

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ChildCell.cellIdentifier()) as! ChildCell
        return cell
    }
    
}

