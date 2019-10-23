//
//  ScoreTableViewController.swift
//  Lesson01
//
//  Created by Igor on 22.10.2019.
//  Copyright © 2019 IgorLab. All rights reserved.
//

import UIKit

class ScoreTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Game.shared.results.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "ScoreCellReuseID", for: indexPath)
        cell = UITableViewCell.init(style: .subtitle, reuseIdentifier: "ScoreCellReuseID")
        // Configure the cell...
        cell.textLabel?.text = String("Верных ответов \(Game.shared.results[indexPath.row].rightAnswer) из \(Game.shared.results[indexPath.row].numberOfQuestions) вопросов")
        cell.detailTextLabel?.text = String("Процент верных ответов \(Game.shared.results[indexPath.row].percentRightAnswers)%")
        print(Game.shared.results[indexPath.row].percentRightAnswers)
        print(Game.shared.results[indexPath.row].rightAnswer)
        print(Game.shared.results[indexPath.row].numberOfQuestions)

        return cell
    }


}
