//
//  ProductDetailViewControllerSnapshotTests.swift
//  ProductDetailApp
//
//  Created by Emincan Antalyalı on 14.07.2025.
//

import XCTest
import SnapshotTesting
@testable import ProductDetailApp

final class ProductDetailViewControllerSnapshotTests: XCTestCase {
    override func invokeTest() {
        withSnapshotTesting(record: .missing, diffTool: .ksdiff) {
            super.invokeTest()
        }
    }
    
    func testDefaultAppearance_iPhone13() {
        let vm = ProductDetailViewModel(socialRepository: SocialMockRepository(), productRepository: ProductMockRepository())
        let vc = ProductDetailViewController(viewModel: vm)
        vm.localDelegate = vc
        vc.loadViewIfNeeded()
        let exp = expectation(description: "Wait  i have two seconds delay for mock netork call")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            exp.fulfill()
        }
        
        wait(for: [exp], timeout: 5.0)
        assertSnapshot(of: vc, as: .image)
    }
}
