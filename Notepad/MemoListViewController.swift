//
//  MemoListViewController.swift
//  Notepad
//
//  Created by Accepted on 2020/09/20.
//  Copyright © 2020 Accepted. All rights reserved.
//

import UIKit

class MemoListTableviewCell: UITableViewCell{
    
    @IBOutlet var memoTitle: UILabel!
    @IBOutlet var memoSummary: UILabel!
    @IBOutlet var memoDate: UILabel!
    @IBOutlet var memoDelete: UIImageView!
    
    @IBOutlet var memoContainer: UIView!
}

class MemoListViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    @IBOutlet var ivMenu: UIImageView!
    
    @IBOutlet var headerContainer: UIView!
    @IBOutlet var searchViewContainer: UIView!
    
    @IBOutlet var trashView: UIView!
    @IBOutlet var memoTable: UITableView!
    
    var slideMenuWidth:CGFloat = 100
    
    @IBOutlet var dimView: UIView!
    @IBOutlet var totalConainer: UIView!
    
    lazy var menuTableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        tableView.separatorColor = UIColor.white
        return tableView
    }()
    
    var menuLeftConstraints: NSLayoutConstraint?
    var menuSlideWitdthConstraints: NSLayoutConstraint?
    
    var menuTitle = ["LOG OUT","잠금번호 변경/찾기","글쓰기 방식 변경", "배경 설정", "사용자매뉴얼"]
    var menuImage = ["icon_login.png","icon_pw.png","icon_click.png","icon_bgr.png","icon_manual.png"]
    
    let statusBarRect = UIApplication.shared.statusBarFrame
    var height: CGFloat!
    
    lazy var menuView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        let tapgesture = UITapGestureRecognizer(target:self,action : #selector(menuBtnTapped))
        
        view.isUserInteractionEnabled = true
        view.addGestureRecognizer(tapgesture)
        
        
        return view
    }()
    
    lazy var mainView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(self.menuTableView)
        
        let screenSize: CGRect = UIScreen.main.bounds
        
        self.menuTableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        self.menuTableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        self.menuTableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        self.menuTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        return view
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        height = statusBarRect.height
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillDisappear), name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillAppear), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        let tapgesture2 = UITapGestureRecognizer(target:self,action : #selector(menuBtnTapped))
        
        ivMenu.isUserInteractionEnabled = true
        ivMenu.addGestureRecognizer(tapgesture2)
        
        
        
        headerContainer.layer.shadowColor = UIColor.gray.cgColor
        headerContainer.layer.shadowOpacity = 0.5
        headerContainer.layer.shadowRadius = 3
        headerContainer.layer.shadowOffset = CGSize(width: 1, height: 1)
        
        searchViewContainer.layer.cornerRadius = 10
        
        let tapGestureRecognizer3 = UITapGestureRecognizer(target: self, action: #selector(keyboardHide(tapGestureRecognizer:)))
        
        trashView.isHidden = true
        trashView.isUserInteractionEnabled = true
        trashView.addGestureRecognizer(tapGestureRecognizer3)
        
        setupMenuView()
        
    }
    
    func setupMenuView(){
        self.view.addSubview(menuView)
        menuSlideWitdthConstraints =  menuView.widthAnchor.constraint(equalToConstant: slideMenuWidth) // ---- 5
        menuSlideWitdthConstraints!.isActive = true
        menuView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: height).isActive = true
        menuView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        
        menuLeftConstraints = menuView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -view.frame.width) // ---- 6
        menuLeftConstraints!.isActive = true
        
        self.view.addSubview(mainView)
        mainView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: height).isActive = true
        mainView.rightAnchor.constraint(equalTo: self.menuView.leftAnchor).isActive = true
        mainView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        mainView.widthAnchor.constraint(equalToConstant: self.view.frame.width).isActive = true
    }
    
    
    @objc func menuBtnTapped() {
        
        if menuLeftConstraints?.constant == 0 {
            //메뉴바 클로즈
            dimView.isHidden = true
            print("menu close")
            menuLeftConstraints?.constant = -view.frame.width
            
            
        }else {
            //메뉴바 오픈
            dimView.isHidden = false
            menuLeftConstraints?.constant = 0
            print("menu open")
        }
        
        UIView.animate(withDuration: 0.4) {
            self.view.layoutIfNeeded()
        }
    }
    
    
    
    @objc func keyboardWillAppear(notification: NSNotification) {
        trashView.isHidden = false
    }
    
    
    @objc func keyboardWillDisappear() {
        trashView.isHidden = true
    }
    

    @available(iOS 2.0, *)
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
         if(tableView == memoTable)
         {
            return 5
         }else{
            return menuTitle.count
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if(tableView == memoTable)
        {
            let int = 123
            let cgfloat = CGFloat(int)
           return cgfloat
        }else{
            let int = 60
             let cgfloat = CGFloat(int)
            return cgfloat
            
        }
    }
    
    @available(iOS 2.0, *)
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        if(tableView == memoTable)
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "memolistCell", for: indexPath) as! MemoListTableviewCell
            cell.memoContainer.layer.shadowColor = UIColor.gray.cgColor
            cell.memoContainer.layer.shadowOpacity = 0.5
            cell.memoContainer.layer.shadowRadius = 3
            cell.memoContainer.layer.shadowOffset = CGSize(width: 1, height: 1)
            return cell
        }else{
            let cell = UITableViewCell()
            
            let imageView = UIImageView()
            imageView.image = UIImage(named: menuImage[indexPath.row])
            imageView.contentMode = .scaleAspectFill
            cell.addSubview(imageView)
            imageView.translatesAutoresizingMaskIntoConstraints = false
            
            imageView.leftAnchor.constraint(equalTo: cell.leftAnchor, constant: 120)
                .isActive = true // ---- 1
            imageView.centerYAnchor.constraint(equalTo:cell.centerYAnchor)
                .isActive = true // ---- 2
            imageView.heightAnchor.constraint(equalToConstant: 15)
                .isActive = true // ---- 3
            imageView.widthAnchor.constraint(equalToConstant: 15)
                .isActive = true // ---- 4
            
            let label = UILabel()
            label.text = menuTitle[indexPath.row]
            cell.addSubview(label)
            label.translatesAutoresizingMaskIntoConstraints = false
            label.leftAnchor.constraint(equalTo: imageView.rightAnchor, constant: 20)
                .isActive = true // ---- 1
            label.centerYAnchor.constraint(equalTo:cell.centerYAnchor)
                .isActive = true // ---- 2
            label.heightAnchor.constraint(equalToConstant: 40)
                .isActive = true // ---- 3
            label.widthAnchor.constraint(equalToConstant: 200)
                .isActive = true // ---- 4
            label.font = UIFont.systemFont(ofSize: CGFloat(15))
            
            cell.selectionStyle = .none
            
            return cell
            
        }
    
    
}
    
    




override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
    self.view.endEditing(true)
}

@objc func keyboardHide(tapGestureRecognizer: UITapGestureRecognizer)
{
    self.view.endEditing(true)
    
}



}
