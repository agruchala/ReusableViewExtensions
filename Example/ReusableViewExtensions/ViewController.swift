//
//  ViewController.swift
//  ReusableViewExtensions
//
//  Created by Artur Gruchała on 04/12/2020.
//  Copyright (c) 2020 Artur Gruchała. All rights reserved.
//

import UIKit
import ReusableViewExtensions

class MyCell: UITableViewCell { }

class ViewController: UIViewController {

    let tableView = UITableView()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(MyCell.self)
        tableView.register(nibType: ExtraTableViewCell.self)
        tableView.dataSource = self
        tableView.backgroundColor = .white
        view.addSubview(tableView)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tableView.frame = view.bounds
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellToReturn: UITableViewCell
        switch indexPath.row % 2 {
        case 0:
            let cell: MyCell = tableView.dequeue(for: indexPath)
            cellToReturn = cell
        default:
            let cell: ExtraTableViewCell = tableView.dequeue(for: indexPath)
            cellToReturn = cell
        }
        
        cellToReturn.textLabel?.text = "\(indexPath)"
        return cellToReturn
    }
}
