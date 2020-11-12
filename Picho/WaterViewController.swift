//
//  WaterViewController.swift
//  Picho
//
//  Created by Windy on 12/11/20.
//

import UIKit

class WaterViewController: UIViewController {
    
    let detail = """
    Dehydration cause the buildup of ‘bad’ LDL (low-density lipoprotein) cholesterol in our blood stream and also damage cell walls of arteries.

    Drinking enough water makes it easier for your blood to move in your body. And this will help our body to clear the ‘bad’ cholesterol more quickly!
    """
    
    private var detailLabel: UILabel!
    private var waterLabel: UILabel!
    private var waterAmount: UILabel!
    private var waterProgress: HorizontalProgressView!
    private var infoLabel: UILabel!
    private var waterCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupLayout()
    }
    
    private func setupView() {
        navigationItem.title = "Water"
        view.backgroundColor = Color.background
        
        detailLabel = UILabel()
        detailLabel.text = detail
        detailLabel.numberOfLines = 0
        view.addSubview(detailLabel)
        
        waterLabel = UILabel()
        waterLabel.setFont(text: "Water Intake", weight: .bold)
        view.addSubview(waterLabel)
        
        waterAmount = UILabel()
        waterAmount.setFont(text: "322 ml", size: 34, weight: .bold)
        view.addSubview(waterAmount)
        
        waterProgress = HorizontalProgressView()
        waterProgress.progress = 0.5
        view.addSubview(waterProgress)
        
        infoLabel = UILabel()
        infoLabel.setFont(text: "Need more water", size: 17, weight: .bold, color: Color.red)
        view.addSubview(infoLabel)
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: 43, height: 60)
        
        waterCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        waterCollectionView.backgroundColor = Color.background
        waterCollectionView.register(WaterCell.self, forCellWithReuseIdentifier: WaterCell.reuseIdentifier)
        waterCollectionView.delegate = self
        waterCollectionView.dataSource = self
        view.addSubview(waterCollectionView)
    }
    
    private func setupLayout() {
        detailLabel.setConstraint(
            topAnchor: view.safeAreaLayoutGuide.topAnchor, topAnchorConstant: 16,
            leadingAnchor: view.layoutMarginsGuide.leadingAnchor,
            trailingAnchor: view.layoutMarginsGuide.trailingAnchor)
        
        waterLabel.setConstraint(
            topAnchor: detailLabel.bottomAnchor, topAnchorConstant: 32,
            leadingAnchor: view.layoutMarginsGuide.leadingAnchor)
        
        waterAmount.setConstraint(
            topAnchor: waterLabel.bottomAnchor, topAnchorConstant: 16,
            leadingAnchor: view.layoutMarginsGuide.leadingAnchor)
        
        waterProgress.setConstraint(
            topAnchor: waterAmount.bottomAnchor, topAnchorConstant: 16,
            leadingAnchor: view.layoutMarginsGuide.leadingAnchor,
            trailingAnchor: view.layoutMarginsGuide.trailingAnchor,
            heighAnchorConstant: 10)
        
        infoLabel.setConstraint(
            topAnchor: waterProgress.bottomAnchor, topAnchorConstant: 8,
            trailingAnchor: view.layoutMarginsGuide.trailingAnchor)
        
        waterCollectionView.setConstraint(
            topAnchor: infoLabel.bottomAnchor, topAnchorConstant: 32,
            bottomAnchor: view.safeAreaLayoutGuide.bottomAnchor, bottomAnchorConstant: -32,
            leadingAnchor: view.layoutMarginsGuide.leadingAnchor,
            trailingAnchor: view.layoutMarginsGuide.trailingAnchor)
    }
    
}

extension WaterViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 14
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: WaterCell.reuseIdentifier, for: indexPath) as! WaterCell
        cell.image = UIImage(named: "glass_empty")
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? WaterCell {
            if cell.image == UIImage(named: "glass_fill") {
                cell.image = UIImage(named: "glass_empty")
            } else {
                cell.image = UIImage(named: "glass_fill")
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            if let cell = collectionView.cellForItem(at: indexPath) as? WaterCell {
                cell.image = UIImage(named: "glass_empty")
            }
        }
    }
    
}

class WaterCell: UICollectionViewCell {
    
    static let reuseIdentifier = "WaterCell"
    
    var image: UIImage? {
        didSet { imageView.image = image }
    }
    
    private let imageView: UIImageView
    
    override init(frame: CGRect) {
        
        imageView = UIImageView()
        
        super.init(frame: frame)
        
        imageView.contentMode = .scaleAspectFit
        addSubview(imageView)
        imageView.setConstraint(
            topAnchor: topAnchor,
            bottomAnchor: bottomAnchor,
            leadingAnchor: leadingAnchor,
            trailingAnchor: trailingAnchor)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
