//
//  LoadingViewController.swift
//  FeelIT
//
//  Created by Jin younkyum on 11/9/23.
//

import UIKit
import SnapKit
import Lottie

class LoadingViewController: UIViewController {
    
    let layout = LoadingViewLayout()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.layout.initViews(superView: self.view)
        self.layout.img_loading.play()
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


struct LoadingViewLayout {
    let img_loading: LottieAnimationView = .init(name: "loading-full")
    let lbl_calcuating = UILabel()
    let lbl_detail = UILabel()
    
    func initViews(superView: UIView) {
        superView.addSubview(lbl_calcuating)
        superView.addSubview(img_loading)
        superView.addSubview(lbl_detail)
        
        
        
        
        img_loading.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.width.height.equalTo(140)
        }
        img_loading.loopMode = .loop
        img_loading.contentMode = .scaleAspectFit
        
        
        lbl_calcuating.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(img_loading.snp.top).offset(-30)
        }
        lbl_calcuating.translatesAutoresizingMaskIntoConstraints = false
        lbl_calcuating.text = "분석 중..."
        lbl_calcuating.font = .boldSystemFont(ofSize: 25)
        lbl_calcuating.textColor = .systemGreen
        
        
        lbl_detail.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(img_loading.snp.bottom).offset(20)
        }
        lbl_detail.translatesAutoresizingMaskIntoConstraints = false
        lbl_detail.text = "결과가 나올 때까지 기다려주세요.\n 최대 2분까지 걸릴 수 있습니다."
        lbl_detail.font = .systemFont(ofSize: 13)
        lbl_detail.textColor = .lightGray
        lbl_detail.numberOfLines = 2
    }
}
