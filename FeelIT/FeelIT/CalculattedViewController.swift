//
//  CalculattedViewController.swift
//  FeelIT
//
//  Created by Jin younkyum on 11/10/23.
//

import UIKit

public var targeted_text = "전송이 원활하지 않습니다."
public var fearRaw = -1.1
public var surprisedRaw = -1.1
public var angerRaw = -1.1
public var sadRaw = -1.1
public var neutralRaw = -1.1
public var happyRaw = -1.1
public var disgustRaw = -1.1

class CalculattedViewController: UIViewController {
    
    static let identifier = "CalculattedViewController"
    
    let contentScrollView: UIScrollView = {
        let scrollview = UIScrollView()
        scrollview.backgroundColor = .white
        scrollview.translatesAutoresizingMaskIntoConstraints = false
        scrollview.showsVerticalScrollIndicator = true
        
        return scrollview
    }()
    let contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let goBackButton: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = UIColor(red: 0/255, green: 196/255, blue: 142/255, alpha: 1)
        btn.setTitle("돌아가기", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.layer.cornerRadius = 8
        return btn
    }()
    
    let layout = CalculatedViewLayout()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUIConstraints()
        self.goBackButton.addTarget(self, action: #selector(buttonPushed), for: .touchUpInside)
        
        layout.targetTextLabel.text = targeted_text
        layout.fearLayout.rawValueLabel.text = String(fearRaw)
        layout.surprisedLayout.rawValueLabel.text = String(surprisedRaw)
        layout.angerLayout.rawValueLabel.text = String(angerRaw)
        layout.sadLayout.rawValueLabel.text = String(sadRaw)
        layout.neutralLayout.rawValueLabel.text = String(neutralRaw)
        layout.happyLayout.rawValueLabel.text = String(happyRaw)
        layout.disgustLayout.rawValueLabel.text = String(disgustRaw)
        
        
        let list = [fearRaw, surprisedRaw, angerRaw, sadRaw, neutralRaw, happyRaw, disgustRaw]
        
        if list.max() == fearRaw {
            layout.mainFeelingLabel.text = "공포"
            layout.explainTextLabel.text = "전체 내용을 기반으로 분석하였을 때, 텍스트의 전체적인 감정은 공포로 확인되었습니다."
        } else if list.max() == surprisedRaw {
            layout.mainFeelingLabel.text = "놀람"
            layout.explainTextLabel.text = "전체 내용을 기반으로 분석하였을 때, 텍스트의 전체적인 감정은 놀람으로 확인되었습니다."
        } else if list.max() == angerRaw {
            layout.mainFeelingLabel.text = "화남"
            layout.explainTextLabel.text = "전체 내용을 기반으로 분석하였을 때, 텍스트의 전체적인 감정은 화남으로 확인되었습니다."
        } else if list.max() == neutralRaw {
            layout.mainFeelingLabel.text = "중립"
            layout.explainTextLabel.text = "전체 내용을 기반으로 분석하였을 때, 텍스트의 전체적인 감정은 중립으로 확인되었습니다."
        } else if list.max() == sadRaw {
            layout.mainFeelingLabel.text = "슬픔"
            layout.explainTextLabel.text = "전체 내용을 기반으로 분석하였을 때, 텍스트의 전체적인 감정은 슬픔으로 확인되었습니다."
        } else if list.max() == happyRaw {
            layout.mainFeelingLabel.text = "행복"
            layout.explainTextLabel.text = "전체 내용을 기반으로 분석하였을 때, 텍스트의 전체적인 감정은 행복으로 확인되었습니다."
        } else if list.max() == disgustRaw {
            layout.mainFeelingLabel.text = "역겨움"
            layout.explainTextLabel.text = "전체 내용을 기반으로 분석하였을 때, 텍스트의 전체적인 감정은 역겨움으로 확인되었습니다."
        }

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
         super.viewWillAppear(animated)
         self.navigationItem.hidesBackButton = true
    }


    
    func setUpUIConstraints() {
        self.view.addSubview(contentScrollView)
        
        contentScrollView.addSubview(contentView)
        
        layout.initViews(superView: contentView)
        
        contentScrollView.snp.makeConstraints { make in
            make.top.left.right.bottom.equalTo(self.view)
        }
        
        
        contentView.snp.makeConstraints { make in
            make.top.left.right.bottom.equalTo(contentScrollView)
            make.width.equalTo(contentScrollView)
            make.height.equalTo(900)
        }
    
        self.view.addSubview(goBackButton)
        
        goBackButton.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(24)
            make.right.equalToSuperview().offset(-24)
            make.bottom.equalToSuperview().offset(-30)
            make.height.equalTo(54)
        }
    }
    
    @objc
    func buttonPushed() {
        print("Button Pushed")
        navigationController?.popToRootViewController(animated: true)
    }
    
}


struct CalculatedViewLayout {
    
    let completeLabel = UILabel()
    let calculatedTextLabel = UILabel()
    let targetTextLabel = UILabel()
    let calculatedFeelingTitleLabel = UILabel()
    
    let fearLayout = FeelingsLayout()
    let surprisedLayout = FeelingsLayout()
    let angerLayout = FeelingsLayout()
    let sadLayout = FeelingsLayout()
    let neutralLayout = FeelingsLayout()
    let happyLayout = FeelingsLayout()
    let disgustLayout = FeelingsLayout()
    
    let totalCalcuationIsLabel = UILabel()
    let mainFeelingLabel = UILabel()
    let explainTextLabel = UILabel()
    let cocTextLabel = UILabel()
    let goBackButton = UIButton()
    
    func initViews(superView: UIView) {
        superView.addSubview(completeLabel)
        superView.addSubview(calculatedTextLabel)
        superView.addSubview(targetTextLabel)
        
        
        superView.addSubview(calculatedFeelingTitleLabel)
        superView.addSubview(fearLayout)
        superView.addSubview(surprisedLayout)
        superView.addSubview(angerLayout)
        superView.addSubview(sadLayout)
        superView.addSubview(neutralLayout)
        superView.addSubview(happyLayout)
        superView.addSubview(disgustLayout)
        
        
        
        
        completeLabel.snp.makeConstraints { make in
            make.top.left.equalToSuperview().offset(24)
        }
        completeLabel.text = "분석 완료!"
        completeLabel.textColor = UIColor(red: 0/255, green: 196/255, blue: 142/255, alpha: 1)
        completeLabel.font = .boldSystemFont(ofSize: 40)
        completeLabel.textAlignment = .left
        
        calculatedTextLabel.snp.makeConstraints { make in
            make.left.equalTo(completeLabel)
            make.top.equalTo(completeLabel.snp.bottom).offset(27)
        }
        calculatedTextLabel.text = "분석 본문"
        calculatedTextLabel.textColor = .gray
        calculatedTextLabel.font = .systemFont(ofSize: 15)
        calculatedTextLabel.textAlignment = .left
        
        targetTextLabel.snp.makeConstraints { make in
            make.left.equalTo(completeLabel)
            make.top.equalTo(calculatedTextLabel.snp.bottom).offset(15)
            make.right.equalToSuperview().offset(-24)
        }
        targetTextLabel.text = "문장"
        targetTextLabel.numberOfLines = 0
        targetTextLabel.textColor = .black
        targetTextLabel.font = .systemFont(ofSize: 17)
        
        calculatedFeelingTitleLabel.snp.makeConstraints { make in
            make.left.equalTo(completeLabel)
            make.top.equalTo(targetTextLabel.snp.bottom).offset(25)
        }
        calculatedFeelingTitleLabel.text = "분석 내역"
        calculatedFeelingTitleLabel.textColor = .gray
        calculatedFeelingTitleLabel.font = .systemFont(ofSize: 15)
        calculatedFeelingTitleLabel.textAlignment = .left
        
        
        
        
        
        fearLayout.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalTo(calculatedFeelingTitleLabel.snp.bottom).offset(5)
            make.height.equalTo(35)
        }
        fearLayout.initViews(superView: fearLayout, feelTitle: "공포", color: .red)
        
        surprisedLayout.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalTo(fearLayout.snp.bottom)
            make.height.equalTo(35)
        }
        surprisedLayout.initViews(superView: surprisedLayout, feelTitle: "놀람", color: .orange)
        
        angerLayout.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalTo(surprisedLayout.snp.bottom)
            make.height.equalTo(35)
        }
        angerLayout.initViews(superView: angerLayout, feelTitle: "화남", color: .yellow)
        
        sadLayout.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalTo(angerLayout.snp.bottom)
            make.height.equalTo(35)
        }
        sadLayout.initViews(superView: sadLayout, feelTitle: "슬픔", color: .green)
        
        neutralLayout.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalTo(sadLayout.snp.bottom)
            make.height.equalTo(35)
        }
        neutralLayout.initViews(superView: neutralLayout, feelTitle: "중립", color: .blue)
        
        happyLayout.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalTo(neutralLayout.snp.bottom)
            make.height.equalTo(35)
        }
        happyLayout.initViews(superView: happyLayout, feelTitle: "행복", color: .systemBlue)
        
        disgustLayout.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalTo(happyLayout.snp.bottom)
            make.height.equalTo(35)
        }
        disgustLayout.initViews(superView: disgustLayout, feelTitle: "역겨움", color: .purple)
        
        
        
        superView.addSubview(totalCalcuationIsLabel)
        superView.addSubview(mainFeelingLabel)
        superView.addSubview(explainTextLabel)
        superView.addSubview(cocTextLabel)
        superView.addSubview(goBackButton)
        
        
        totalCalcuationIsLabel.snp.makeConstraints { make in
            make.left.equalTo(calculatedTextLabel)
            make.top.equalTo(disgustLayout.snp.bottom).offset(50)
        }
        totalCalcuationIsLabel.text = "분석 결과는..."
        totalCalcuationIsLabel.font = .boldSystemFont(ofSize: 18)
        totalCalcuationIsLabel.textColor = .black
        
        mainFeelingLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(totalCalcuationIsLabel.snp.bottom).offset(38)
        }
        mainFeelingLabel.text = "판단 불가"
        mainFeelingLabel.textColor = UIColor(red: 0/255, green: 196/255, blue: 142/255, alpha: 1)
        mainFeelingLabel.font = .boldSystemFont(ofSize: 40)
        
        explainTextLabel.snp.makeConstraints { make in
            make.left.equalTo(calculatedTextLabel)
            make.right.equalToSuperview().offset(-24)
            make.top.equalTo(mainFeelingLabel.snp.bottom).offset(28)
        }
        explainTextLabel.numberOfLines = 3
        explainTextLabel.text = "전체 내용을 기반으로 분석했을 때, 해당 텍스트는 감정 분석이 불가한 것으로 파악되었습니다."
        explainTextLabel.font = .systemFont(ofSize: 13)
        
        cocTextLabel.snp.makeConstraints { make in
            make.left.equalTo(calculatedTextLabel)
            make.right.equalTo(explainTextLabel)
            make.top.equalTo(explainTextLabel.snp.bottom).offset(24)
        }
        cocTextLabel.text = "해당 생성 내용은 AI로 도출된 내용으로, 이가 해당 정보의 객관성을 보장하지 않습니다. 결과를 판단의 근거로 사용하는 것을 권장하지 않습니다."
        cocTextLabel.font = .systemFont(ofSize: 13)
        cocTextLabel.textColor = .gray
        cocTextLabel.numberOfLines = 0
        

    }
    
    
}

class FeelingsLayout: UIView {
    
    let colorView = UIView()
    let feelTitleLabel = UILabel()
    let rawValueLabel = UILabel()
    
    func initViews(superView: UIView, feelTitle: String, color: UIColor) {
        superView.addSubview(colorView)
        superView.addSubview(feelTitleLabel)
        superView.addSubview(rawValueLabel)
        
        colorView.translatesAutoresizingMaskIntoConstraints = false
        feelTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        rawValueLabel.translatesAutoresizingMaskIntoConstraints = false
        
        colorView.snp.makeConstraints { make in
            make.height.width.equalTo(17)
            make.left.equalTo(superView.snp.left).offset(29)
            make.centerY.equalToSuperview()
        }
        colorView.backgroundColor = color
        colorView.layer.cornerRadius = 8.5
        
        
        feelTitleLabel.snp.makeConstraints { make in
            make.left.equalTo(colorView.snp.right).offset(20)
            make.centerY.equalTo(colorView)
        }
        feelTitleLabel.text = feelTitle
        feelTitleLabel.font = .systemFont(ofSize: 17)
        feelTitleLabel.textAlignment = .left
        feelTitleLabel.textColor = .black
        
        
        rawValueLabel.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-36)
            make.centerY.equalTo(colorView)
        }
        rawValueLabel.text = "-10"
        rawValueLabel.font = .systemFont(ofSize: 17)
        rawValueLabel.textAlignment = .right
        rawValueLabel.textColor = .black
    }
}
