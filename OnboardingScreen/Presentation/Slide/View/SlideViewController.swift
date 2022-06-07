//
//  SlideViewController.swift
//  OnboardingScreen
//
//  Created by Pinto Junior, William James on 03/06/22.
//

import UIKit

class SlideViewController: UIViewController {
    // MARK: - Constrants
    fileprivate let resuseIdentifierScreen = "ScreenCollectionViewCell"
    
    // MARK: - Variables
    fileprivate var viewModel: SlideViewModel = {
        return SlideViewModel()
    }()
    fileprivate var allScreen: [UIView] = []
    
    // MARK: - Components
    fileprivate let stackBase: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 0
        stack.distribution = .fill
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    fileprivate let collectionViewScreen: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .clear
        collectionView.isPagingEnabled = true
        return collectionView
    }()
    
    fileprivate let pageControlScreen: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.currentPage = 0
        pageControl.pageIndicatorTintColor = .lightGray
        pageControl.currentPageIndicatorTintColor = .white
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        return pageControl
    }()
    
    fileprivate lazy var buttonPrev: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Prev", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 14, weight: .bold)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(handleButtonPrev), for: .touchUpInside)
        button.tag = 0
        return button
    }()
    
    fileprivate lazy var buttonNext: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Next", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 14, weight: .bold)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(handleButtonNext), for: .touchUpInside)
        button.tag = 1
        return button
    }()
    
    fileprivate lazy var buttonSkip: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Skip", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 14, weight: .bold)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(handleButtonSkip), for: .touchUpInside)
        button.tag = 1
        return button
    }()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupVC()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    // MARK: - Action
    @objc func handleButtonPrev(button: UIButton) {
        var current = pageControlScreen.currentPage
        
        if current - 1 < 0 {
            return
        }
        
        current -= 1
        setButtonsByPosition(current)

        collectionNavigation(current: current, animated: false)
    }
    
    @objc func handleButtonNext(button: UIButton) {
        var current = pageControlScreen.currentPage
        
        if current + 1 > self.allScreen.count {
            return
        }
        
        current += 1
        setButtonsByPosition(current)
        
        collectionNavigation(current: current, animated: false)
    }
    
    @objc func handleButtonSkip(button: UIButton) {
        var current = pageControlScreen.currentPage
        
        current = self.allScreen.count - 1
        setButtonsByPosition(current)
        
        collectionNavigation(current: current, animated: false)
    }

    // MARK: - Setup
    fileprivate func setupVC() {
        self.view.backgroundColor = UIColor(named: "Backgroud")
        
        self.allScreen = self.viewModel.getScreens()
        self.pageControlScreen.numberOfPages = self.allScreen.count
        setButtonsByPosition(0)
        
        buildHierarchy()
        buildConstraints()
        setupCollection()
    }
    
    fileprivate func setupCollection() {
        collectionViewScreen.dataSource = self
        collectionViewScreen.delegate = self
        collectionViewScreen.bounces = false
        
        collectionViewScreen.register(ScreenCollectionViewCell.self, forCellWithReuseIdentifier: resuseIdentifierScreen)
    }
    
    // MARK: - Methods
    fileprivate func setButtonsByPosition(_ position: Int) {
        switch position {
        case 0:
            self.buttonPrev.isHidden = true
            
        case self.allScreen.count - 1:
            self.buttonNext.isHidden = true
            self.buttonSkip.isHidden = true
            self.buttonPrev.isHidden = false
            
        default:
            self.buttonNext.isHidden = false
            self.buttonPrev.isHidden = false
            self.buttonSkip.isHidden = false
        }
    }
    
    fileprivate func collectionNavigation(current: Int, animated: Bool) {
        let indexPath = IndexPath(item: current, section: 0)
        self.collectionViewScreen.selectItem(at: indexPath, animated: animated, scrollPosition: .centeredHorizontally)
    }
    
    fileprivate func buildHierarchy() {
        view.addSubview(stackBase)
        stackBase.addArrangedSubview(collectionViewScreen)
        
        view.addSubview(pageControlScreen)
        view.addSubview(buttonPrev)
        view.addSubview(buttonNext)
        view.addSubview(buttonSkip)
    }
    
    fileprivate func buildConstraints() {
        NSLayoutConstraint.activate([
            stackBase.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            stackBase.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            stackBase.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            stackBase.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            pageControlScreen.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pageControlScreen.centerYAnchor.constraint(equalTo: buttonPrev.centerYAnchor),
            
            buttonPrev.heightAnchor.constraint(equalToConstant: 48),
            buttonPrev.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            buttonPrev.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -16),
            
            buttonNext.heightAnchor.constraint(equalToConstant: 48),
            buttonNext.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            buttonNext.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -16),
            
            buttonSkip.heightAnchor.constraint(equalToConstant: 48),
            buttonSkip.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            buttonSkip.topAnchor.constraint(equalTo: view.topAnchor, constant: 32),
        ])
    }
}

// MARK: - extension CollectionViewDelegate
extension SlideViewController: UICollectionViewDelegate {
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       return
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let scrollPos = scrollView.contentOffset.x / self.view.frame.width
        pageControlScreen.currentPage = Int(scrollPos)
        setButtonsByPosition(Int(scrollPos))
    }
}

// MARK: - extension CollectionViewDataSource
extension SlideViewController: UICollectionViewDataSource {
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.allScreen.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: resuseIdentifierScreen, for: indexPath) as! ScreenCollectionViewCell
        cell.settingCell(self.allScreen[indexPath.row])
        return cell
    }
}

// MARK: - extension CollectionViewDelegateFlowLayout
extension SlideViewController: UICollectionViewDelegateFlowLayout {
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width
        let height = collectionView.frame.height
        return CGSize(width: width, height: height)
    }
}

