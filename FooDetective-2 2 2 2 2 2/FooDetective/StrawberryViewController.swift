//
//  StrawberryViewController.swift
//  FooDetective
//
//  Created by Nat Sundara on 16/9/19.
//  Copyright © 2019 Saddle Club. All rights reserved.
//

import UIKit

class StrawberryViewController: UIViewController {
   
    @IBOutlet weak var input: UITextField!

    
    @IBAction func additem(_ sender: Any)
    {
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
