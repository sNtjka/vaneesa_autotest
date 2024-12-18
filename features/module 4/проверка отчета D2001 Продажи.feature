﻿#language: ru

@tree

Функционал: Отображение возвратов в отчете D2001 Продажи

Как Тестировщик я хочу
Протестировать отображение возвратов в отчете D2001 Продажи 
чтобы убедится в корректности отчета D2001 Продажи    

Контекст:
	Дано Я открыл новый сеанс TestClient или подключил уже существующий
	И я закрываю все окна клиентского приложения

Сценарий: Отображение возвратов в отчете D2001 Продажи
* Создание документа Возврат товаров от покупателей
	Дано Я открываю навигационную ссылку "e1cib/list/Document.SalesReturn"
	И я нажимаю на кнопку с именем 'FormCreate'
	И я нажимаю кнопку выбора у поля с именем "Partner"
	И в таблице "List" я перехожу к строке:
		| 'Код' | 'Наименование'            |
		| '1'   | 'Клиент 1 (1 соглашение)' |
	И в таблице "List" я выбираю текущую строку	
	Тогда открылось окно 'Возврат товаров от покупателя (создание) *'
	И в таблице "ItemList" я активизирую поле с именем "ItemListLineNumber"
	И в таблице "ItemList" я нажимаю на кнопку с именем 'ItemListAdd'
	И в таблице "ItemList" я нажимаю кнопку выбора у реквизита с именем "ItemListItem"
	И в таблице "List" я перехожу к строке:
		| 'Код' | 'Наименование'            |
		| '2'   | 'Товар без характеристик' |
	И в таблице "List" я выбираю текущую строку
	И в таблице "ItemList" я нажимаю кнопку выбора у реквизита с именем "ItemListItemKey"
	И в таблице "List" я перехожу к строке:
		| "Код" | "Характеристика"          |
		| "3"   | "Товар без характеристик" |
	И в таблице "List" я выбираю текущую строку
	Тогда открылось окно 'Возврат товаров от покупателя (создание) *'
	И я нажимаю на кнопку с именем 'FormWrite'	
	И я запоминаю значение поля с именем "Number" как "Number"			
	И я нажимаю на кнопку с именем 'FormPostAndClose'
	И я жду закрытия окна 'Возврат товаров от покупателя * от *' в течение 20 секунд
* Настраиваем отчет D2001 Продажи
	И В командном интерфейсе я выбираю 'Отчеты' 'D2001 Продажи'
	И я нажимаю на кнопку с именем 'FormChangeVariant'
	И в таблице "SettingsComposerSettings" я перехожу к строке:
		| 'Использование' | 'Структура отчета'   |
		| 'Нет'           | '<Детальные записи>' |
	И в таблице "SettingsComposerSettings" я изменяю флаг с именем 'SettingsComposerSettingsUse'
	И в таблице "SettingsComposerSettings" я завершаю редактирование строки
	И я нажимаю на кнопку с именем 'FormEndEdit'
	Тогда открылось окно 'D2001 Продажи'
* Формируем отчет и ищем созданный возврат
	И я нажимаю на кнопку с именем 'FormGenerate'
	@screenshot
	Тогда табличный документ "Result" содержит значения:
		| '{"Возврат товаров от покупателя "+ "$Number$"}' |