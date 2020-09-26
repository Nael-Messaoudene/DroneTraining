//
//  FirstMoveViewController.swift
//  SparkPerso
//
//  Created by Nael Messaoudene on 23/09/2020.
//  Copyright © 2020 AlbanPerli. All rights reserved.
//

import UIKit
import DJISDK

class FirstMoveViewController: UIViewController {

//    let commonValue:Float = 0.5
//
//    struct Movement {
//
//        enum MovementType {
//            case forward,backward,left,right,up,down
//        }
//
//        var value:Float
//        var type:MovementType
//    }
//
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("OKOKOKOK")

        // Do any additional setup after loading the view.
    }
    
    
    
    @IBAction func startSequence(_ sender: UIButton) {
        SeqManager.instance.move()
    }
    
    @IBAction func left(_ sender: UIButton) {
        print("left")
        
        if let mySpark = DJISDKManager.product() as? DJIAircraft {
            mySpark.mobileRemoteController?.rightStickHorizontal = -0.5
        }
    }
    @IBAction func right(_ sender: UIButton) {
        print("right")
        
        if let mySpark = DJISDKManager.product() as? DJIAircraft {
            mySpark.mobileRemoteController?.rightStickHorizontal = 0.5
        }
        
    }
    @IBAction func backward(_ sender: UIButton) {
        print("backward")
//        sendCommand(Movement(value: -commonValue, type: .backward))
        
        if let mySpark = DJISDKManager.product() as? DJIAircraft {
            mySpark.mobileRemoteController?.rightStickVertical = -0.5
        }
    }
    
    @IBAction func forward(_ sender: UIButton) {
        print("forward")
        
        if let mySpark = DJISDKManager.product() as? DJIAircraft {
            mySpark.mobileRemoteController?.rightStickVertical = 0.5
        }
//        let mov = Movement(value: commonValue, type: .forward)
//        sendCommand(mov)
//
    }
    
    @IBAction func down(_ sender: UIButton) {
        print("down ")
//        sendCommand(Movement(value: -commonValue, type: .down))
        
        if let mySpark = DJISDKManager.product() as? DJIAircraft {
            mySpark.mobileRemoteController?.leftStickVertical = -0.5
        }
    }
    
    
    @IBAction func up(_ sender: UIButton) {
        print("up ")
//        sendCommand(Movement(value: commonValue, type: .up))
        
        if let mySpark = DJISDKManager.product() as? DJIAircraft {
            mySpark.mobileRemoteController?.leftStickVertical = 0.5
        }

    }
    
    
    @IBAction func landing(_ sender: UIButton) {
        print("landing ")
        if let mySpark = DJISDKManager.product() as? DJIAircraft {
            if let flightController = mySpark.flightController {
                flightController.startLanding(completion: { (err) in
                    print(err.debugDescription)
                })
            }
        }
    }
    
    
    @IBAction func takeOff(_ sender: UIButton) {
        print("take off ")
        
        if let mySpark = DJISDKManager.product() as? DJIAircraft {
            if let flightController = mySpark.flightController {
                flightController.startTakeoff(completion: { (err) in
                    print(err.debugDescription)
                })
            }
        }
        
    }
    @IBAction func stop(_ sender: UIButton) {
        print("stop")
        SeqManager.instance.clear()
        if let mySpark = DJISDKManager.product() as? DJIAircraft {
            mySpark.mobileRemoteController?.leftStickVertical = 0.0
            mySpark.mobileRemoteController?.leftStickHorizontal = 0.0
            mySpark.mobileRemoteController?.rightStickHorizontal = 0.0
            mySpark.mobileRemoteController?.rightStickVertical = 0.0
        }
    }
    
    

    
//
//    func sendCommand(_ movement:Movement) {
//        if let mySpark = DJISDKManager.product() as? DJIAircraft {
//            switch movement.type {
//            case .forward,.backward:
//                mySpark.mobileRemoteController?.rightStickVertical = movement.value
//            case .left,.right:
//                mySpark.mobileRemoteController?.rightStickHorizontal = movement.value
//            case .up,.down:
//                mySpark.mobileRemoteController?.leftStickVertical = movement.value
//            }
//        }
//    }
    /*
    // MARK: - Navigation


     // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
