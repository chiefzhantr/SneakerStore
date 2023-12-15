//
//  OnboardingViewController.swift
//  SneakerStore
//
//  Created by Zhantore on 15.12.2023.
//

import UIKit

final class OnboardingViewController: UIViewController {
    //MARK: Private properties
    private let viewControllers = [
            OnboardingPageViewController(title: "", description: "", backgroundImage: UIImage())
    ]
    private let pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal)
    
    //MARK: Public properties
    
    
    //MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configurePageViewController()
    }
    
    //MARK: Helpers
    private func configurePageViewController() {
        pageViewController.delegate = self
        pageViewController.dataSource = self
    }
}

extension OnboardingViewController: UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        return nil
    }
    
    
}
