//
//  BaseViewController.swift
//  Education
//
//  Created by OSX on 06/04/16.
//  Copyright © 2016 OSX. All rights reserved.
//

import UIKit

var selectedUserCategory = NSString()
var baseUrl = String("https://itunes.apple.com/in/rss/topmusicvideos/limit=10/json")
var imageBaseUrl = String("http://appsmaventech.com/quiz/uploads/")

var user_ID = String()
var subjectID = String()
var groupID = NSString()
var subjectName = String()
var groupCount = String()


class BaseViewController: UIViewController
{
    //MARK:- Outlet
    //MARK:-
    
    let sereverCommunication : ServerCommunicationClass = ServerCommunicationClass()
    var jsonResult = NSDictionary()
    
    
    let lightBlue = UIColor(red: 114/255, green: 198/255, blue: 247/255, alpha: 1)
    let darkBlue = UIColor(red: 66/255, green: 117/255, blue: 146/255, alpha: 1)
    let lightGreen = UIColor(red: 116/255, green: 197/255, blue: 67/255, alpha: 1)
    let darkGreen = UIColor(red: 89/255, green: 164/255, blue: 43/255, alpha: 1)
    let lightRed = UIColor(red: 255/255, green: 68/255, blue: 81/255, alpha: 1)
    let darkRed = UIColor(red: 161/255, green: 43/255, blue: 51/255, alpha: 1)
    let lightPurple = UIColor(red: 135/255, green: 129/255, blue: 189/255, alpha: 1)
    let darkPurple = UIColor(red: 96/255, green: 92/255, blue: 168/255, alpha: 1)
    
    let inputBorder = UIColor(red: 231/255, green: 234/255, blue: 238/255, alpha: 1)
    let input = UIColor.whiteColor()
    let lineGrey = UIColor(red: 180/255, green: 180/255, blue: 180/255, alpha: 1)
    let textgrey = UIColor(red: 103/255, green: 103/255, blue: 103/255, alpha: 1)
    
    
    
    //MARK:- Functions
    //MARK:-

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        if ((NSUserDefaults.standardUserDefaults().valueForKey("userLoggedIn")? .isEqualToString("teacher")) != nil) || ((NSUserDefaults.standardUserDefaults().valueForKey("userLoggedIn")? .isEqualToString("student")) != nil)
        {
            user_ID = (NSUserDefaults.standardUserDefaults().valueForKey("USER_ID") as? String)!
            print("this is the user %@",user_ID)
        }
    }
    
    
    //MARK:- Custom Method
    //MARK:-
    
    func alertViewOpen(title:String) // alertview
    {
        let alertController = UIAlertController(title: "Alert!", message: title, preferredStyle: .Alert)
        
        let button = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler:{(alert: UIAlertAction!) in
            
        })
        
        alertController.addAction(button)
        self.presentViewController(alertController, animated: true, completion:{})
    }
    
    func isValidEmail(testStr:String) -> Bool  // email validation
    {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        let result = emailTest.evaluateWithObject(testStr)
        
        return result
    }
    
    
    //MARK:- User Default list
    //MARK:-
    
    func emptyUserDefault()
    {
      NSUserDefaults.standardUserDefaults().removeObjectForKey("acceptConditions")

    }
    
    func logout()
    {
    
        NSUserDefaults.standardUserDefaults().removeObjectForKey("USER_ID")
        NSUserDefaults.standardUserDefaults().removeObjectForKey("USER_NAME")
        NSUserDefaults.standardUserDefaults().removeObjectForKey("USER_IMAGE")
        NSUserDefaults.standardUserDefaults().removeObjectForKey("userLoggedIn")
        
        user_ID = ""
        subjectID = ""
        subjectName = ""
        groupCount = ""
        
    
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
   
}

//MARK:- Extension Method
//MARK:-

extension UIView
{
    
    func setPopertiesView(radiusValue:CGFloat ,borderWidth:CGFloat , borderColor:UIColor ,bgColor:UIColor ,isView:NSString)
    {
        
        self.layer.cornerRadius = radiusValue
        self.layer.masksToBounds = true
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = borderColor.CGColor
        self.backgroundColor = bgColor
        
        if isView == "navigationBarView"
        {
            let border = CALayer()
            border.backgroundColor = bgColor.CGColor
            border.frame = CGRectMake(0, self.frame.size.height - borderWidth, self.frame.size.width, borderWidth)
            self.layer.addSublayer(border)
        
        }
    }
}

extension UIButton
{
    
    func setPopertiesButton(radiusValue:CGFloat ,borderWidth:CGFloat , borderColor:UIColor ,bgColor:UIColor)
    {
        
        self.layer.cornerRadius = radiusValue
        self.layer.masksToBounds = true
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = borderColor.CGColor
        self.backgroundColor = bgColor
    }
}

extension UITextField
{
    
    func setPopertiesTextField(radiusValue:CGFloat ,borderWidth:CGFloat , borderColor:UIColor ,bgColor:UIColor)
    {
        
        self.layer.cornerRadius = radiusValue
        self.layer.masksToBounds = true
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = borderColor.CGColor
        self.backgroundColor = bgColor
    }
}





