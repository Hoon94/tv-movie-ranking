//
//  ReviewViewController.swift
//  TVMovie
//
//  Created by Daehoon Lee on 4/7/24.
//

import UIKit
import RxSwift

fileprivate enum Section {
    case list
}

fileprivate enum Item: Hashable {
    case header(ReviewHeader)
    case content(String)
}

fileprivate struct ReviewHeader: Hashable {
    let id: String
    let name: String
    let url: String
}

final class ReviewViewController: UIViewController {
    private let viewModel: ReviewViewModel
    private let disposeBag = DisposeBag()
    private var dataSource: UICollectionViewDiffableDataSource<Section, Item>?
    
    private let collectionView: UICollectionView = {
        let config = UICollectionLayoutListConfiguration(appearance: .plain)
        let layout = UICollectionViewCompositionalLayout.list(using: config)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(ReviewHeaderCollectionViewCell.self, forCellWithReuseIdentifier: ReviewHeaderCollectionViewCell.id)
        
        return collectionView
    }()
    
    init(id: Int, contentType: ContentType) {
        self.viewModel = ReviewViewModel(id: id, contentType: contentType)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        bindViewModel()
    }
    
    private func setUI() {
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        setDataSource()
    }
    
    private func setDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Section, Item>(collectionView: collectionView, cellProvider: { collectionView, indexPath, itemIdentifier in
            switch itemIdentifier {
            case .header(let header):
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ReviewHeaderCollectionViewCell.id, for: indexPath) as? ReviewHeaderCollectionViewCell else {
                    return UICollectionViewCell()
                }
                
                cell.configure(title: header.name, url: header.url)
                
                return cell
            case .content(let content):
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ReviewHeaderCollectionViewCell.id, for: indexPath) as? ReviewHeaderCollectionViewCell else {
                    return UICollectionViewCell()
                }
                                
                return cell
            }
        })
        
        var dataSourceSnapshot = NSDiffableDataSourceSnapshot<Section, Item>()
        dataSourceSnapshot.appendSections([.list])
        dataSource?.apply(dataSourceSnapshot)
    }
    
    private func bindViewModel() {
        let output = viewModel.transform(input: ReviewViewModel.Input())
        output.reviewResult.map { result -> [ReviewModel] in
            switch result {
            case .success(let reviewList):
                return reviewList
            case .failure(let error):
                print(error)
                return []
            }
        }.bind { [weak self] reviewList in
            guard !reviewList.isEmpty else { return }
            var sectionSnapshot = NSDiffableDataSourceSectionSnapshot<Item>()
            reviewList.forEach { review in
                let header = ReviewHeader(id: review.id, 
                                          name: review.author.name.isEmpty ? review.author.username : review.author.name,
                                          url: review.author.imageURL)
                let headerItem = Item.header(header)
                sectionSnapshot.append([headerItem])
            }
            
            self?.dataSource?.apply(sectionSnapshot, to: .list)
        }.disposed(by: disposeBag)
    }
}
