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
        
        // MARK: UserDefaults 초기화 코드
//        for key in UserDefaults.standard.dictionaryRepresentation().keys {
//            UserDefaults.standard.removeObject(forKey: key.description)
//            print("\(key.description) 삭제 완료")
//        }
//        print("UserDefaults 초기화 완료")
        
        let sessionId = UserDefaults.standard.string(forKey: Const.UserDefaultsKey.sessionId)
        
        // 세션 아이디가 존재한다면
        if sessionId != nil {
            // TODO: 로그인 타입에 따라 연동 상태 확인
            print("socialType: \(String(describing: UserDefaults.standard.string(forKey: Const.UserDefaultsKey.socialType)))")
            print("session id: \(String(describing: UserDefaults.standard.string(forKey: Const.UserDefaultsKey.sessionId)))")
            print("member id: \(String(describing: UserDefaults.standard.string(forKey: Const.UserDefaultsKey.memberId)))")
            print("updated at: \(String(describing: UserDefaults.standard.string(forKey: Const.UserDefaultsKey.updatedAt)))")
            let updatedAt = UserDefaults.standard.object(forKey: Const.UserDefaultsKey.updatedAt) as? Date
            
            let afterUpdatedAt = Calendar.current.dateComponents([.day], from: updatedAt!, to: Date()).day
            print("해당 세션을 생성한지 \(String(describing: afterUpdatedAt))일이 지났습니다. 30일이 넘으면 세션이 만료됩니다.")

            if afterUpdatedAt! >= 30 { // 세션 만료일이 경과되어 다시 로그인 필요
                UserDefaults.standard.removeObject(forKey: Const.UserDefaultsKey.socialType)
                UserDefaults.standard.removeObject(forKey: Const.UserDefaultsKey.accessToken)
                UserDefaults.standard.removeObject(forKey: Const.UserDefaultsKey.sessionId)
                UserDefaults.standard.removeObject(forKey: Const.UserDefaultsKey.updatedAt)
                UserDefaults.standard.removeObject(forKey: Const.UserDefaultsKey.memberId)
                
                print("자동 로그인 실패 - 세션이 만료되었습니다.")
                UserDefaults.standard.set(false, forKey: Const.UserDefaultsKey.isLogin)
            } else { // 세션 만료일이 경과되지 않음
                print("자동 로그인 성공")
                UserDefaults.standard.set(true, forKey: Const.UserDefaultsKey.isLogin)
            }
            
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
