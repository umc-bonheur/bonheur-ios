//
//  MyPageViewController.swift
//  bonheur
//
//  Created by 이정연 on 2023/01/09.
//

import UIKit
import SnapKit
import Then
import Charts
import Kingfisher

class MyPageViewController: UIViewController, ChartViewDelegate {
    
    var newUserRecords: ActiveRecord?
    
    let nicknameView = NicknameView()
    let countCloverView = CountCloverView()
    let statsView = StatsView()
    let statsByMonthView = StatsByMonthView()
    let statsByHourView = StatsByHourView()
    let statsByDayOfTheWeekView = StatsByDayOfTheWeekView()
    let statsByTagView = StatsByTagView()
    
    let scrollView = UIScrollView().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .clear
        $0.showsVerticalScrollIndicator = false
    }
    
    let contentView = UIView().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    let settingImageView = UIImageView().then {
        $0.image = UIImage(named: "setting")
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    lazy var settingBtn = UIButton().then {
        $0.backgroundColor = .clear
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        
        nicknameView.backgroundColor = .white
        countCloverView.backgroundColor = .white
        statsView.backgroundColor = .white
        scrollView.insetsLayoutMarginsFromSafeArea = (0 != 0)
        
        settingBtn.addTarget(self, action: #selector(settingBtnTapped), for: .touchUpInside)
        nicknameView.editNicknameBtn.addTarget(self, action: #selector(editNicknameBtnTapped), for: .touchUpInside)
        
        getProfileWithAPI()
        userRecordsWithAPI()
        monthRecordsWithAPI()
        dayRecordsWithAPI()
        hourRecordsWithAPI()
        tagRecordsWithAPI()
        
        setUpView()
        setUpConstraints()
    }
    
    // 네비게이션 바 숨기기
    override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
        setUpNavBar()
        getProfileWithAPI()
        tabBarController?.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    // 다른 뷰로 이동 시 네비게이션 바 보이게 설정
    override func viewWillDisappear(_ animated: Bool) {
            super.viewWillDisappear(animated)
        tabBarController?.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    func setUpView() {
        self.view.addSubview(settingBtn)
        settingBtn.addSubview(settingImageView)
        self.view.addSubview(scrollView)
        self.scrollView.addSubview(contentView)
        [nicknameView, countCloverView, statsView].forEach {
            contentView.addSubview($0)
        }
    }
    
    func setUpConstraints() {
        
        settingBtn.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(12)
            $0.trailing.equalToSuperview().inset(14.28)
            $0.height.equalTo(Constant.height * 20)
            $0.width.equalTo(Constant.width * 19.45)
        }
        settingImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        scrollView.snp.makeConstraints {
            $0.top.equalTo(settingImageView.snp.bottom).offset(12)
            $0.leading.trailing.bottom.equalToSuperview()
        }
        contentView.snp.makeConstraints {
            $0.top.bottom.leading.trailing.equalToSuperview()
            $0.width.equalToSuperview()
        }
        nicknameView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(countCloverView.snp.top)
        }
        countCloverView.snp.makeConstraints {
            $0.top.equalTo(nicknameView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(statsView.snp.top)
        }
        statsView.snp.makeConstraints {
            $0.top.equalTo(countCloverView.snp.bottom)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    @objc
    func editNicknameBtnTapped() {
        let editProfileViewController = EditProfileViewController()
        editProfileViewController.nickname = self.nicknameView.nicknameLbl.text ?? ""
        editProfileViewController.image = self.nicknameView.profileImageView.image
        navigationController?.pushViewController(editProfileViewController, animated: false)
    }
    
    @objc
    func settingBtnTapped() {
        let settingViewController = SettingViewController()
        navigationController?.pushViewController(settingViewController, animated: false)
    }
}

// MARK: - Network
extension MyPageViewController {
    // MARK: - 프로필 조회
    func getProfileWithAPI() {
        ProfileAPI.shared.getProfile { [weak self] response in
            switch response {
            case .success(let getProfileData):
                if let data = getProfileData as? GetProfileResponse {
                    guard let url = URL(string: data.image) else { return }
                    self!.nicknameView.profileImageView.kf.setImage(with: url)
                    self!.nicknameView.nicknameLbl.text = data.nickname
                    
                }
                print("getProfileWithAPI - success")
            case .requestError(let resultCode, let message):
                print("getProfileWithAPI - requestError: [\(resultCode)] \(message)")
            case .pathError:
                print("getProfileWithAPI - pathError")
            case .serverError:
                print("getProfileWithAPI - serverError")
            case .networkFail:
                print("getProfileWithAPI - networkFail")
            }
            
        }
    }
    
    // MARK: - 활동 종합 조회
    func userRecordsWithAPI() {
        MyPageAPI.shared.userRecords { [weak self] response in
            guard let self else {return}
            switch response {
            case .success(let data):
                print(data)
                if let records = data as? ActiveRecord {
                    self.newUserRecords = records
                    guard let activeDay = self.newUserRecords?.activeDay else {return}
                    guard let countHappy = self.newUserRecords?.countHappy else {return}
                    guard let countTag = self.newUserRecords?.countTag else {return}
                    guard let recordDay = self.newUserRecords?.recordDay else {return}
                    self.countCloverView.countDaysLbl.text = String(activeDay)
                    self.countCloverView.found1Lbl.text = String(countHappy)
                    self.countCloverView.made1Lbl.text = String(countTag)
                    self.countCloverView.recorded1Lbl.text = String(recordDay)
                }
            case .requestError(let resultCode, let message):
                print("userRecordsWithAPI - requestError: [\(resultCode)] \(message)")
            case .pathError:
                print("userRecordsWithAPI - pathError")
            case .serverError:
                print("userRecordsWithAPI - serverError")
            case .networkFail:
                print("userRecordsWithAPI - networkFail")
            }
        }
    }
    
    // MARK: - 활동 월별 조회
    func monthRecordsWithAPI() {
        MyPageAPI.shared.monthRecords { [weak self] response in
            guard let self else {return}
            switch response {
            case .success(let data):
                print("\(data)")
                if let records = data as? [MonthRecord] {
                    print("성공!")
                    self.statsView.statsByMonthView.setChart(dataPoints: self.statsByMonthView.months, values: records.map {
                        Double($0.countMonth)
                    }) // self.statsView.statsByMonthView로 한 이유: 먼저 값이 들어와야함
                    let monthOrdered = records.map {
                        $0.month
                    }
                    let countDayOrdered = records.map {
                        $0.countMonth
                    }
                    let mostRecordMonthOrdered = records.map {
                        $0.mostRecordMonth
                    }
                    let monthView = self.statsView.statsByMonthView
                    for i in 0...11 {
                        if records[i].countMonth == 0 {
                            [monthView.greenLbl, monthView.grayLbl].forEach { $0.textColor = .clear }
                        }
                        if mostRecordMonthOrdered[i] == true {
                            self.statsView.statsByMonthView.greenLbl.text = monthOrdered[i]
                        }
                    }
                } else {print("실패..")}
            case .requestError(let resultCode, let message):
                print("monthRecordsWithAPI - requestError: [\(resultCode)] \(message)")
            case .pathError:
                print("monthRecordsWithAPI - pathError")
            case .serverError:
                print("monthRecordsWithAPI - serverError")
            case .networkFail:
                print("monthRecordsWithAPI - networkFail")
            }
        }
    }
    
    // MARK: - 활동 요일별 조회
    func dayRecordsWithAPI() {
        MyPageAPI.shared.dayRecords { [weak self] response in
            guard let self else {return}
            switch response {
            case .success(let data):
                print("\(data)")
                if let records = data as? [DayRecord] {
                    print("성공!")
                    self.statsView.statsByDayOfTheWeekView.setChart(dataPoints: self.statsByDayOfTheWeekView.daysOfTheWeek, values: records.map {
                        Double($0.countDay)
                    })
                    let dayOfWeekOrdered = records.map {
                        $0.dayOfWeek
                    }
                    let countDayOrdered = records.map {
                        $0.countDay
                    }
                    let mostRecordDayOrdered = records.map {
                        $0.mostRecordDay
                    }
                    let dayView = self.statsView.statsByDayOfTheWeekView
                    for i in 0...6 {
                        if records[i].countDay == 0 {
                            [dayView.greenLbl, dayView.grayLbl].forEach { $0.textColor = .clear }
                        }
                        if mostRecordDayOrdered[i] == true {
                            self.statsView.statsByDayOfTheWeekView.greenLbl.text = dayOfWeekOrdered[i]
                        }
                    }
                } else {print("실패..")}
            case .requestError(let resultCode, let message):
                print("monthRecordsWithAPI - requestError: [\(resultCode)] \(message)")
            case .pathError:
                print("monthRecordsWithAPI - pathError")
            case .serverError:
                print("monthRecordsWithAPI - serverError")
            case .networkFail:
                print("monthRecordsWithAPI - networkFail")
            }
        }
    }
    
    // MARK: - 활동 시간별 조회
    func hourRecordsWithAPI() {
        MyPageAPI.shared.hourRecords { [weak self] response in
            guard let self else {return}
            switch response {
            case .success(let data):
                print("\(data)")
                if let records = data as? [HourRecord] {
                    print("성공!")
                    self.statsView.statsByHourView.setChart(dataPoints: self.statsByHourView.time, values: records.map {
                        Double($0.countTime)
                    })
                    let timeOrdered = records.map {
                        $0.time
                    }
                    let countTimeOrdered = records.map {
                        $0.countTime
                    }
                    let mostRecordTimeOrdered = records.map {
                        $0.mostRecordTime
                    }
                    let hourView = self.statsView.statsByHourView
                    for i in 0...4 {
                        if records[i].countTime == 0 {
                            [hourView.greenLbl, hourView.grayLbl].forEach { $0.textColor = .clear }
                        }
                        if mostRecordTimeOrdered[i] == true {
                            self.statsView.statsByHourView.greenLbl.text = timeOrdered[i]
                        }
                    }
                } else {print("실패..")}
            case .requestError(let resultCode, let message):
                print("monthRecordsWithAPI - requestError: [\(resultCode)] \(message)")
            case .pathError:
                print("monthRecordsWithAPI - pathError")
            case .serverError:
                print("monthRecordsWithAPI - serverError")
            case .networkFail:
                print("monthRecordsWithAPI - networkFail")
            }
        }
    }
    
    // MARK: - 활동 태그별 조회
    func tagRecordsWithAPI() {
        MyPageAPI.shared.tagRecords { [weak self] response in
            guard let self else {return}
            switch response {
            case .success(let data):
                print("\(data)")
                if let records = data as? [TagRecord] {
                    print("성공!")
                    self.statsView.statsByTagView.setChart(
                        dataPoints: records.map {
                            ($0.tagName)},
                        values: records.map {
                            Double($0.countTag)})
                    let tagNameOrdered = records.map {
                        $0.tagName
                    }
                    let countTagOrdered = records.map {
                        $0.countTag
                    }
                    let tagView = self.statsView.statsByTagView // StatsView().statsByTagView로 하면 아래 if-else 문 적용이 안됨
                    if countTagOrdered.count == 0 {
                        [tagView.top1Lbl, tagView.top2Lbl, tagView.top3Lbl, tagView.top4Lbl, tagView.top5Lbl, tagView.tag1Lbl, tagView.tag2Lbl, tagView.tag3Lbl, tagView.tag4Lbl, tagView.tag5Lbl, tagView.countTag1Lbl, tagView.countTag2Lbl, tagView.countTag3Lbl, tagView.countTag4Lbl, tagView.countTag5Lbl].forEach { $0.textColor = .clear }
                        [tagView.border1View, tagView.border2View, tagView.border3View, tagView.border4View].forEach { $0.backgroundColor = .clear }
                    } else if countTagOrdered.count == 1 {
                        [tagView.top2Lbl, tagView.top3Lbl, tagView.top4Lbl, tagView.top5Lbl, tagView.tag2Lbl, tagView.tag3Lbl, tagView.tag4Lbl, tagView.tag5Lbl, tagView.countTag2Lbl, tagView.countTag3Lbl, tagView.countTag4Lbl, tagView.countTag5Lbl].forEach { $0.textColor = .clear }
                        [tagView.border1View, tagView.border2View, tagView.border3View, tagView.border4View].forEach { $0.backgroundColor = .clear }
                        self.statsView.statsByTagView.tag1Lbl.text = "\(tagNameOrdered[0])"
                        self.statsView.statsByTagView.countTag1Lbl.text = "\(countTagOrdered[0])개"
                    } else if countTagOrdered.count == 2 {
                        [tagView.top3Lbl, tagView.top4Lbl, tagView.top5Lbl, tagView.tag3Lbl, tagView.tag4Lbl, tagView.tag5Lbl, tagView.countTag3Lbl, tagView.countTag4Lbl, tagView.countTag5Lbl].forEach { $0.textColor = .clear }
                        [tagView.border2View, tagView.border3View, tagView.border4View].forEach { $0.backgroundColor = .clear }
                        self.statsView.statsByTagView.tag1Lbl.text = "\(tagNameOrdered[0])"
                        self.statsView.statsByTagView.tag2Lbl.text = "\(tagNameOrdered[1])"
                        self.statsView.statsByTagView.countTag1Lbl.text = "\(countTagOrdered[0])개"
                        self.statsView.statsByTagView.countTag2Lbl.text = "\(countTagOrdered[1])개"
                    } else if countTagOrdered.count == 3 {
                        [tagView.top4Lbl, tagView.top5Lbl, tagView.tag4Lbl, tagView.tag5Lbl, tagView.countTag4Lbl, tagView.countTag5Lbl].forEach { $0.textColor = .clear }
                        [tagView.border3View, tagView.border4View].forEach { $0.backgroundColor = .clear }
                        self.statsView.statsByTagView.tag1Lbl.text = "\(tagNameOrdered[0])"
                        self.statsView.statsByTagView.tag2Lbl.text = "\(tagNameOrdered[1])"
                        self.statsView.statsByTagView.tag3Lbl.text = "\(tagNameOrdered[2])"
                        self.statsView.statsByTagView.countTag1Lbl.text = "\(countTagOrdered[0])개"
                        self.statsView.statsByTagView.countTag2Lbl.text = "\(countTagOrdered[1])개"
                        self.statsView.statsByTagView.countTag3Lbl.text = "\(countTagOrdered[2])개"
                    } else if countTagOrdered.count == 4 {
                        [tagView.top5Lbl, tagView.tag5Lbl, tagView.countTag5Lbl].forEach { $0.textColor = .clear }
                        [tagView.border4View].forEach { $0.backgroundColor = .clear }
                        self.statsView.statsByTagView.tag1Lbl.text = "\(tagNameOrdered[0])"
                        self.statsView.statsByTagView.tag2Lbl.text = "\(tagNameOrdered[1])"
                        self.statsView.statsByTagView.tag3Lbl.text = "\(tagNameOrdered[2])"
                        self.statsView.statsByTagView.tag4Lbl.text = "\(tagNameOrdered[3])"
                        self.statsView.statsByTagView.countTag1Lbl.text = "\(countTagOrdered[0])개"
                        self.statsView.statsByTagView.countTag2Lbl.text = "\(countTagOrdered[1])개"
                        self.statsView.statsByTagView.countTag3Lbl.text = "\(countTagOrdered[2])개"
                        self.statsView.statsByTagView.countTag4Lbl.text = "\(countTagOrdered[3])개"
                    } else if countTagOrdered.count == 5 {
                        self.statsView.statsByTagView.tag1Lbl.text = "\(tagNameOrdered[0])"
                        self.statsView.statsByTagView.tag2Lbl.text = "\(tagNameOrdered[1])"
                        self.statsView.statsByTagView.tag3Lbl.text = "\(tagNameOrdered[2])"
                        self.statsView.statsByTagView.tag4Lbl.text = "\(tagNameOrdered[3])"
                        self.statsView.statsByTagView.tag5Lbl.text = "\(tagNameOrdered[4])"
                        self.statsView.statsByTagView.countTag1Lbl.text = "\(countTagOrdered[0])개"
                        self.statsView.statsByTagView.countTag2Lbl.text = "\(countTagOrdered[1])개"
                        self.statsView.statsByTagView.countTag3Lbl.text = "\(countTagOrdered[2])개"
                        self.statsView.statsByTagView.countTag4Lbl.text = "\(countTagOrdered[3])개"
                        self.statsView.statsByTagView.countTag5Lbl.text = "\(countTagOrdered[4])개"
                    } else {
                        self.statsView.statsByTagView.tag1Lbl.text = "\(tagNameOrdered[0])"
                        self.statsView.statsByTagView.tag2Lbl.text = "\(tagNameOrdered[1])"
                        self.statsView.statsByTagView.tag3Lbl.text = "\(tagNameOrdered[2])"
                        self.statsView.statsByTagView.tag4Lbl.text = "\(tagNameOrdered[3])"
                        self.statsView.statsByTagView.tag5Lbl.text = "\(tagNameOrdered[4])"
                        self.statsView.statsByTagView.countTag1Lbl.text = "\(countTagOrdered[0])개"
                        self.statsView.statsByTagView.countTag2Lbl.text = "\(countTagOrdered[1])개"
                        self.statsView.statsByTagView.countTag3Lbl.text = "\(countTagOrdered[2])개"
                        self.statsView.statsByTagView.countTag4Lbl.text = "\(countTagOrdered[3])개"
                        self.statsView.statsByTagView.countTag5Lbl.text = "\(countTagOrdered[4])개"
                    }
                } else {print("실패..")}
            case .requestError(let resultCode, let message):
                print("monthRecordsWithAPI - requestError: [\(resultCode)] \(message)")
            case .pathError:
                print("monthRecordsWithAPI - pathError")
            case .serverError:
                print("monthRecordsWithAPI - serverError")
            case .networkFail:
                print("monthRecordsWithAPI - networkFail")
            }
        }
    }
}
