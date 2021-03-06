//
//  DetailTableView.swift
//  celdasAuto
//
//  Created by Mobdev on 05-04-22.
//

import UIKit



class DetailTableView: UIViewController{
    
    var dataContent : Character?
    
    
    var tableDetailView = UITableView ()
    
    struct ImageCells{
        static let myImageCell = "my image cell"
    }
    struct DataCells{
        static let myDataCell = "my data cell"
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        configureTableView()
        
        
        // Do any additional setup after loading the view.
    }
    func configureTableView() {
        view.addSubview(tableDetailView)
        
        
        setTableViewDelegates()
        tableDetailView.rowHeight = 280
        tableDetailView.register(MyImageViewCell.self, forCellReuseIdentifier: ImageCells.myImageCell)
        tableDetailView.register(MyDataViewCell.self, forCellReuseIdentifier: DataCells.myDataCell)
        
        tableDetailView.pin(to :view)
        
    }
    
    
    func setTableViewDelegates(){
        tableDetailView.delegate = self
        tableDetailView.dataSource = self
    }
    
    
}

extension DetailTableView : UITableViewDataSource{
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row{
        case .zero:
            let mycell = tableDetailView.dequeueReusableCell(withIdentifier: ImageCells.myImageCell) as! MyImageViewCell
            mycell.characterImageView.downloaded(from: (dataContent?.image)!)
            return mycell
        case 1:
            return prepareDataCell(tableDetailView, key: "Name:", content: "  \(dataContent?.name ?? "ok")")
            
        case 2:
            return prepareDataCell(tableDetailView, key: "Status:", content: "  \(dataContent?.status ?? "ok")")
        case 3:
            return prepareDataCell(tableDetailView, key: "Gender:", content: "  \(dataContent?.gender ?? "ok")")
            
        default:
            return UITableViewCell()
        }
        
    }
    
    private func prepareDataCell(_ tableView: UITableView, key: String, content: String) -> MyDataViewCell{
        let mylabelcell = tableView.dequeueReusableCell(withIdentifier: DataCells.myDataCell) as! MyDataViewCell
        mylabelcell.contentLabel.attributedText = NSMutableAttributedString()
            .bold(key)
            .normal(content)
        
        
        return mylabelcell
    }
}
extension DetailTableView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case .zero:
            return 260
        default:
            return 100
        }
    }
}

