//
//  AmenityViewTests.swift
//  ContentModulesPackage
//
//  Created by Michael Vorotnstov on 25/04/2025.
//

import XCTest
import iOSSnapshotTestCase
import SwiftUI
import UIKit
@testable import ContentModulesPackage

//@MainActor
//final class AmenityViewTests: FBSnapshotTestCase {
//
//
//    override func setUp()  {
//        // Put setup code here. This method is called before the invocation of each test method in the class.
//        super.setUp()
////        self.recordMode = true
//    }
//
//    override func tearDown() {
//        super.tearDown()
//        // Put teardown code here. This method is called after the invocation of each test method in the class.
//    }
//
//    func testNormal() throws {
//        let snapshotDir = URL(fileURLWithPath: #file).deletingLastPathComponent().appendingPathComponent("__Snapshots__")
//
//        let state = AmenityState(name: "1Apple Store 12", address: "235 Regent St., London W1B 2EL")
//        let view = AmenityView(state: state)
//
//        let hostingVC = UIHostingController(rootView: view)
//        hostingVC.view.frame = CGRect(x: 0, y: 0, width: 720, height: 1080)
//
//        FBSnapshotVerifyViewController(hostingVC, file: snapshotDir.path())
//        XCTFail("Fail!")
//        XCTFail("Fail!")
//    }
//
//    func testLongAddress() throws {
//        let state = AmenityState(name: "Lorem", address: lorem)
//        let view = AmenityView(state: state)
//
//        let hostingVC = UIHostingController(rootView: view)
//
//        FBSnapshotVerifyViewController(hostingVC)
//    }
//
//    func testLongName() throws {
//        let state = AmenityState(name: lorem, address: "235 Regent St., London W1B 2EL")
//        let view = AmenityView(state: state)
//
//        let hostingVC = UIHostingController(rootView: view)
//
//        FBSnapshotVerifyViewController(hostingVC)
//    }
//
//    func testMultiLine() throws {
//        let state = AmenityState(name: lorem, address: "235 Regent St.\n London\n W1B 2EL\nUK")
//        let view = AmenityView(state: state)
//
//        let hostingVC = UIHostingController(rootView: view)
//
//        FBSnapshotVerifyViewController(hostingVC)
//    }
//
//    func testDarkMode() throws {
//        let state = AmenityState(name: "Apple Store", address: "235 Regent St., London W1B 2EL")
//        let view = AmenityView(state: state)
//
//        let hostingVC = UIHostingController(rootView: view)
//        hostingVC.overrideUserInterfaceStyle = .dark
//
//        FBSnapshotVerifyViewController(hostingVC)
//    }
//
//
//
//    let lorem =
//    """
//    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris posuere mauris sed ex vehicula, id iaculis leo malesuada. Mauris facilisis eget nibh ut pulvinar. Suspendisse commodo, quam at dignissim sagittis, augue erat mattis magna, in sollicitudin nulla elit eu lectus. Morbi pellentesque, sapien non ullamcorper rhoncus, ante massa ullamcorper leo, sed aliquam nibh urna ac nisi. Quisque tincidunt tristique lorem quis pharetra. Aliquam tempus a purus eu cursus. Pellentesque elementum sed sapien ac cursus. Sed sagittis ex in dui accumsan consequat. Nullam a odio eu nibh interdum placerat.
//    Duis sapien ante, bibendum sed malesuada et, vehicula quis odio. Integer mollis diam sed sapien malesuada, quis efficitur augue viverra. Quisque a neque tincidunt, bibendum lorem at, euismod sapien. Praesent dictum metus facilisis turpis efficitur, eu suscipit risus placerat. Donec dapibus nibh non elementum lobortis. Nullam porttitor facilisis justo, nec commodo sapien. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. In risus nisi, dapibus ut ligula id, accumsan feugiat lectus. Donec molestie nisi non nulla suscipit consequat. Nunc vulputate augue mi, sit amet vestibulum diam viverra sed. Nulla suscipit faucibus nisi aliquam mollis. Integer leo quam, porttitor non leo non, tincidunt vulputate nulla.
//    Curabitur viverra blandit dui, sit amet porta nibh molestie ultrices. Ut metus diam, faucibus at metus vitae, accumsan efficitur orci. In ut consectetur tortor, ac laoreet lorem. Integer et gravida risus. Praesent at lacus laoreet, rhoncus nibh et, sodales ipsum. Vivamus lobortis cursus nunc, quis fringilla tellus mollis id. Mauris vulputate odio eget quam molestie, ut lacinia nulla dignissim. Donec dapibus tellus lectus. Vestibulum volutpat eu dui at pharetra.
//    Aenean nec tortor orci. Fusce aliquam accumsan velit auctor dapibus. Donec fringilla ante id mauris rhoncus, sit amet posuere lacus dignissim. Nam erat urna, imperdiet eget posuere et, ullamcorper non nunc. Aenean aliquam scelerisque mi, quis convallis ante feugiat nec. Vestibulum aliquet urna quam, tristique tincidunt justo ornare et. Donec non nunc quis turpis dapibus vehicula. Etiam aliquam mattis leo vitae placerat. Aliquam gravida maximus turpis nec ornare. Integer sagittis enim ac diam bibendum consequat. Proin rutrum ac nisl nec porta. Aliquam nulla purus, mattis a nunc eget, porttitor interdum leo. Pellentesque faucibus ultricies magna, imperdiet sodales purus congue eget. In interdum porta ipsum, sed auctor sapien accumsan ac. Duis consequat facilisis urna.
//    Proin sed turpis eu mi consectetur porta dictum at diam. Interdum et malesuada fames ac ante ipsum primis in faucibus. Aliquam venenatis dolor non turpis laoreet suscipit. Curabitur consequat pretium lacus at convallis. Mauris egestas velit eget elit consectetur ultrices. Phasellus rutrum auctor rutrum. Nam id enim est. Nam porta tellus sed posuere euismod. Integer ultricies magna lacus, at auctor erat pulvinar vitae. Duis laoreet cursus nunc sed semper. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Quisque sagittis tortor quis efficitur molestie.
//    Cras dignissim luctus sollicitudin. Interdum et malesuada fames ac ante ipsum primis in faucibus. Nulla quis vestibulum tortor. Nunc elementum auctor odio vel sagittis. Sed dignissim elit neque, sed cursus neque lacinia non. Morbi tortor dui, mattis in rutrum et, suscipit quis erat. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed aliquam lectus eu metus placerat, id ultricies odio lobortis. Nam commodo ultricies dolor vitae sollicitudin. Morbi aliquam feugiat eros et facilisis. Nullam vel efficitur urna, in posuere quam. Phasellus quis malesuada massa, quis euismod ante. Curabitur eget urna arcu. Ut libero orci, suscipit id justo et, mollis imperdiet risus. Donec tristique magna vestibulum nulla egestas, at ultricies elit molestie. Donec venenatis felis imperdiet libero pharetra, at aliquet nisl semper.
//    Praesent ornare ligula id leo placerat, et accumsan leo aliquet. Vestibulum a magna massa. Donec porta semper nisl in tincidunt. Vivamus quis facilisis nisl, vel gravida odio. Fusce ultrices bibendum turpis. Suspendisse tincidunt leo vehicula convallis convallis. Morbi quis elit commodo ante tempor hendrerit. Nunc at tincidunt velit, at accumsan mi. Nunc blandit nisl aliquet tristique congue. Pellentesque convallis, est eu tristique pellentesque, ipsum augue suscipit sem, non varius tellus justo ac nibh. Cras et mi nunc. Morbi porta lacus facilisis sapien volutpat, eu elementum ante pulvinar. Donec rhoncus mollis lobortis. Fusce mollis pulvinar turpis, vitae elementum eros aliquet non. Fusce venenatis, ante nec bibendum malesuada, ligula odio blandit ipsum, ac sodales odio nulla non nibh.
//    Aenean placerat justo eget nibh ullamcorper molestie. Maecenas efficitur, felis eget scelerisque convallis, orci est pretium ligula, ut fermentum justo massa ac mauris. Cras ex tortor, viverra nec velit eget, mollis dapibus enim. Donec facilisis quis quam et vestibulum. Mauris sodales lobortis neque a porta. Pellentesque diam lacus, pretium vel venenatis eu, aliquam nec libero. Quisque eget iaculis mauris. Nullam augue orci, tincidunt sit amet enim in, laoreet luctus orci. In vulputate neque ut leo hendrerit rhoncus. Nam a dolor dolor. Suspendisse consequat commodo orci eu sollicitudin. Pellentesque tellus nibh, molestie vel justo et, lacinia finibus est. Phasellus dapibus condimentum viverra.
//    Aenean et hendrerit urna, ut aliquam enim. Praesent condimentum convallis lorem vel varius. Vestibulum ante metus, tincidunt vitae neque ac, consectetur sagittis ante. Aliquam pulvinar viverra sapien. In ultricies et turpis id hendrerit. Sed at tincidunt leo. In consequat sollicitudin dui, pulvinar molestie ex sollicitudin id. Donec orci justo, placerat id leo at, ultricies laoreet lorem. Quisque condimentum at metus a mattis. Nullam sollicitudin sem odio, non lobortis quam rutrum eget. Nunc quam orci, pretium at vulputate non, placerat quis libero. Phasellus fringilla purus nec odio auctor fringilla. Aliquam vel diam sed diam pulvinar lobortis eu vitae enim. Cras non luctus sapien, non mattis urna. Duis bibendum ac tellus eu pharetra.
//    Vestibulum tempus suscipit nunc, eu commodo sem volutpat in. Ut maximus convallis sagittis. Nullam dapibus nulla ex, nec condimentum dui mollis quis. Mauris ullamcorper quam a leo luctus fermentum. Nullam efficitur elementum dolor non gravida. Donec consectetur metus vel lorem feugiat, et vestibulum purus aliquet. Mauris sagittis at purus ut bibendum.
//    Ut commodo nulla ut nisi dictum vestibulum. Praesent placerat non leo sed eleifend. Donec diam augue, posuere eu massa ac, euismod commodo est.
//    """
//
//}
//
