//
//  TasksViewController.swift
//  Doit
//
//  Created by Jef Cunningham on 4/6/17.
//  Copyright © 2017 Jef Cunningham. All rights reserved.
//

import UIKit

class TasksViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var tasks : [Task] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tasks = makeTasks()
        
        tableView.dataSource = self
        tableView.delegate = self
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let task = tasks[indexPath.row]
        if task.important {
            cell.textLabel?.text = "⚠️\(task.name)"
        } else {
            cell.textLabel?.text = task.name
        }
        return cell
    }

    func makeTasks() -> [Task] {
        let task1 = Task()
        task1.name = "Have the craic"
        task1.important = false
    
        let task2 = Task()
        task2.name = "Think about a bus"
        task2.important = true
        
        let task3 = Task()
        task3.name = "Wear pants"
        task3.important = false

        return [task1, task2, task3]
    }
    
    @IBAction func plusTapped(_ sender: Any) {
        performSegue(withIdentifier: "addSegue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nextVC = segue.destination as! CreateTaskViewController
        nextVC.previousVC = self
    }
}
