//
//  ViewController.swift
//  GCD Swift3
//
//  Created by Yoel Lev on 3/27/17.
//  Copyright © 2017 Yoel Lev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
     @IBOutlet weak var imageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // Sync and Async Queues
        
        //simpleSyncQueues()
        
        //simpleAsyncQueues()
       

        
       //  queuesWithQoS()
        
        
         concurrentQueues()
         if let queue = inactiveQueue {
         queue.activate()
            
            
         }
        
        
        // queueWithDelay()
        
        // fetchImage()
        
        // useWorkItem()
    }
    
    
    
    func simpleSyncQueues() {
        
        print("##### Synchronous Execution ##### ")
        
        //Will be executed in the background in a Synchronous execution
        let queue = DispatchQueue(label: "com.yoelev.simpleSyncQueues")
        
        queue.sync {
            for i in 0..<10 {
            print("🍎",i)
            
            }
        }
        
        //Will be executed on the main queue
        for i in 100..<110 {
            print("Ⓜ️", i)
        }
 
         print("##### END Synchronous Execution ##### ", "\n")
    }

    func simpleAsyncQueues(){
        
         print("##### Asynchronous Execution ##### ")
        
       //Will be executed in the background in a Asynchronous execution
        let queueAs = DispatchQueue(label: "com.yoelev.simpleAsyncQueues")
        
        queueAs.async {
            for i in 0..<10 {
                print("🍎",i)
                
            }
        }
        
        //Will be executed on the main queue
        for i in 100..<110 {
            print("Ⓜ️", i)
        }

         print("##### END Asynchronous Execution ##### ")
    }
    
    
    
    /*
     # Quality Of Service  Priority Table #
     
     • userInteractive (Highest)
     • userInitiated
     • default
     • utility
     • background
     • unspecified (Lowest)
     
     */
    
    
    //Quality Of Service (QoS) and Priorities
    func queuesWithQoS() {
        
         print("##### Quality Of Service Execution ##### ", "\n")
        
        let queue1 = DispatchQueue(label: "com.yoelev.queue1", qos: DispatchQoS.userInitiated)
       // let queue2 = DispatchQueue(label: "com.yoelev.queue2", qos: DispatchQoS.userInitiated)
        
     //   let queue1 = DispatchQueue(label: "com.yoelev.queue1", qos: DispatchQoS.background)
        let queue2 = DispatchQueue(label: "com.yoelev.queue2", qos: DispatchQoS.utility)
        
        
        queue1.async {
            for i in 0..<10 {
                print("🍎",i)
                
            }
        }
        
        
        queue2.async {
            for i in 100..<110 {
                print("🔵",i)
                
            }
        }
        
        
        
        for i in 1000..<1010 {
            print("Ⓜ️", i)
        }
        
     
         print("##### END Quality Of Service Execution ##### ", "\n")
        
    }
    
    
    
    
    //Concurrent Queues 
    var inactiveQueue: DispatchQueue!
    
    func concurrentQueues() {
        
        print("##### Concurrent Queues Execution ##### ", "\n")
        
//        let anotherQueue = DispatchQueue(label: "com.yoelev.anotherQueue", qos: .utility)
//        let anotherQueue = DispatchQueue(label: "com.yoelev.anotherQueue", qos: .utility, attributes: .concurrent)
        
    let anotherQueue = DispatchQueue(label: "com.yoelev.anotherQueue", qos: .userInitiated, attributes: [.concurrent, .initiallyInactive])
        inactiveQueue = anotherQueue
        

        anotherQueue.async {
            for i in 0..<10 {
                print("🔴",i)
                
            }
        }
        
        anotherQueue.async {
            for i in 100..<110 {
                print("🔵",i)
                
            }
        }
        
        anotherQueue.async {
            for i in 100..<110 {
                print("⚫️",i)
                
            }
        }
        
        anotherQueue.async {
            print("##### End Concurrent Queues Execution ##### ", "\n")

        }
        
    }
    
    //Delaying the Execution
    func queueWithDelay() {
        
        
        
    }
    
    
    func fetchImage() {
        
    }
    
    
    func useWorkItem() {
        
    }

}

