//
//  ItemDescViewController.swift
//  FooDetective
//
//  Created by Marc Sheldon Pulumbarit on 25/9/19.
//  Copyright © 2019 Saddle Club. All rights reserved.
//

import UIKit

class ItemDescViewController: UIViewController {

    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var myImageView: UIImageView!
    
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var myImageView2: UIImageView!
    

    @IBOutlet weak var strawb: UIButton!
    
    @IBOutlet weak var egg: UIButton!
    @IBOutlet weak var avo: UIButton!
    
    @IBOutlet weak var almond: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        /*
        switch list[myIndex]{
        case "Strawberry":
            strawb.isHidden = false
            
        default:
            strawb.isHidden = true
            avo.isHidden = true
            egg.isHidden = true
        }
 */
     
        
         if list[myIndex] == "Strawberry" {
            self.strawb.isHidden = false
            self.avo.isHidden = true
            self.egg.isHidden = true
            self.almond.isHidden = true
            
        }

        if list[myIndex] == "Egg" {
            self.egg.isHidden = false
            self.avo.isHidden = true
            self.strawb.isHidden = true
            self.almond.isHidden = true
            
        }
        
        if list[myIndex] == "Avocado" {
            self.avo.isHidden = false
            self.egg.isHidden = true
            self.strawb.isHidden = true
            self.almond.isHidden = true
            
        }
        
        if list[myIndex] == "Almond" {
            self.almond.isHidden = false
            self.egg.isHidden = true
            self.strawb.isHidden = true
            self.avo.isHidden = true
            
        }
        

        // Do any additional setup after loading the view.
        
        //titleLabel.text = list[myIndex]
        myImageView.image = UIImage(named: list[myIndex] + ".png")
     
    }
    
   
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
