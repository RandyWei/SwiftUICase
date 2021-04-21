//
//  SwiperView.swift
//  SwiftUIBasicDemo
//
//  Created by RandyWei on 2021/4/17.
//

import UIKit
import SwiftUI

struct Swiper<SwiperItem:View>: UIViewControllerRepresentable {
    
    private var swiperItem:[SwiperItem] = []
    
    @Binding private var currentPage:Int
    
    init(with items:[SwiperItem], selection: Binding<Int>) {
        self.swiperItem = items
        self._currentPage = selection
    }
    
    func makeUIViewController(context: Context) -> UIPageViewController {
        let controller = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal)
        controller.dataSource = context.coordinator
        controller.delegate = context.coordinator
        return controller
    }
    
    func updateUIViewController(_ uiViewController: UIPageViewController, context: Context) {
        uiViewController.setViewControllers([context.coordinator.controllers[currentPage]], direction: .forward, animated: true, completion: nil)
    }
    
    typealias UIViewControllerType = UIPageViewController
    
    func makeCoordinator() -> PageCoordinator {
        PageCoordinator(self)
    }
    
    class PageCoordinator: NSObject,UIPageViewControllerDelegate,UIPageViewControllerDataSource {
        func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
            
            guard let index = controllers.firstIndex(of: viewController) else {
                return nil
            }
            
            if index == 0 {
                return controllers.last
            }
            
            return controllers[index - 1]
        }
        
        func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
            
            guard let index = controllers.firstIndex(of: viewController) else {
                return nil
            }
            
            if index == controllers.count - 1 {
                return controllers.first
            }
            
            return controllers[index + 1]
            
        }
        
        func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
            if completed,
               let visiableController = pageViewController.viewControllers?.first,
               let index = controllers.firstIndex(of: visiableController){
                parent.currentPage = index
            }
        }
        
        
        var controllers = [UIViewController]()
        private var parent: Swiper
        
        init(_ parent: Swiper) {
            self.parent = parent
            controllers = parent.swiperItem.map({
                let controller = UIHostingController(rootView: $0)
                return controller
            })
        }
    }
}


struct SwiperControl:UIViewRepresentable {
    
    var numberOfPages:Int
    
    @Binding var currentPage:Int
    
    func makeUIView(context: Context) -> UIPageControl {
        let control = UIPageControl()
        control.numberOfPages = numberOfPages
        control.addTarget(context.coordinator, action: #selector(context.coordinator.onChanged(sender:)), for: .valueChanged)
        return control
    }
    
    func updateUIView(_ uiView: UIPageControl, context: Context) {
        uiView.currentPage = currentPage
    }
    
    typealias UIViewType = UIPageControl
    
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject{
        var parent: SwiperControl
        
        init(_ parent: SwiperControl) {
            self.parent = parent
        }
        
        @objc func onChanged(sender: UIPageControl) {
            parent.currentPage = sender.currentPage
        }
        
    }
    
}
