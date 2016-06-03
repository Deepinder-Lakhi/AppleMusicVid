//
//  CountryListInfo.swift
//  AppleMusicVid
//
//  Created by DEEPINDERPAL SINGH on 31/05/16.
//  Copyright © 2016 Dimonds Infosys Pvt Ltd. All rights reserved.
//

import UIKit

class CountryListInfo: NSObject
{
    //let userDefaults = NSUserDefaults.standardUserDefaults()
    var countryCode = String()

    func getUserCountryInfo(countryName: NSString) -> NSString
    {
        if (countryName == "India")
        {
            self.countryCode = "in"
        }
        else if (countryName == "United States of America")
        {
            self.countryCode = "us"
        }
        else if (countryName == "Canada")
        {
            self.countryCode = "ca"
        }
        else if (countryName == "United kingdom")
        {
            self.countryCode = "gb"
        }
        else if (countryName == "China")
        {
            self.countryCode = "cn"
        }
        else if (countryName == "China (English)")
        {
            self.countryCode = "cn_en"
        }
        else if (countryName == "Australia")
        {
            self.countryCode = "au"
        }
        
        return countryCode
    }

}
