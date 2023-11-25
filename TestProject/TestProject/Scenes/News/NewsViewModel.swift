//
//  NewsViewModel.swift
//  TestProject
//
//  Created by Nana Jimsheleishvili on 23.11.23.
//

import Foundation

protocol NewsViewModelDelegate {
    func newsFetched(_ news: [News])
    func showError(_ error: Error)
}

protocol NewsViewModel {
    var delegate: NewsViewModelDelegate? { get set }
    func viewDidLoad()
}

final class DefaultNewsViewModel: NewsViewModel {
    
    // MARK: - Properties
    private let newsAPI =
    //ლინკში შევცვალე თარიღი
    "https://newsapi.org/v2/everything?q=tesla&from=2023-11-24&sortBy=publishedAt&apiKey=ce67ca95a69542b484f81bebf9ad36d5"
    
    private var newsList = [News]()

    var delegate: NewsViewModelDelegate?

    // MARK: - Public Methods
    func viewDidLoad() {
        //fetchNews()
    }
    
    // MARK: - Private Methods
    private func fetchNews() {
        NetworkManager.shared.get(url: newsAPI) { [weak self] (result: Result<Article, Error>) in
            //აქ ჩავამატე guard self და სელფთან კითხვისნიშნები აღარაა საჭირო
            guard let self else {return}
            switch result {
            case .success(let article):
                self.delegate?.newsFetched(self.newsList)
                self.newsList.append(article.articles)
            case .failure(let error):
                self.delegate?.showError(error)
            }
        }
    }
}

