//
//  ViewController.swift
//  TestTaskGraphicsContext
//
//  Created by Алексей on 02.03.2023.
//

import UIKit

class ViewController: UIViewController {
    
    let circleView = CircleView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view = circleView
        
    }
}
