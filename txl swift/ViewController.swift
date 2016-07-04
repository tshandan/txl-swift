//
//  ViewController.swift
//  txl swift
//
//  Created by 珊丹 on 16/7/4.
//  Copyright © 2016年 珊丹. All rights reserved.
//


import UIKit

class ViewController: UIViewController {
    
    var db:SQLiteDB!
    
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var mobile: UITextField!
    @IBOutlet weak var address: UITextField!
    @IBOutlet weak var email: UITextField!

        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //获取数据库实例
        db = SQLiteDB.sharedInstance()
        //如果表还不存在则创建表（其中uid为自增主键）
        db.execute("create table if not exists user(uid integer primary key,name varchar(20),mobile varchar(20)，address varchar(20),email varchar(20))")
        //如果有数据则加载
        initUser()
    }
    
    //点击保存
    @IBAction func save(sender: AnyObject) {
        saveUser()
    }
    
    //从SQLite加载数据
    func initUser() {
        let data = db.query("select * from user")
        if data.count > 0 {
            //获取最后一行数据显示
            let user = data[data.count - 1]
            name.text = user["name"] as? String
            mobile.text = user["mobile"] as? String
        }
    }
    
    //保存数据到SQLite
    func saveUser() {
        let name = self.name.text!
        let mobile = self.mobile.text!
        let address = self.address.text!
        let email = self.email.text!
        //插入数据库，这里用到了esc字符编码函数，其实是调用bridge.m实现的
        let sql = "insert into user(name,mobile,address,emaile) values('\(name)','\(mobile)','\(address)','\(email)')"
        print("sql: \(sql)")
        //通过封装的方法执行sql
        let result = db.execute(sql)
        print(result)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
