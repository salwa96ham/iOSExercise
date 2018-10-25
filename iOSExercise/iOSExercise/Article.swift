//
//  Article.swift
//  iOSExercise
//
//  Created by Mac on ١٥ صفر، ١٤٤٠ هـ.
//  Copyright © ١٤٤٠ هـ Mac. All rights reserved.
//

import UIKit
class Articles: Codable{
    let articles: [Article]
    init(articles:[Article]) {
        self.articles = articles
    }
    
}
class Article: Codable {
//MVC (modle of Article)
    // take all jason array component
   
    let title:String
    let authors:String
    let date:String
    let website:String
    let content:String
    //tags :[{"id","label","Politics"}]
    let image_url:String
   
    
    //initializers func
    init(title: String,authors: String,date: String,website: String,content: String,image_url: String){
        self.title = title
        self.authors = authors
        self.date = date
        self.website = website
        self.content = content
        self.image_url = image_url

    }
    
}
