//
//  CitiesPresenter.swift
//  WeatherApp
//
//  Created by Andrey Babkov on 05.04.2021.
//

import Foundation


final class CitiesPresenter {
    weak var view: CitiesViewInput?
    let interactor: CitiesInteractorInput
    let router: CitiesRouterInput
        
    private var cityServiceInfos: [CityServiceInfo] = [
        CityServiceInfo(name: "Moscow", id: "524901"),
        CityServiceInfo(name: "Dubai", id: "292223"),
    ]
    
    private (set) var citiesViewModels: [CityViewModel] = []
    
    init(interactor: CitiesInteractorInput,
         router: CitiesRouterInput) {
        self.interactor = interactor
        self.router = router
    }
    
    private func viewModel(from city: CityResponse) -> CityViewModel {
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = .short
        
        return CityViewModel(title: city.name,
                             temperature: String(Int(round(city.main.temp))),
                             dateUpdate: dateFormatter.string(from: Date()),
                             systemImageName: "pencil")
    }
}


extension CitiesPresenter: CitiesViewOutput {
    func didLoadView() {
        interactor.load(cities: cityServiceInfos)
    }
    
    func didPullRefesh() {
        interactor.load(cities: cityServiceInfos)
    }
    
    func didTapAddButton() {
        interactor.loadCity(with: "Belgorod")
    }
    
    func didSelectItem(at index: Int) {
        let model = citiesViewModels[index]
        router.showCity(model: model)
    }
}


extension CitiesPresenter: CitiesInteractorOutput {
    func didLoad(city: CityResponse) {
        self.citiesViewModels.append(viewModel(from: city))
        self.view?.reloadData()
    }
    
    func didLoad(cities: [CityResponse]) {
        self.citiesViewModels = cities.map { viewModel(from: $0) }
        self.view?.reloadData()
    }
    
    func didReceive(error: Error) {
        // show error
        // view?.show(error: error)
    }
}
