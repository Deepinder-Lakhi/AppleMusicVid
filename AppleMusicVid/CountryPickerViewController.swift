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
    
    var CountryList:NSMutableArray = ["Choose your region","United States of America", "United kingdom", "India", "Canada", "China", "Australia"];
    
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
                self.countryTxtFld.transform = CGAffineTransformMakeScale(1, 1)
            }), completion: nil)
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
        
        return CountryList[row] as? String
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        countryStr = (CountryList[row] as? String)!
        countryTxtFld.text = countryStr as String
        
        let prefs = NSUserDefaults.standardUserDefaults()
        prefs.setValue(countryNameModel.getUserCountryInfo(countryStr as String), forKey: "userRegion")
    }

}
