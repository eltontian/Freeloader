//
//  ViewController.swift
//  SwiftBook
//
//  Created by Brian Coleman on 2014-07-07.
//  Copyright (c) 2014 Brian Coleman. All rights reserved.
//

import UIKit
import Parse

class ViewController: UIViewController, FBLoginViewDelegate {
    
    @IBOutlet var fbLoginView : FBLoginView!
    private var user:User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.fbLoginView.delegate = self
        self.fbLoginView.readPermissions = ["public_profile", "email", "user_friends"]
        
        var testObject = PFObject(className:"PFObject")
        testObject["name"] = "elton"
        testObject["score"] = 0
        testObject.saveInBackgroundWithBlock {
            (success: Bool, error: NSError!) -> Void in
            if(success){
                print("success")
            }
            else{
                print("fuck")
            }
        }
    }
    
    // Facebook Delegate Methods
    
    func loginViewShowingLoggedInUser(loginView : FBLoginView!) {
        println("User Logged In")
    }
    
    func loginViewFetchedUserInfo(loginView : FBLoginView!, user: FBGraphUser) {
        println("User: \(user)")
        println("User ID: \(user.objectID)")
        println("User Name: \(user.name)")
        var userEmail = user.objectForKey("email") as String
        println("User Email: \(userEmail)")
        //sendInitialData("\(user.objectID)","\(user.name)", "\(userEmail)")
        //segue
        performSegueWithIdentifier("logSegue", sender: self)
    }
    
    func loginViewShowingLoggedOutUser(loginView : FBLoginView!) {
        println("User Logged Out")
    }
    
    func loginView(loginView : FBLoginView!, handleError:NSError) {
        println("Error: \(handleError.localizedDescription)")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

