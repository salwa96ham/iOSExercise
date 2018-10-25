//
//  FullArticles.swift
//  iOSExercise
//
//  Created by Mac on ١٥ صفر، ١٤٤٠ هـ.
//  Copyright © ١٤٤٠ هـ Mac. All rights reserved.
//

import UIKit

class FullArticles: UIViewController {

    @IBOutlet weak var Aimage: UIImageView!
    @IBOutlet weak var Ainfo: UILabel!
    @IBOutlet weak var Atitle: UILabel!
    @IBOutlet weak var website: UILabel!
    @IBOutlet weak var Aauthor: UILabel!
    @IBOutlet weak var Adate: UILabel!
   
    var strlbl1:String!
    var strlbl2:String!
    var strlbl3:String!
    var strlbl4:String!
    var strlbl5:String!

    var strimg:UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        Atitle.text = strlbl1
        Atitle.numberOfLines = 0
        Atitle.lineBreakMode = NSLineBreakMode.byWordWrapping
        Ainfo.text = strlbl2
        Ainfo.numberOfLines = 0
        Ainfo.lineBreakMode = NSLineBreakMode.byWordWrapping
        Aimage.image = strimg
        website.text = strlbl3
        website.numberOfLines = 0
        website.lineBreakMode = NSLineBreakMode.byWordWrapping
        Aauthor.text = strlbl4
        Aauthor.numberOfLines = 0
        Aauthor.lineBreakMode = NSLineBreakMode.byWordWrapping
        Adate.text = strlbl5
        Adate.numberOfLines = 0
        Adate.lineBreakMode = NSLineBreakMode.byWordWrapping
        
    }

    

}
