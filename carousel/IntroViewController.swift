//
//  IntroViewController.swift
//  carousel
//
//  Created by Cameron Stewart on 9/22/15.
//  Copyright © 2015 cameronstewart. All rights reserved.
//

import UIKit

class IntroViewController: UIViewController, UIScrollViewDelegate {
    
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    var originalSize = CGFloat(1)
    //image 1
    var imageTile1OriginalPosition : CGPoint!
    var imageTile1OriginalRotate : CGAffineTransform!
    //image 2
    var imageTile2OriginalPosition : CGPoint!
    var imageTile2OriginalTransform : CGAffineTransform!
    //image 4
    var imageTile4OriginalPosition : CGPoint!
    var imageTile4OriginalTransform : CGAffineTransform!
    //image 3
    var imageTile3OriginalPosition : CGPoint!
    var imageTile3OriginalTransform : CGAffineTransform!
    //image 6
    var imageTile6OriginalPosition : CGPoint!
    var imageTile6OriginalTransform : CGAffineTransform!
    //image 5
    var imageTile5OriginalPosition : CGPoint!
    var imageTile5OriginalTransform : CGAffineTransform!
    
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        // This method is called as the user scrolls
        
        var y = scrollView.contentOffset.y
        
        //print(y)
        
        imageTile1.center.y = imageTile1OriginalPosition.y + y/2.06  //returns 825
        imageTile1.center.x = imageTile1OriginalPosition.x + y/6.5   //returns 122
        imageTile1.transform = CGAffineTransformRotate(imageTile1OriginalRotate, CGFloat((8 * M_PI) / 180)*(y/568))  //8 deg rotation
        
        imageTile2.center.y = imageTile2OriginalPosition.y + y/2.3  //returns 787
        imageTile2.center.x = imageTile2OriginalPosition.x - y/18.5   //returns 239.3
        imageTile2.transform = CGAffineTransformRotate(CGAffineTransformScale(imageTile2OriginalTransform, ((1136 - y)/1136), (1136 - y)/1136), CGFloat(8 * M_PI / 180)*(y/568))
        
        imageTile4.center.y = imageTile4OriginalPosition.y + y/1.8
        imageTile4.center.x = imageTile4OriginalPosition.x + y/7.2
        imageTile4.transform = CGAffineTransformRotate(CGAffineTransformScale(imageTile4OriginalTransform, ((1136 - y)/1136), (1136 - y)/1136), CGFloat(-8 * M_PI / 180)*(y/568))
        
        imageTile3.center.y = imageTile3OriginalPosition.y + y/1.128
        imageTile3.center.x = imageTile3OriginalPosition.x - y/6.5 + 1
        imageTile3.transform = CGAffineTransformRotate(CGAffineTransformScale(imageTile3OriginalTransform, ((1136 - y)/1136), (1136 - y)/1136), CGFloat(-8 * M_PI / 180)*(y/568))
        
        imageTile6.center.y = imageTile6OriginalPosition.y + y/1.14
        imageTile6.center.x = imageTile6OriginalPosition.x - y/12 + 1
        imageTile6.transform = CGAffineTransformRotate(CGAffineTransformScale(imageTile6OriginalTransform, ((1136 - y)/1136), (1136 - y)/1136), CGFloat(8 * M_PI / 180)*(y/568))
        
        imageTile5.center.y = imageTile5OriginalPosition.y + y/1.1 + 3
        imageTile5.center.x = imageTile5OriginalPosition.x + y/2.8
        imageTile5.transform = CGAffineTransformRotate(CGAffineTransformScale(imageTile5OriginalTransform, ((1136 - y)/1136), (1136 - y)/1136), CGFloat(-8 * M_PI / 180)*(y/568))
        
    }
    
    @IBOutlet weak var imageTile1: UIImageView!
    @IBOutlet weak var imageTile2: UIImageView!
    @IBOutlet weak var imageTile3: UIImageView!
    @IBOutlet weak var imageTile4: UIImageView!
    @IBOutlet weak var imageTile5: UIImageView!
    @IBOutlet weak var imageTile6: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //initialize position for images
        imageTile1.center.x = 35
        imageTile1.center.y = 550
        imageTile1.transform = CGAffineTransformRotate(imageTile1.transform, CGFloat((-8 * M_PI) / 180))
        
        //assign CGPoint # to image's center
        imageTile1OriginalPosition = imageTile1.center
        imageTile1OriginalRotate = imageTile1.transform
        
        imageTile2.center.x = 270
        imageTile2.center.y = 540
        imageTile2.transform = CGAffineTransformRotate(CGAffineTransformScale(imageTile2.transform, 2, 2), CGFloat(-8 * M_PI / 180))
        /*imageTile2.transform = CGAffineTransformRotate(imageTile2.transform, CGFloat(-8 * M_PI / 180))
        imageTile2.transform = CGAffineTransformScale(imageTile2.transform, 2, 2)*/
        
        //assign CGPoint # to image's center
        imageTile2OriginalPosition = imageTile2.center
        imageTile2OriginalTransform = imageTile2.transform
        
        imageTile4.center.x = 160
        imageTile4.center.y = 548
        imageTile4.transform = CGAffineTransformRotate(CGAffineTransformScale(imageTile4.transform, 2, 2), CGFloat(8 * M_PI / 180))
        
        //asign CGPoint # to image's center
        imageTile4OriginalPosition = imageTile4.center
        imageTile4OriginalTransform = imageTile4.transform
        
        imageTile3.center.x = 247
        imageTile3.center.y = 440
        imageTile3.transform = CGAffineTransformMakeScale(2, 2)
        imageTile3.transform = CGAffineTransformRotate(imageTile3.transform, CGFloat(8 * M_PI / 180))
        
        //asign CGPoint # to image's center
        imageTile3OriginalPosition = imageTile3.center
        imageTile3OriginalTransform = imageTile3.transform
        
        imageTile6.center.x = 130
        imageTile6.center.y = 445
        imageTile6.transform = CGAffineTransformMakeScale(2, 2)
        imageTile6.transform = CGAffineTransformRotate(imageTile6.transform, CGFloat(-8 * M_PI / 180))
        // asign
        imageTile6OriginalPosition = imageTile6.center
        imageTile6OriginalTransform = imageTile6.transform
        
        imageTile5.center.x = 35
        imageTile5.center.y = 425
        imageTile5.transform = CGAffineTransformMakeScale(2, 2)
        imageTile5.transform = CGAffineTransformRotate(imageTile5.transform, CGFloat(8 * M_PI / 180))
        // assign
        imageTile5OriginalPosition = imageTile5.center
        imageTile5OriginalTransform = imageTile5.transform
        
        scrollView.contentSize = CGSize(width: 320, height: 1136)
        
        // Do any additional setup after loading the view.
        
        //Start Scroll Delegation
        scrollView.delegate = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //dismiss view
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
