//
//  CompleteTaskViewController.swift
//  Doit
//
//  Created by Jef Cunningham on 4/8/17.
//  Copyright © 2017 Jef Cunningham. All rights reserved.
//

import UIKit

class CompleteTaskViewController: UIViewController {

    @IBOutlet weak var taskLabel: UILabel!
    
    var task = Task()
    // set up the previous view controller so I can send info over to it from here
    var previousVC = TasksViewController()
        
    override func viewDidLoad() {
        super.viewDidLoad()

        if task.important {
            taskLabel.text = "⚠️\(task.name)"
        } else {
            taskLabel.text = task.name
        }
    }

    @IBAction func completeTapped(_ sender: Any) {
        previousVC.tasks.remove(at: previousVC.selectedIndex)
        // you have to reload the tableview on the other viewController
        previousVC.tableView.reloadData()
        // animate back to the other viewController after pressing the button
        navigationController?.popViewController(animated: true)
    }
   

}
