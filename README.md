# README

Проект post - моя зачетная работа по дисциплине "Языки Интрнет Программирования" в МГТУ им. Н. Э. Баумана. Февраль 2022 года.

Это макет социалной сети на Ruby On Rails, использующий основной функционал Instagram.

На 20.02.2022 в нем добавлены следующие возможности:
- Создание постов.
- Создание, удаление, редактирование аккаунтов.
- Возможность менять локализацию с главной страницы.

## Инструкция для установки:
- Загрузить проект из репозитория: 
```bash
git clone git@github.com:Senchatay/post.git
```
- Запустить проект на `localhost:3000`:
```bash
docker-compose build
docker-compose run --rm -p 3000:3000 app
```

## Изображения:
### Авторизация
![image](https://user-images.githubusercontent.com/95499171/230778104-10bca7e0-8a9b-4bd1-8b05-4b9d865b646c.png)
### Лента Изображений
![image](https://user-images.githubusercontent.com/95499171/230778156-06de1909-f622-4652-a893-62a2c5ead768.png)
### Профиль
![image](https://user-images.githubusercontent.com/95499171/230778183-74db92f9-53bd-41d5-80db-5a39aedcfebd.png)
### Список рекомендованных пользователей и селектор языка
![image](https://user-images.githubusercontent.com/95499171/230778302-1218e8cc-514c-448d-91ef-aed786e9afe9.png)


