﻿#language: ru

@tree
@Закупки

Функционал: Отчет остатки

Как тестировщик я хочу
проверить правильный вывод отчета остатки 
чтобы убедиться что отчет выводит верные данные   

Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий
	И я закрываю все окна клиентского приложения
		
Сценарий: проверка отчета Остатки
*Формирование отчета
	И В командном интерфейсе я выбираю "Товарные запасы" "Остатки товаров"
	Тогда открылось окно "Остатки товаров"
	И я нажимаю на кнопку с именем 'ФормаЗагрузитьВариант'
	Тогда открылось окно "Выбор варианта отчета"
	И в таблице 'СписокНастроек' я выбираю текущую строку
	Тогда открылось окно "Остатки товаров"
	И я нажимаю на кнопку с именем 'ФормаСформировать'
*Проверка макета
	Дано Табличный документ "Результат" равен макету "ОтчетОстаткиМакет"