//
//  ViewController.swift
//  FooDetective
//
//  Created by Daniel Tran on 21/8/19.
//  Copyright © 2019 Saddle Club. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBAction func nextViewButtonPressed(_ sender: Any) {
        print("Button pressed")
        self.performSegue(withIdentifier: "DietTypeViewSegue", sender: self)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        print("View has loaded ;)")
    }


}

