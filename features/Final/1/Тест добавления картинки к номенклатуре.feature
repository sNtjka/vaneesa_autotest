﻿#language: ru

@tree
@Закупки

Функционал: справочник номенклатура

Как Тестировщик я хочу
проверить прикрепление картинки к справочнику номенклатура 
чтобы убедиться что функционал работает 

Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий
	И я закрываю все окна клиентского приложения

Сценарий: Проверка прикрепления картинки к справочнику номенклатура
*Открытие формы
	И Я открываю навигационную ссылку "e1cib/data/Справочник.Товары?ref=a9b200055d49b45e11db9744d21cfa19"
*Добавление файла картинки
	И я нажимаю кнопку выбора у поля с именем 'ФайлКартинки'
	Тогда открылось окно "Файлы"
	И я нажимаю на кнопку с именем 'ФормаСоздать'
	Тогда открылось окно "Файл (создание)"
	И я выбираю файл "$КаталогПроекта$\Final\1\itempicture1.png"
	И я нажимаю на кнопку с именем 'ВыбратьФайлСДискаИЗаписать'
	И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
	И я жду закрытия окна "itempicture1.png (Файл)" в течение 20 секунд
	И в таблице 'Список' я выбираю текущую строку
	И представление элемента с именем 'ФайлКартинки' стало равно 'itempicture1.png'
	И я нажимаю на кнопку с именем 'ФормаЗаписать'
*Проверка добавления картинки
	И элемент формы с именем 'ФайлКартинки' стал равен 'itempicture1.png'
	И элемент формы с именем 'Картинка' стал равен шаблону 'e1cib/data/Справочник.ХранимыеФайлы.ДанныеФайла?ref=*'