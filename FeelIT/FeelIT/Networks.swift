//
//  Networks.swift
//  FeelIT
//
//  Created by Jin younkyum on 12/4/23.
//

import Foundation

// API 엔드포인트 URL
let apiUrl = URL(string: "http://13.125.108.84:8080/analyze")!

// 요청할 데이터


// URLRequest 생성

func sendrequest(inputtedTextforCalcu: String) {
    var request = URLRequest(url: apiUrl)
    request.httpMethod = "POST"
    
    let requestData: [String: Any] = [
        "sentence": inputtedTextforCalcu
    ]
    
    do {
        // 데이터를 JSON 형식으로 변환
        let jsonData = try JSONSerialization.data(withJSONObject: requestData, options: [])
        
        // HTTP Body에 데이터 설정
        request.httpBody = jsonData
        
        // HTTP Header 설정
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        // URLSession을 사용하여 API 요청
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            // 응답 처리
            if let error = error {
                print("Error: \(error)")
            } else if let data = data {
                // 응답 데이터를 이용한 작업 수행
                do {
                    let jsonResponse = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
                    if let response = jsonResponse {
                        // 응답에서 필요한 데이터 추출
                        if let isSuccess = response["isSuccess"] as? Bool, isSuccess,
                           let responseData = response["data"] as? [String: Any] {
                            
                            // 필요한 데이터 출력
                            let inputText = responseData["inputText"] as? String ?? ""
                            let fear = responseData["fear"] as? Double ?? 0.0
                            let surprised = responseData["surprised"] as? Double ?? 0.0
                            let anger = responseData["anger"] as? Double ?? 0.0
                            let sad = responseData["sad"] as? Double ?? 0.0
                            let neutral = responseData["neutral"] as? Double ?? 0.0
                            let happy = responseData["happy"] as? Double ?? 0.0
                            let disgust = responseData["disgust"] as? Double ?? 0.0
                            
                            print("Input Text: \(inputText)")
                            print("Fear: \(fear)")
                            print("Surprised: \(surprised)")
                            print("Anger: \(anger)")
                            print("Sad: \(sad)")
                            print("Neutral: \(neutral)")
                            print("Happy: \(happy)")
                            print("Disgust: \(disgust)")
                            
                            targeted_text = inputText
                            fearRaw = fear
                            surprisedRaw = surprised
                            angerRaw = anger
                            sadRaw = sad
                            neutralRaw = neutral
                            happyRaw = happy
                            disgustRaw = disgust
                            
                            
                        } else {
                            print("Request was not successful.")
                        }
                    }
                } catch {
                    print("Error parsing JSON: \(error)")
                }
            }
        }
        
        // API 요청 시작
        task.resume()
    } catch {
        print("Error creating JSON data: \(error)")
    }
    
}
