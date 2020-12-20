//
//  ViewController.swift
//  TestMyStaticLibrary
//
//  Created by p.nosov on 17.12.2020.
//

import UIKit
import MyStaticLibrary

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()


        debugPrint(MyStaticLibrary.Networking.tellMeAJoke())

        loadImageFromBundle()

        mainBundleInfo()
    }

    func mainBundleInfo() {
        let bundle = Bundle.main
//        print(bundle.allBundles)
//        print("________________________")
//        print(bundle.allFrameworks)
//        print("________________________")
//        print(bundle.localizations)
        print(bundle.infoDictionary?["CFBundleName"])
        print(bundle.localizedInfoDictionary?["CFBundleName"])
    }

    func loadImageFromBundle() {
        guard let resourcePath = Bundle.main.path(forResource: "Resources", ofType: "bundle"),
              let bundle = Bundle(path: resourcePath),
              let image = UIImage(named: "troll.jpg", in: bundle, with: nil) else {
            return
        }
        imageView.image = image
    }

    @IBAction func showControllerFromBundle(_ sender: Any) {
        guard let resourcePath = Bundle.main.path(forResource: "Resources", ofType: "bundle"),
              let bundle = Bundle(path: resourcePath) else {
            return
        }

        guard let vc = UIStoryboard(name: "Main", bundle: bundle).instantiateInitialViewController() else {
            return
        }


        navigationController?.present(vc, animated: true, completion: nil)
    }


}

