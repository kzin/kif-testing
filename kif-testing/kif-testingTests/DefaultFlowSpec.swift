//
//  KIFFlow.swift
//  kif-testing
//
//  Created by Rodrigo Cavalcante on 10/10/17.
//
//

import Foundation
import Quick
import Nimble
import Nimble_Snapshots
import KIF_Quick
@testable import kif_testing

class DefaultFlowSpec: KIFSpec {
    override func spec() {
        
        describe("DefaultFlowSpec behavior") {
            
            var sut: ViewController!
            var window: UIWindow!
            
            beforeEach {
                window = UIWindow(frame: CGRect(x:0, y:0, width: 320, height: 564))
                window.makeKeyAndVisible()
            }
            
            afterEach {
                UIView.setAnimationsEnabled(false)
                window.isHidden = true
                window = nil
            }
            
            context("on login .success") {
                
                beforeEach {
                    sut = UIStoryboard.init(name: "Main", bundle: nil).instantiateInitialViewController() as! ViewController
                    
                    window.rootViewController = sut
                }
                
                it("should call present homeViewController if username and password are correct") {
                    tester().enterText("user", intoViewWithAccessibilityLabel: "username")
                    tester().enterText("123123", intoViewWithAccessibilityLabel: "password")
                    
                    expect(window).toEventually(haveValidSnapshot(named: "pre login success"))
                    
                    tester().tapView(withAccessibilityLabel: "btnLogin")
                    
                    expect(window).toEventually(haveValidSnapshot(named: "login success"))
                }
                
            }
            
            context("on login .failed") {
                
                beforeEach {
                    sut = UIStoryboard.init(name: "Main", bundle: nil).instantiateInitialViewController() as! ViewController
                    
                    window.rootViewController = sut
                }
                
                it("should call close on delegate when tap close button") {
                    tester().tapView(withAccessibilityLabel: "btnLogin")
                    
                    expect(window).toEventually(haveValidSnapshot(named: "login failed"))
                    
                    tester().tapView(withAccessibilityLabel: "Ok")
                    
                    expect(window).toEventually(haveValidSnapshot(named: "login failed ok"))
                }
                
            }
        }
    }
}
