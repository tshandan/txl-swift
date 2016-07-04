//
//  seeViewController.swift
//  txl swift
//
//  Created by 珊丹 on 16/7/4.
//  Copyright © 2016年 珊丹. All rights reserved.
//

import UIKit

class seeViewController: UIViewController {
    var db:SQLiteDB!

    @IBOutlet weak var kan: UITextView!
    
    @IBAction func show(sender: AnyObject) {
        kan.text=""
        let data=db.query("select * from user")
        
        for var x=0;x<data.count;x++
        {
            let user = data[x]
            kan.text!+="name:"+String(user["name"]!)+"mobile:"+String(user["mobile"]!)+"address:"+String(user["address"]!)+"email:"+String(user["email"]!)+"\n"
        }
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        
        //获取数据库实例
        db = SQLiteDB.sharedInstance()
        //如果表还不存在则创建表（其中uid为自增主键）
        db.execute("create table if not exists user(uid integer primary key,name varchar(20),mobile varchar(20)，address varchar(20),email varchar(20))")
        //如果有数据则加载
       
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
