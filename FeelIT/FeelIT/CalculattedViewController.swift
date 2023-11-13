//
//  CalculattedViewController.swift
//  FeelIT
//
//  Created by Jin younkyum on 11/10/23.
//

import UIKit

class CalculattedViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}


struct CaculatedScrollViewLayout {
    let scrollView: UIScrollView! = UIScrollView()
    
    func initView(superView: UIView) {
        superView.addSubview(scrollView)
        
        scrollView.snp.makeConstraints { make in
            make.top.bottom.left.right.equalToSuperview()
        }
    }
}

struct CalculatedViewLayout {
    
}
