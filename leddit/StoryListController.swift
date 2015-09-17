//
//  StoryListController.swift
//  leddit
//
//  Created by dev on 8/17/15.
//  Copyright © 2015 STVR. All rights reserved.
//

import Foundation
import UIKit

class StoryListController : UITableViewController {
    var stories:[Story] = []
    let number_of_stories = 10
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("connecting")
        
        let test = NSURLRequest(string: "https://www.reddit.com/r/gaming/top.json?limit=\(number_of_stories)")
        
        NSURLSession.sharedSession().dataTaskWithRequest(test) { (data:NSData?, response:NSURLResponse?, error:NSError?) -> Void in
            print("connected")
            
            if error != nil {
                print(error?.description)
            } else {
                var stories = [Story]()
                
                do {
                    let json = try NSJSONSerialization.JSONObjectWithData(data!, options: .MutableContainers)
                    let json_data = json["data"] as? NSDictionary
                    let children = json_data?.objectForKey("children") as! [AnyObject]
                    
                    for i in 0...(self.number_of_stories - 1) {
                        let obj = children[i].objectForKey("data")
                        
                        let story = Story(
                            author: obj?.objectForKey("author") as! String,
                            comments: obj?.objectForKey("num_comments") as! Int,
                            domain: obj?.objectForKey("domain") as! String,
                            id: obj?.objectForKey("id") as! String,
                            score: obj?.objectForKey("score") as! Int,
                            subreddit: obj?.objectForKey("subreddit") as! String,
                            title: obj?.objectForKey("title") as! String,
                            url: obj?.objectForKey("url") as! String,
                            vote: VoteStatus.None
                        )
                        
                        print(story)
                        
                        stories.append(story)
                    }
                } catch {
                    print(error)
                }
                
                self.stories = stories
                
                dispatch_async(dispatch_get_main_queue(), {
                    // code here
                    self.tableView.reloadData()
                })
            }
        }.resume()
    }
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stories.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let story = stories[indexPath.item]
        let cell = tableView.dequeueReusableCellWithIdentifier("StoryItemCellIdentifier", forIndexPath: indexPath) as! StoryItemCell
        cell.cellLabel.text = story.title
        cell.authorLabel.text = story.author
    
        return cell
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