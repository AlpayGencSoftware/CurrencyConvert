//
//  ViewController.swift
//  Currency Convert
//
//  Created by Alpay Genc on 19.07.2018.
//  Copyright © 2018 Liberty App Team. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var cadLabel: UILabel!
    
    @IBOutlet weak var chfLabel: UILabel!
    
    @IBOutlet weak var gbpLabel: UILabel!

    @IBOutlet weak var jpyLabel: UILabel!
    
    @IBOutlet weak var tryLabel: UILabel!
    
    @IBOutlet weak var usdLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

   
    @IBAction func getRates(_ sender: Any) {
   let url = URL(string: "http://data.fixer.io/api/latest?access_key=9eb47f88e927e31baafcadea8c6b48bc&format=1")
        
        let session =  URLSession.shared
        let task =  session.dataTask(with: url!, completionHandler: { (data, response, error) in
            
            if error != nil {
                let alert = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: UIAlertControllerStyle.alert)
                let okButton = UIAlertAction(title: "OK", style: UIAlertActionStyle.cancel, handler:  nil)
                
                alert.addAction(okButton)
                self.present(alert, animated: true, completion: nil)
            } else {
                if data != nil {
                    do{
                         let JSONresult = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as! Dictionary<String, AnyObject>
                        
                        DispatchQueue.main.async {
                            // print(JSONresult)
                            let rates = JSONresult["rates"] as! [String: AnyObject]
                            //   print(rates)
                            let turkish = String(describing: rates["TRY"]!)
                            self.tryLabel.text = "TRY: \(turkish)"
                            
                            let canada = String(describing: rates["CAD"]!)
                            self.cadLabel.text = "CAD: \(canada)"
                            
                            let isvicre = String(describing: rates["CHF"]!)
                            self.chfLabel.text = "CHF: \(isvicre)"
                            
                            let england = String(describing: rates["GBP"]!)
                            self.gbpLabel.text = "GBP: \(england)"
                            
                            let japan = String(describing: rates["JPY"]!)
                            self.jpyLabel.text = "JPY: \(japan)"
                            
                            let usd = String(describing: rates["USD"]!)
                            self.usdLabel.text = "USD: \(usd)"
                            
                        }
                        
                    } catch {
                        
                        
                    }
                }
            }
            })
            task.resume()
 
    }
    
}

