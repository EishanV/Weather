//
//  ViewController.swift
//  What's The Weather
//
//  Created by Eishan Vijay on 2015-01-06.
//  Copyright (c) 2015 Eishan Vijay. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var city: UITextField!
    
    @IBOutlet weak var message: UILabel!
    
    @IBAction func buttonPressed(sender: AnyObject) {
        
        var urlString = "http://www.weather-forecast.com/locations/" + city.text.stringByReplacingOccurrencesOfString(" ", withString: "") + "/forecasts/latest"
        
        var url = NSURL(string: urlString)
        let task = NSURLSession.sharedSession().dataTaskWithURL(url!) {(data,response,error) in
            
            var pageSource = NSString(data: data, encoding: NSUTF8StringEncoding)
            
            var contentArray = pageSource?.componentsSeparatedByString("<span class=\"phrase\">")
            
            var newContentArray = contentArray![1].componentsSeparatedByString("</span")
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                self.message.text = (newContentArray[0]) as? String
            })
            
            println(self.message.text)
        }
        
        task.resume()
        
        println(urlString)
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

