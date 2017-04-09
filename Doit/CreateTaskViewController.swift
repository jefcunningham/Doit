//
//  CreateTaskViewController.swift
//  Doit
//
//  Created by Jef Cunningham on 4/6/17.
//  Copyright © 2017 Jef Cunningham. All rights reserved.
//

import UIKit

class CreateTaskViewController: UIViewController {

    @IBOutlet weak var taskNameTextField: UITextField!
    @IBOutlet weak var importantSwitch: UISwitch!
    
    // set up the previous view controller so I can send info over to it from here
    var previousVC = TasksViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func addTapped(_ sender: Any) {
        // create a task from the outlet information
        let task = Task()
        task.name = taskNameTextField.text!
        task.important = importantSwitch.isOn
        
        
        // add new task to the array in the other viewController
        previousVC.tasks.append(task)
        // you have to reload the tableview on the other viewController
        previousVC.tableView.reloadData()
        // animate back to the other viewController after pressing the button
        navigationController?.popViewController(animated: true)
    }
    
    
    

}
