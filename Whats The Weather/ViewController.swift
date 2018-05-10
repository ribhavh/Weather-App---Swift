//
//  ViewController.swift
//  Whats The Weather
//
//  Created by Ribhav Hora on 7/19/16.
//  Copyright © 2016 SmartApps. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var cityTextField: UITextField!
    
    
    @IBOutlet var result: UILabel!
    
    
    @IBAction func findWeather(sender: AnyObject) {
        
       
        
        var wasSuccessful = false
        
        
        
        let attemptedUrl = NSURL(string: "http://www.weather-forecast.com/locations/" + cityTextField.text!.stringByReplacingOccurrencesOfString(" ", withString: "") + "/forecasts/latest")
        
        if let url = attemptedUrl {
        
        
        
        let task = NSURLSession.sharedSession().dataTaskWithURL(url) { (data, response, error) in
            
            if let urlContent = data {
                
                let webContent = NSString(data: urlContent, encoding: NSUTF8StringEncoding)
                
                let websiteArray = webContent?.componentsSeparatedByString("Weather Forecast Summary:</b><span class=\"read-more-small\"><span class=\"read-more-content\"> <span class=\"phrase\">")
                if websiteArray!.count > 1 {
                    
                    
                    let weatherArray = websiteArray![1].componentsSeparatedByString("</span>")
                    
                    if weatherArray.count > 1 {
                        
                        
                        wasSuccessful = true
                        
                        let weatherSummary = weatherArray[0].stringByReplacingOccurrencesOfString("&deg;", withString: "º")
                        
                    dispatch_async(dispatch_get_main_queue(), {
                            self.result.text = weatherSummary
                       })
                        
                    }
                    
                }
            
            }
            
                            
                if wasSuccessful == false {
                    self.result.text = "Errorrrrrrrr"
                }
            
            
                
                           
            }
        
        task.resume()
            
        cityTextField.text = ""
            
            
        } else {
            
            
                self.result.text = "Errorrrrrrrrr"
            
            
        }
        
        
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
            }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

