//
//  WelcomeViewController.swift
//  carousel
//
//  Created by Cameron Stewart on 9/26/15.
//  Copyright © 2015 cameronstewart. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var welcomeScrollView: UIScrollView!
    
    @IBOutlet weak var pageControl: UIPageControl!
    
    @IBOutlet weak var pageControlView: UIView!
    
    @IBOutlet weak var backupButtonView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        welcomeScrollView.contentSize = CGSize(width: 1280, height: 320)
        welcomeScrollView.delegate = self
        
        pageControl.alpha = 1
        
        backupButtonView.frame.origin.x = 960
        backupButtonView.frame.origin.y = 568
        backupButtonView.alpha = 0
        
    }
    
    func scrollViewDidEndDecelerating(welcomeScrollView: UIScrollView!) {
        // Get the current page based on the scroll offset
        var page : Int = Int(round(welcomeScrollView.contentOffset.x / 320))
        
        // Set the current page, so the dots will update
        pageControl.currentPage = page
        
        if welcomeScrollView.contentOffset.x >= 960 {
            print("last page")
            UIView.animateWithDuration(0.15, animations: {
                self.pageControl.alpha = 0
            })
            UIView.animateWithDuration(0.35, animations: {
                self.backupButtonView.frame.origin.y = 463
                self.backupButtonView.alpha = 1
            })
        } else {
            UIView.animateWithDuration(0.15, animations: {
                self.pageControl.alpha = 1
            })
            UIView.animateWithDuration(0.25, animations: {
                self.backupButtonView.frame.origin.y = 568
                self.backupButtonView.alpha = 0
            })
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
