# MovieApp

Приложение показывающая актуальные фильмы.

Приложение показывает все фильмы которые доступны сейчас. Первое окно регистрация - реализовано через Firebase. У фильмов есть описание также можно просмотреть трейлер фильмы и сохранить в избранные. 


Модели данных:

1. Модель фильма:
        artistName: String
        releaseDate: Date
        name: String
        copyright: String?
        image: URL
        genres: [Genre]
    
2. Модель жанра:
        name: String
    
3.  Модель юзера:
        userId: Int,
        userName: String,
        login: String,
        password: String,
        isActive: Bool
        
        
Архитектурой будет  MVVM. Построю свой фреймуорк для работой с API

