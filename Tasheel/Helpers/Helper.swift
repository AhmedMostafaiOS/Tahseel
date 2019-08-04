

import UIKit
import NVActivityIndicatorView
import ObjectMapper

let activityIndicatorView = NVActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 60, height: 60), type: .ballSpinFadeLoader, color: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), padding: CGFloat(0))
let appDelegate = UIApplication.shared.delegate as! AppDelegate
let activityIndicatorShadedView = UIView(frame: CGRect(x: 0, y: 0, width: (appDelegate.window?.frame.size.width)!, height: (appDelegate.window?.frame.size.height)!))

class Helper: NSObject {
   
    static func showProgress(){
        UIApplication.shared.beginIgnoringInteractionEvents()
        activityIndicatorView.center = CGPoint(x: (appDelegate.window?.frame.size.width)! / 2, y: (appDelegate.window?.frame.size.height)! / 2)
        activityIndicatorShadedView.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
       activityIndicatorShadedView.alpha = 0.4
        activityIndicatorView.startAnimating()
        activityIndicatorShadedView.addSubview(activityIndicatorView)
        appDelegate.window?.addSubview(activityIndicatorShadedView)
        
    }
    static func dismissProgress(){
        activityIndicatorView.stopAnimating()
        activityIndicatorShadedView.removeFromSuperview()
        UIApplication.shared.endIgnoringInteractionEvents()
    }
    
    static func initViewControllerWith(identifier:String,and title:String,storyboardName:String = "Main") -> UIViewController{
        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: identifier)
        vc.title = title
        return vc
    }
}
