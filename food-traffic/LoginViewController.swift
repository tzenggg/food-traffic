//
//  LoginViewController.swift
//  
//
//  Created by Kevin Tzeng on 7/12/17.
//
//

import UIKit
import FirebaseAuthUI
import FirebaseAuth
import FirebaseDatabase
import AVFoundation
class LoginViewController: UIViewController {

    var Player: AVPlayer!
    var PlayerLayer: AVPlayerLayer!
    var paused: Bool = false
    @IBOutlet weak var peopleLine: UIImageView!
    @IBOutlet weak var loginButton: UIButton!
    override func viewDidLoad() {
        /*
        let theURL = Bundle.main.url(forResource: "STAYINQUEUE", withExtension: "mp4")
        
        Player = AVPlayer(url: theURL!)
        
        PlayerLayer = AVPlayerLayer(player: Player)
        PlayerLayer.videoGravity = AVLayerVideoGravityResize
        Player.volume = 0
        Player.actionAtItemEnd = AVPlayerActionAtItemEnd.none
        
        PlayerLayer.frame = view.layer.bounds
        view.backgroundColor = UIColor.clear
        view.layer.insertSublayer(PlayerLayer, at: 0)
        
        NotificationCenter.default.addObserver(self,
                                                         selector: "playerItemDidReachEnd:",
                                                         name: NSNotification.Name.AVPlayerItemDidPlayToEndTime,
                                                         object: Player.currentItem)
        */
        peopleLine.loadGif(name: "giphy")
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
        /*
    func playerItemDidReachEnd(notification: NSNotification) {
        let p: AVPlayerItem = notification.object as! AVPlayerItem
        p.seek(to: kCMTimeZero)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        Player.play()
        paused = false
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        Player.pause()
        paused = true
    }
*/
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func loginButtonTapped(_ sender: UIButton) {
        guard let authUI = FUIAuth.defaultAuthUI()
            else { return }
        
        // 2
        authUI.delegate = self
        
        // 3
        let authViewController = authUI.authViewController()
        present(authViewController, animated: true)
    }
}
extension LoginViewController: FUIAuthDelegate {
    func authUI(_ authUI: FUIAuth, didSignInWith user: User?, error: Error?) {
        if let error = error {
            assertionFailure("Error signing in: \(error.localizedDescription)")
            return
        }
        guard let user = user
            else {return}
        
        let storyboard = UIStoryboard(name: "Businesses", bundle: .main)
        if let initialViewController = storyboard.instantiateInitialViewController() {
        self.view.window?.rootViewController = initialViewController
        self.view.window?.makeKeyAndVisible()
        }
   
    }
}


