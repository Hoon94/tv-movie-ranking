//
//  ReviewViewController.swift
//  TVMovie
//
//  Created by Daehoon Lee on 4/7/24.
//

import UIKit
import RxSwift

final class ReviewViewController: UIViewController {
    private let viewModel: ReviewViewModel
    private let disposeBag = DisposeBag()
    
    init(id: Int, contentType: ContentType) {
        self.viewModel = ReviewViewModel(id: id, contentType: contentType)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
    }
    
    private func bindViewModel() {
        let output = viewModel.transform(input: ReviewViewModel.Input())
        output.reviewResult.bind { result in
            switch result {
            case .success(let reviewList):
                print(reviewList)
            case .failure(let error):
                print(error)
            }
        }.disposed(by: disposeBag)
    }
}
