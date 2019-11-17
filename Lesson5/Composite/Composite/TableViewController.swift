//
//  TableViewController.swift
//  Composite
//
//  Created by Igor on 17.11.2019.
//  Copyright © 2019 Igor Gapanovich. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    var tasks: [Task] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        addNavigationBarButtonItem()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "ReuseID")
    }
    
    func addNavigationBarButtonItem() {
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTask))
        navigationItem.rightBarButtonItem = addButton
    }
    
    @objc func addTask() {
        let numberEvent = tasks.count + 1
        let task = Event.init(name: "Task number: \(numberEvent)")
        for i in 0...3 {
            let subTask = Event.init(name: "Task number: \(i + 1)")
            task.addEvents(subTask)
        }
        tasks.append(task)
        tableView.reloadData()
    }
    

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return tasks.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "ReuseID", for: indexPath)
        let cell = UITableViewCell.init(style: .subtitle, reuseIdentifier: "ReuseID")

        // Configure the cell...
        cell.textLabel?.text = tasks[indexPath.row].name
        cell.detailTextLabel?.text = "SubTasks count: \(tasks[indexPath.row].events.count)"

        return cell
    }
    
    // MARK: - Navigation
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let newVC = TableViewController.init()
        newVC.tasks = tasks[indexPath.row].events
        tasks[indexPath.row].description()
        navigationController?.show(newVC, sender: nil)
    }
    
}
