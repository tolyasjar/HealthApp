//
//  GraphView.swift
//  Health_App
//
//  Created by Toleen Jaradat on 7/15/16.
//  Copyright © 2016 Toleen Jaradat. All rights reserved.
//

import UIKit

class GraphView: UIView {
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
        
       }
    
    override func drawRect(rect: CGRect) {
        
        //points test(examples)
        let day1Rect = CGRect(x: 25, y: 350, width: 30, height: -50)
        let day2Rect = CGRect(x: 70, y: 350, width: 30, height: -100)
        let day3Rect = CGRect(x: 115, y: 350, width: 30, height: -150)
        let day4Rect = CGRect(x: 160, y: 350, width: 30, height: -180)
        let day5Rect = CGRect(x: 205, y: 350, width: 30, height: -200)
        let day6Rect = CGRect(x: 250, y: 350, width: 30, height: -90)
        let day7Rect = CGRect(x: 295, y: 350, width: 30, height: -250)

        let arr: [CGRect]
        arr = [day1Rect,day2Rect,day3Rect,day4Rect,day5Rect,day6Rect,day7Rect]
        
        let context = UIGraphicsGetCurrentContext()
        CGContextSetStrokeColorWithColor(context,UIColor.blueColor().CGColor)
        
        print("In graphView UIView")
        
        for i in  0...6 {
            
        let rectangle = arr[i]
        CGContextAddRect(context, rectangle)
        CGContextStrokePath(context)

        }
    }

}
