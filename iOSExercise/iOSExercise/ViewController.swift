//
//  ViewController.swift
//  iOSExercise
//
//  Created by Mac on ١٥ صفر، ١٤٤٠ هـ.
//  Copyright © ١٤٤٠ هـ Mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
 
    //download data
    final let url = URL(string: "https://no89n3nc7b.execute-api.ap-southeast-1.amazonaws.com/staging/exercise")
   
    private var articles = [Article]()
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        downloadJason()
        
        self.tableView.addSubview(self.refreshControl)

        /*********************************/
        
        // delegate and data source
        tableView.delegate = self
        tableView.dataSource = self
        
        // Along with auto layout, these are the keys for enabling variable cell height
        tableView.estimatedRowHeight = 44.0
        tableView.rowHeight = UITableViewAutomaticDimension
        /*********************************/

    }

    
    // function to download data
    func downloadJason(){
        
        //make it optional to check if url exist if not do nothing "well not crash
        guard let downloadURL = url else { return }
        
        
        URLSession.shared.dataTask(with: downloadURL) { (data, urlResponse, erorr) in
            guard let data = data, erorr == nil, urlResponse != nil else {
                print("wrong!!")
                return
            }
            print("downloaded seccesfully")//to check only
            do {
                let decoder = JSONDecoder()
                let downloadedarticles = try decoder.decode(Articles.self, from: data)
                self.articles = downloadedarticles.articles //update array
              
                DispatchQueue.main.async {//we are switching no matter what to the main thread
                    self.tableView.reloadData()
                }
            }catch{
                print("eroorr after downloade")

            }
            
        }.resume()
    }
    // for uitableview
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleCell") as? articleCell /*casting*/
        else { return UITableViewCell() }
    
        cell.titleLbl.text = articles[indexPath.row].title
        cell.infoLbl.text = articles[indexPath.row].content
        cell.titleLbl!.numberOfLines = 0
        cell.titleLbl!.lineBreakMode = .byWordWrapping
        cell.titleLbl!.font = UIFont.systemFont(ofSize: 14.0)
        //cell.infoLbl.sizeToFit()
        cell.infoLbl!.numberOfLines = 0
        cell.infoLbl!.lineBreakMode = .byWordWrapping
        cell.infoLbl!.font = UIFont.systemFont(ofSize: 12.0)

        if let imageURL = URL(string: articles[indexPath.row].image_url) {
            DispatchQueue.global().async {
                let data = try? Data(contentsOf: imageURL)
                if let data = data {
                    let image = UIImage(data: data)
                    DispatchQueue.main.async {
                       cell.imgView.image = image
                    }
                }
                }
            }
       

        return cell
        }
  
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // self.view.backgroundColor = UIColor.blue
        let detail:FullArticles = self.storyboard?.instantiateViewController(withIdentifier: "FullArticles") as! FullArticles
        detail.strlbl1 = articles[indexPath.row].title
        detail.strlbl2 = articles[indexPath.row].content
        detail.strlbl3 = articles[indexPath.row].website
        detail.strlbl4 = articles[indexPath.row].authors
        detail.strlbl5 = articles[indexPath.row].date
        
        
        if let imageURL = URL(string: articles[indexPath.row].image_url) {
            DispatchQueue.global().async {
                let data = try? Data(contentsOf: imageURL)
                if let data = data {
                    let image = UIImage(data: data)
                    DispatchQueue.main.async {
                      
                        detail.strimg = image
                        
                        self.navigationController?.pushViewController(detail, animated: true)

                    }
                }
            }
        }

            
        
    
        
        
        
    }
    // refresh by pull dowwn the screen
    lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action:
            #selector(ViewController.handleRefresh(_:)),
                                 for: UIControlEvents.valueChanged)
        refreshControl.tintColor = UIColor.red
        
        return refreshControl
    }()
    @objc func handleRefresh(_ refreshControl: UIRefreshControl) {

        
        self.tableView.reloadData()
        refreshControl.endRefreshing()

    }
    

    }
    
    

