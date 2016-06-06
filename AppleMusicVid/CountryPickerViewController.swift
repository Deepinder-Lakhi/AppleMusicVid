//
//  CoutryPickerViewController.swift
//  AppleMusicVid
//
//  Created by DEEPINDERPAL SINGH on 27/05/16.
//  Copyright © 2016 Diamonds Mobile Tech Pvt Ltd. All rights reserved.
//

import UIKit

class CountryPickerViewController: BaseViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    let countryNameModel : CountryListInfo = CountryListInfo()
    var countryStr = NSString()


    @IBOutlet weak var countryTxtFld: UITextField!
    
    var CountryList:NSMutableArray = ["","United States of America", "United kingdom", "India", "Canada", "China", "Australia"];
    
    override func viewDidLoad() {
        super.viewDidLoad()
        countryTxtFld.center.y = self.view.center.y;
        
        UIView.animateWithDuration(1.0,
            delay: 0.0,
            usingSpringWithDamping: 0.3,
            initialSpringVelocity: 30.0,
            options: UIViewAnimationOptions.CurveEaseInOut,
            animations:
            ({
            // do stuff
                self.countryTxtFld.transform = CGAffineTransformMakeScale(1, 1)
            }), completion: nil)

        // Do any additional setup after loading the view.
    }
    
    //MARK: - Delegates and data sources
    //MARK: Data Sources
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return CountryList.count
    }
    
    //MARK: Delegates
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        for(index, item) in CountryList.enumerate()
        {
            print ("at index \(index) with item \(item)")
        }

        return CountryList[row] as? String
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        countryStr = (CountryList[row] as? String)!
        countryTxtFld.text = countryStr as String
        
        let prefs = NSUserDefaults.standardUserDefaults()
        prefs.setValue(countryNameModel.getUserCountryInfo(countryStr as String), forKey: "userRegion")
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
