/**App Name: BMI Calculator
Version: 1.0
Created on: 16-12-2022
 
Created by:
 
Vaishnavi Santhapuri 301307031
 
 Description:
 This is a BMI Calcluator App.
 The BMI Calculator takes the input as weight and height in two different metrics
 The two different metrics are Inches/lbs and cm/kgs
 I have used slider for the two inputs
 Once clicking on Add button, the values will be stored into the core data.
 We can delete the records using the swipe functionality from right to left.

*/

import UIKit

class BMITableTableViewController: UITableViewController {
    
    var bmidata : [BMICoreData] = [] //variable for bmi core data
    
    var selectedBMI : BMICoreData?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        getbmi() //add view for table cell
    }
    
    func getbmi()
    {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
        {
            
            if let coreDatabmi = try? context.fetch(BMICoreData.fetchRequest()) as? [BMICoreData]
            {
                if let corebmi = coreDatabmi
                {
                    bmidata = corebmi
                    tableView.reloadData() //reload the cells
                }
            }
        }
    }

    // MARK: - Table view data source

   

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return bmidata.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tablecell", for: indexPath)
        let bmicell = bmidata[indexPath.row]
        
        // Configure the cell...
        
        cell.textLabel?.text = "Height: \(bmicell.height)  \nWeight: \(bmicell.weight) \nBMI: \(bmicell.bmival)" //output the data to cell
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
        {
            
            if editingStyle == UITableViewCell.EditingStyle.delete { //delete the item from cell and coredata
                context.delete(bmidata[indexPath.row])
                do {
                    try context.save()
                    tableView.reloadData()
                } catch let error as NSError {
                    print("Could not save. \(error), \(error.userInfo)")
                }
            }
        }
        
    }

}
