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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func addTapped(_ sender: Any) {
        // create a task from the outlet information
        
        // access the core data
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let task = Task(context: context)
        
        task.name = taskNameTextField.text!
        task.important = importantSwitch.isOn
        
        // save the core data
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        

        // pop back
        navigationController?.popViewController(animated: true)
    }
    
    
    

}
