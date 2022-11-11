//
//  ViewController.swift
//  UITableViewController
//
//  Created by Eвгений Павлюков on 16.09.2022.
//

import UIKit

class ViewController: UIViewController {
    
    var tableViewController = UITableViewController(style: .plain)
    
    var refresh = UIRefreshControl()
    
    var allTimes = [Date]()
    var cellIdentifier = "Cell"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        createTableView()
        
        self.refresh.addTarget(self, action: #selector(handleRefresh), for: .valueChanged)
        self.refresh.tintColor = .black
        
        view.addSubview(tableViewController.tableView)
        tableViewController.tableView.addSubview(refresh)
        
    }
    
    @objc func handleRefresh() {
        allTimes.append(Date())
        refresh.endRefreshing()
        let indexPathNewRow = IndexPath(row: allTimes.count - 1, section: 0)
        tableViewController.tableView.insertRows(at: [indexPathNewRow], with: .automatic)
    }
    
    
    func createTableView() {
        let tableView = UITableView(frame: view.bounds)
        tableViewController.tableView = tableView
        tableViewController.tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        tableViewController.tableView.delegate = self
        tableViewController.tableView.dataSource = self
    }
    
}


//MARK: - UITableViewController

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allTimes.count //сколько у нас ячеек
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        
        let date = allTimes[indexPath.row]
        cell.textLabel?.text = "\(date)"
        
        return cell
    }
    
    
}
