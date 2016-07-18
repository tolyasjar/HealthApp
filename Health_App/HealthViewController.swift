//
//  HealthViewController.swift
//  Health_App
//
//  Created by Toleen Jaradat on 7/15/16.
//  Copyright © 2016 Toleen Jaradat. All rights reserved.
//

import UIKit
import CoreMotion

class HealthViewController: UIViewController {
    
    var pedemeter :CMPedometer!
    
    var graphView : GraphView!
    var numberOfStepsArray : [Int] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.pedemeter = CMPedometer()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func publishFitnessRecordPressed(sender: AnyObject) {
        
        let weekArray: [String] = ["day1","day2","day3","day4","day5","day6","day7"]

        var previousValue: Int = 0
        
        for i in 1...7 {
            
        let calendar = NSCalendar.currentCalendar()
            let startDate = calendar.dateByAddingUnit(.Day, value: -i, toDate: NSDate(), options: [])
        
        self.pedemeter.queryPedometerDataFromDate(startDate!, toDate: NSDate()) { (data :CMPedometerData?, error :NSError?) in
            
            if error == nil {
            
            if let data = data {
                
            let todayStepsNumber = (data.numberOfSteps).integerValue - previousValue
                
            self.numberOfStepsArray.append(todayStepsNumber)
                
            print("The total number of steps since \(weekArray[i-1]) is: ",data.numberOfSteps)
                
            previousValue = (data.numberOfSteps).integerValue
                
            print(self.numberOfStepsArray)
                
                
                if (self.numberOfStepsArray.count == 7) {
                    
                    dispatch_async(dispatch_get_main_queue(),
                    {
                        
                    self.graphView = GraphView(frame: CGRectMake(10,200,350,350))
                    self.graphView.backgroundColor = UIColor.redColor()
                    self.view.addSubview(self.graphView)
                    self.graphView.plot((self.numberOfStepsArray))
                        
                })
              }
            }
           }
          }
        }
        
    } //end of IBAction
    
}
