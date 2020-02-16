//
//  EggViewController.swift
//  FooDetective
//
//  Created by Marc Sheldon Pulumbarit on 16/9/19.
//  Copyright © 2019 Saddle Club. All rights reserved.
//

import UIKit

class EggViewController: UIViewController {
    
    @IBOutlet weak var input: UITextField!
    
    @IBAction func GoToKetodex(_ sender: Any) {
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

