//
//  PageViewController.swift
//  PageViewController
//
//  Created by Sakkaphong on 2/6/18.
//  Copyright © 2018 Sakkaphong. All rights reserved.
//

import UIKit

class PageViewController: UIPageViewController {

    lazy var SubViewController = [UIViewController]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.SetupViewcontroller()
        self.SetupPageViewController()
    }
}

extension PageViewController: UIPageViewControllerDataSource {
    
    private func SetupViewcontroller() {
        
        guard let OneViewController = self.storyboard?.instantiateViewController(withIdentifier: "ViewController1") as? OneViewController else { return }
        OneViewController.BackgroundColor = UIColor.red
        SubViewController.append(OneViewController)
        
        guard let SecondViewController = self.storyboard?.instantiateViewController(withIdentifier: "ViewController1") as? OneViewController else { return }
        SecondViewController.BackgroundColor = UIColor.yellow
        SubViewController.append(SecondViewController)
        
        guard let ThirdViewController = self.storyboard?.instantiateViewController(withIdentifier: "ViewController2") as? TwoViewController else { return }
        SubViewController.append(ThirdViewController)
    }
    
    private func SetupPageViewController() {
        self.view.backgroundColor = UIColor.white
        
        self.dataSource = self
        
        guard let first = SubViewController.first else { return }
        setViewControllers([first], direction: .forward, animated: true, completion: nil)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        let CurrentIndex : Int = SubViewController.index(of: viewController) ?? 0
        guard CurrentIndex > 0 else { return SubViewController.last }
        
        return SubViewController[CurrentIndex - 1]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        let CurrentIndex : Int = SubViewController.index(of: viewController) ?? 0
        guard CurrentIndex < SubViewController.count-1 else { return SubViewController.first }
        
        return SubViewController[CurrentIndex + 1]
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return SubViewController.count
    }
}


