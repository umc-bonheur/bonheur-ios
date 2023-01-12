import UIKit

final class ViewController: UIViewController {

    // MARK: - 각자 화면으로 가는 버튼
    
    private lazy var rockyButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("Rocky", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor.systemGreen
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20) // 폰트 두껍게 20
        button.layer.cornerRadius = 10
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(rockyButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var jeongyeonButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("Jeongyeon", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor.systemGreen
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20) // 폰트 두껍게 20
        button.layer.cornerRadius = 10
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(jeongyeonButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var sarangButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("Sarang", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor.systemGreen
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20) // 폰트 두껍게 20
        button.layer.cornerRadius = 10
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(sarangButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var sohyeonButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("Sohyeon", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor.systemGreen
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20) // 폰트 두껍게 20
        button.layer.cornerRadius = 10
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(sohyeonButtonTapped), for: .touchUpInside)
        return button
    }()
    
    // 각 버튼 스택 뷰로 묶음
    lazy var stackView: UIStackView = {
        let st = UIStackView(arrangedSubviews: [rockyButton, jeongyeonButton, sarangButton, sohyeonButton])
        st.spacing = 50
        st.axis = .vertical
        st.distribution = .fillEqually
        st.alignment = .fill
        return st
    }()
    
    // MARK: - 뷰디드로드
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
        
        makeAutoLayout()
    }
    
    func setup() {
        view.backgroundColor = .white
        
        // 화면에 표시
        view.addSubview(stackView)
    }
    
    func makeAutoLayout() {
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            stackView.heightAnchor.constraint(equalToConstant: 350)
        ])
        
    }

    @objc func rockyButtonTapped() {
        let rockyVC = CalendarViewController()
        
        rockyVC.someString = "Rocky's page"
        
        rockyVC.modalPresentationStyle = .fullScreen // 전체화면으로 띄우기
        present(rockyVC, animated: true, completion: nil)
    }
    
    @objc func jeongyeonButtonTapped() {
        let jeongyeonVC = OnboardingViewController()
        
        jeongyeonVC.modalPresentationStyle = .fullScreen // 전체화면으로 띄우기
        present(jeongyeonVC, animated: true, completion: nil)
    }
        
    @objc func sarangButtonTapped() {
        let sarangVC = MyPageViewController()
        
        sarangVC.someString = "Sarang's page"
        
        sarangVC.modalPresentationStyle = .fullScreen // 전체화면으로 띄우기
        present(sarangVC, animated: true, completion: nil)
    }
        
    @objc func sohyeonButtonTapped() {
        let sohyeonVC = HomeViewController()
        
        // sohyeonVC.someString = "Sohyeon's page"
        
        sohyeonVC.modalPresentationStyle = .fullScreen // 전체화면으로 띄우기
        present(sohyeonVC, animated: true, completion: nil)
    }
}
