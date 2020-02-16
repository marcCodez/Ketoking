//
//  AvocadoViewController.swift
//  FooDetective
//
//  Created by Marc Sheldon Pulumbarit on 17/9/19.
//  Copyright © 2019 Saddle Club. All rights reserved.
//

import UIKit

class AvocadoViewController: UIViewController {
    

    @IBOutlet weak var input: UITextField!
    
    
    @IBAction func addItem(_ sender: Any) {
        if (input.text != "")
        {
            list.append(input.text!)
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
}
