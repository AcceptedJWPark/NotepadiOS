//
//  Tutorial_Click_ViewController.swift
//  Notepad
//
//  Created by Accepted on 2020/08/21.
//  Copyright © 2020 Accepted. All rights reserved.
//

import UIKit

class Tutorial_Click_ViewController: UIViewController {

    @IBOutlet var lb1: UILabel!
    @IBOutlet var lb2: UILabel!
    
    @IBOutlet var lb3: UILabel!
    @IBOutlet var lb4: UILabel!
    @IBOutlet var lb5: UILabel!
    
    @IBOutlet var ivClick1: UIImageView!
    @IBOutlet var ivClick2: UIImageView!
    @IBOutlet var ivClick3: UIImageView!
    @IBOutlet var ivClick4: UIImageView!
    @IBOutlet var lbClick1: UILabel!
    @IBOutlet var lbClick2: UILabel!
    @IBOutlet var lbClick3: UILabel!
    @IBOutlet var lbClick4: UILabel!
    
    var clickType = 0
    
    @IBOutlet var nextBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.isNavigationBarHidden = true

        nextBtn.layer.cornerRadius = 10
        
        lb1.dynamicFont(fontSize: 26, weight: .semibold)
        lb2.dynamicFont(fontSize: 26, weight: .semibold)
        lb3.dynamicFont(fontSize: 20, weight: .regular)
        lb4.dynamicFont(fontSize: 20, weight: .regular)
        lb5.dynamicFont(fontSize: 20, weight: .regular)
        
        lbClick1.dynamicFont(fontSize: 17, weight: .regular)
        lbClick2.dynamicFont(fontSize: 17, weight: .regular)
        lbClick3.dynamicFont(fontSize: 17, weight: .regular)
        lbClick4.dynamicFont(fontSize: 17, weight: .regular)
        
        let tapGestureRecognizer1 = UITapGestureRecognizer(target: self, action: #selector(imageTapped1(tapGestureRecognizer:)))
        
        let tapGestureRecognizer2 = UITapGestureRecognizer(target: self, action: #selector(imageTapped2(tapGestureRecognizer:)))
        
        let tapGestureRecognizer3 = UITapGestureRecognizer(target: self, action: #selector(imageTapped3(tapGestureRecognizer:)))
        
        let tapGestureRecognizer4 = UITapGestureRecognizer(target: self, action: #selector(imageTapped4(tapGestureRecognizer:)))
        
        ivClick1.isUserInteractionEnabled = true
        ivClick1.addGestureRecognizer(tapGestureRecognizer1)
        
        ivClick2.isUserInteractionEnabled = true
        ivClick2.addGestureRecognizer(tapGestureRecognizer2)
        
        ivClick3.isUserInteractionEnabled = true
        ivClick3.addGestureRecognizer(tapGestureRecognizer3)
        
        
        ivClick4.isUserInteractionEnabled = true
        ivClick4.addGestureRecognizer(tapGestureRecognizer4)
        
        
        
    }
    
    
    @IBAction func nextBtn(_ sender: Any) {
        if(clickType>0)
        {
             self.performSegue(withIdentifier: "pageToTutorialClick2", sender: self)
        }else{
            return
        }
    }
    @objc func imageTapped1(tapGestureRecognizer: UITapGestureRecognizer)
    {
        clickType = 1
        ivClick1.image = UIImage(named: "click1_2")
        ivClick2.image = UIImage(named: "click2_1")
        ivClick3.image = UIImage(named: "click3_1")
        ivClick4.image = UIImage(named: "click4_1")
        nextBtn.backgroundColor = UIColor.init(displayP3Red: 243/255, green: 114/255, blue: 0, alpha: 1.0)
        
        
        lbClick1.dynamicFont(fontSize: 17, weight: .semibold)
        lbClick2.dynamicFont(fontSize: 17, weight: .regular)
        lbClick3.dynamicFont(fontSize: 17, weight: .regular)
        lbClick4.dynamicFont(fontSize: 17, weight: .regular)
        
        lbClick1.textColor = UIColor.init(displayP3Red: 243/255, green: 114/255, blue: 0, alpha: 1.0)
        lbClick2.textColor = UIColor.init(displayP3Red: 112/255, green: 112/255, blue: 112/255, alpha: 1.0)
        lbClick3.textColor = UIColor.init(displayP3Red: 112/255, green: 112/255, blue: 112/255, alpha: 1.0)
        lbClick4.textColor = UIColor.init(displayP3Red: 112/255, green: 112/255, blue: 112/255, alpha: 1.0)
        
    }
    
    @objc func imageTapped2(tapGestureRecognizer: UITapGestureRecognizer)
       {
        clickType = 2
        
        ivClick1.image = UIImage(named: "click1_1")
        ivClick2.image = UIImage(named: "click2_2")
        ivClick3.image = UIImage(named: "click3_1")
        ivClick4.image = UIImage(named: "click4_1")
        
        nextBtn.backgroundColor = UIColor.init(displayP3Red: 243/255, green: 114/255, blue: 0, alpha: 1.0)
        
        
        lbClick1.dynamicFont(fontSize: 17, weight: .regular)
        lbClick2.dynamicFont(fontSize: 17, weight: .semibold)
        lbClick3.dynamicFont(fontSize: 17, weight: .regular)
        lbClick4.dynamicFont(fontSize: 17, weight: .regular)
        
        lbClick2.textColor = UIColor.init(displayP3Red: 243/255, green: 114/255, blue: 0, alpha: 1.0)
        lbClick1.textColor = UIColor.init(displayP3Red: 112/255, green: 112/255, blue: 112/255, alpha: 1.0)
        lbClick3.textColor = UIColor.init(displayP3Red: 112/255, green: 112/255, blue: 112/255, alpha: 1.0)
        lbClick4.textColor = UIColor.init(displayP3Red: 112/255, green: 112/255, blue: 112/255, alpha: 1.0)
       }
    
    @objc func imageTapped3(tapGestureRecognizer: UITapGestureRecognizer)
       {
           clickType = 3
        
        ivClick1.image = UIImage(named: "click1_1")
        ivClick2.image = UIImage(named: "click2_1")
        ivClick3.image = UIImage(named: "click3_2")
        ivClick4.image = UIImage(named: "click4_1")
        
        nextBtn.backgroundColor = UIColor.init(displayP3Red: 243/255, green: 114/255, blue: 0, alpha: 1.0)
        
        
        lbClick1.dynamicFont(fontSize: 17, weight: .regular)
        lbClick2.dynamicFont(fontSize: 17, weight: .regular)
        lbClick3.dynamicFont(fontSize: 17, weight: .semibold)
        lbClick4.dynamicFont(fontSize: 17, weight: .regular)
        
        lbClick3.textColor = UIColor.init(displayP3Red: 243/255, green: 114/255, blue: 0, alpha: 1.0)
        lbClick2.textColor = UIColor.init(displayP3Red: 112/255, green: 112/255, blue: 112/255, alpha: 1.0)
        lbClick1.textColor = UIColor.init(displayP3Red: 112/255, green: 112/255, blue: 112/255, alpha: 1.0)
        lbClick4.textColor = UIColor.init(displayP3Red: 112/255, green: 112/255, blue: 112/255, alpha: 1.0)
       }
    
    @objc func imageTapped4(tapGestureRecognizer: UITapGestureRecognizer)
       {
           clickType = 4
        
        ivClick1.image = UIImage(named: "click1_1")
        ivClick2.image = UIImage(named: "click2_1")
        ivClick3.image = UIImage(named: "click3_1")
        ivClick4.image = UIImage(named: "click4_2")
        
        nextBtn.backgroundColor = UIColor.init(displayP3Red: 243/255, green: 114/255, blue: 0, alpha: 1.0)
        
        
        lbClick1.dynamicFont(fontSize: 17, weight: .regular)
        lbClick2.dynamicFont(fontSize: 17, weight: .regular)
        lbClick3.dynamicFont(fontSize: 17, weight: .regular)
        lbClick4.dynamicFont(fontSize: 17, weight: .semibold)
        
        lbClick4.textColor = UIColor.init(displayP3Red: 243/255, green: 114/255, blue: 0, alpha: 1.0)
        lbClick2.textColor = UIColor.init(displayP3Red: 112/255, green: 112/255, blue: 112/255, alpha: 1.0)
        lbClick3.textColor = UIColor.init(displayP3Red: 112/255, green: 112/255, blue: 112/255, alpha: 1.0)
        lbClick1.textColor = UIColor.init(displayP3Red: 112/255, green: 112/255, blue: 112/255, alpha: 1.0)
       }


}



