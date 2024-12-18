﻿#language: ru

Функционал: проверка изменения количества услуги

Как менеджер по закупкам я хочу
создать документ заказ
чтобы поставить товар на учет

Контекст:
Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий

Сценарий: проверка изменения количества услуги

* открытие формы документа
	Когда В командном интерфейсе я выбираю "Продажи" "Заказ"
	Тогда открылось окно "Заказ (создание)"
* заполнение шапки документа
	И из выпадающего списка с именем 'Организация' я выбираю точное значение 'ООО "Все для дома"'
	И из выпадающего списка с именем 'Покупатель' я выбираю точное значение 'Магазин "Обувь"'
	И из выпадающего списка с именем 'Склад' я выбираю точное значение "Большой"
	И из выпадающего списка с именем 'Валюта' я выбираю точное значение "Рубли"
* заполнение табличной части документа
	И в таблице 'Товары' я нажимаю на кнопку с именем 'КомандаПодбор'
	Тогда открылось окно "Подбор товара"
	И в таблице 'СписокТоваров' я перехожу к строке:
		| "Код"       | "Наименование" |
		| "000000036" | "Услуги"       |
	И в таблице 'СписокТоваров' я выбираю текущую строку
	И в таблице 'СписокТоваров' я выбираю текущую строку
	И я нажимаю на кнопку с именем 'ОК'
	Тогда открылось окно "Заказ (создание) *"
* попытка смены количества для услуги
	И в таблице 'Товары' я активизирую поле с именем 'ТоварыКоличество'
	Попытка
		И в таблице 'Товары' в поле с именем 'ТоварыКоличество' я ввожу текст "1"
	Исключение
	И в таблице 'Товары' я завершаю редактирование строки
	Тогда таблица 'Товары' содержит строки:
		| "Товар" 		| "Количество" 	|
		| "Доставка" 	| ""      	|
	