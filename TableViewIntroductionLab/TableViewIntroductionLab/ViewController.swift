//
//  ViewController.swift
//  TableViewIntroductionLab
//
//  Created by Benjamin Stone on 8/6/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // outlets & variables
    @IBOutlet weak var tableView: UITableView!
   
    var tasks = [[Task]]() {
        didSet {
            
            
            // once it gets something(information) it refreshes the view regardless
            tableView.reloadData()
            
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.dataSource = self
//        loadData()
        
        print("There are \(Task.allTasks.count) tasks in total") // is empty
        
        // giving it the information to use here
        tasks = [Task.allTasks]
    }
    
    /*
     func loadData() {
     taskVariable =
     Task.getSections
     }
        */

}

extension ViewController : UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        // adds how many cell into the story board
        return tasks.count
        
       }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // tells what cell to use
        let cell = tableView.dequeueReusableCell(withIdentifier: "taskCell", for: indexPath)
        // tells where the info should go. what it should say
        
        
        // what info should be used
        //to access array of array use both section and index??
        let task = tasks[indexPath.section][indexPath.row]
        
        
        //where it goes
        cell.textLabel?.text = "\(task.name) \(task.dueDate)"
        cell.textLabel?.text = "\(task.dueDate)"
            
            
//        cell.textLabel?.text = "\(tasks.name)  \(tasks.dueDate)"
//        cell.detailTextLabel?.text = "\(tasks.status)"
        return cell
    }
    
    
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return tasks[section].first?.status
//    }
    
    
}

