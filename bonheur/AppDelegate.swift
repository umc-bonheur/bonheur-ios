//
//  AppDelegate.swift
//  bonheur
//
//  Created by 김소현 on 2023/01/05.
//

import UIKit
import KakaoSDKCommon

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var isLogin = false
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        KakaoSDK.initSDK(appKey: "bc1f4e7f41b49fe6407ffb396e82c82f")
        
        // TODO: UserDefaults 초기화 코드 - commit할 때 지우기
//        for key in UserDefaults.standard.dictionaryRepresentation().keys {
//            UserDefaults.standard.removeObject(forKey: key.description)
//        }
//        print("UserDefaults 초기화 완료")
        
        let sessionId = UserDefaults.standard.string(forKey: Const.UserDefaultsKey.sessionId)
        
        // 세션 아이디가 존재한다면
        if sessionId != nil {
            // TODO: 로그인 타입에 따라 연동 상태 확인
            // TODO: 유효한 세션인지 확인
            print("session id: \(UserDefaults.standard.string(forKey: Const.UserDefaultsKey.sessionId))")
            print("member id: \(UserDefaults.standard.string(forKey: Const.UserDefaultsKey.memberId))")
            print("socialType: \(UserDefaults.standard.string(forKey: Const.UserDefaultsKey.socialType))")
            print("자동 로그인 성공")
            self.isLogin = true
            
        } else { // 세션 아이디가 존재하지 않다면
            print("자동 로그인 실패 - 세션이 없습니다.")
            UserDefaults.standard.set(false, forKey: Const.UserDefaultsKey.isLogin)
        }
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }

}
