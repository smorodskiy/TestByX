//
//  LocalStorage.swift
//  TemplateProject
//


// протокол хранения данных
protocol LocalStorage {
    var isFirstStart: Bool { get set }
    var token: String? { get set }
}
