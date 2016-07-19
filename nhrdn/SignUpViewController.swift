//
//  SignUpViewController.swift
//  nhrdn
//
//  Created by Stacks and Queues on 10/06/16.
//  Copyright © 2016 Stacks and Queues. All rights reserved.
//

import UIKit
import SwiftyJSON


class SignUpViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var ChapterPickerView: UIPickerView!
    
    @IBOutlet weak var NameTextField: UITextField!
    
    
    @IBOutlet weak var EmailTextField: UITextField!
    
    @IBOutlet weak var UIDTextField: UITextField!
    
    
    @IBOutlet weak var PswdTextField: UITextField!
    
    @IBOutlet weak var CnfrmPswdTextField: UITextField!
    
    // remove editing of text first responder
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
    //defining an array with name Array.
    var Array = [String]()
    
    //defining an array with name chapterList.
    var chapterList = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //NSURL containing location of remote server
        let chapterUrl = NSURL(string: "http://demo.expresscion.in/nhrdn/mobile/chapter_type.php")!
        //NSData for getting the content from the remote server.
        let data = NSData(contentsOfURL: chapterUrl)
        
        //print("START")
        //print(data?.description)
        
        //making a contant json which stores json data coming from NSData
        let json = JSON(data: data!)
        
        //Initialising a variable index with value 0 which increments in repeat loop.
        var index: Int = 0
        
        //repeat loop same as do while in other languages
        repeat{
            
            //parsing json
            let chapterType = json["chapter"][index]["chapter_type"].string
            
            //Array![index] = chapterType!
            
            //inserting all chapter type in the array[] named Array.
            Array.append(chapterType!)
            
            //print(chapterType)
            //print(Array[index])
            
            index += 1
        } while(index < json["chapter"].count)
        /*index = 0
        repeat{
            print("chapter[\(index)] = " + Array![index])
        }while (index < 10)
        */
        //let chapterType = json[0]["chapter"][2]["chapter_type"].string
      //print("*************" + chapterType!)
        /*
        print("*********Now From the earlier implementation************")
        
        let task = NSURLSession.sharedSession().dataTaskWithURL(chapterUrl) { (data, response, error) -> Void in
            if let urlContent = data {
                print(urlContent)
                
                do {
                    
                    let JSONRESULT = try NSJSONSerialization.JSONObjectWithData(urlContent, options: NSJSONReadingOptions.MutableContainers)
                    print(JSONRESULT["chapter"]!![4]["chapter_type"])
                    //print(JSONRESULT["chapter"]!!.count)
                    var i = 0
                    print("count", JSONRESULT["chapter"]!!.count)
                    if let chapters = JSONRESULT["chapter"] as? [[String: AnyObject]] {
                        for chapter in chapters {
                            if let chapterName = chapter["chapter_type"] as? String {
                                self.chapterList.append(chapterName)
                                //self.Array[i] = chapterName
                                //print(chapterName)
                                print(self.chapterList[i])
                                i += 1
                            }
                        }
                    }
                
                } catch {
                    print("JSON serialization failed")
                }
            }
            
        }
        task.resume()
        */
        /* loading ChapterPickerView
         */
        
        
        ChapterPickerView.delegate = self
        
        ChapterPickerView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /* ChapterPickerView :- Title
     * This function return the title in the ChapterpickerView
     */
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return Array[row]
    }
 
    /* ChapterPickerView :- No of rows
     */
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
       return Array.count
       //return Array![row]
        //return 1
    }
    
    /* ChapterPickerView :- Number of sections in the picker view
     * returns 1 : for one section
     */
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int{
        return 1
    }
    
    /* ChapterPickerView :- Gives current selected item
     */
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        NSLog(Array[row])
        
     }
    
    /* SignUp Button Click event
     */
    @IBAction func SignUpClick(sender: AnyObject) {
        
        
    }
}
