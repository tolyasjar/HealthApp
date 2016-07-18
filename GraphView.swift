//
//  GraphView.swift
//  Health_App
//
//  Created by Toleen Jaradat on 7/15/16.
//  Copyright © 2016 Toleen Jaradat. All rights reserved.
//

import UIKit

class GraphView: UIView {
    
    var noOfSteps :[NSNumber] = [NSNumber]()

    override init(frame: CGRect) {
        
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
        
       }
    
    func plot(noOfSteps :[NSNumber]) {
        
        self.noOfSteps = noOfSteps
        self.setNeedsDisplay()
    }
    
    override func drawRect(rect: CGRect) {

        var x = 25
        for i in  0...6 {
      
        UIColor.greenColor().setFill()
        let bar = UIBezierPath(rect: CGRect(x: x, y: 350, width: 30, height:(-1 * noOfSteps[i].integerValue)/20))
        bar.fill()
        x += 45
            
            }
        }
    }


