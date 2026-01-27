-- Блок 3: SQL
  -- Задание 1: Абитуриенты

SELECT id, RANK() OVER (ORDER BY scores DESC) AS position
FROM examination
ORDER BY scores DESC;
--Функция для ранжирования позиции в рейтинге может быть другой в зависимости от того, как рейтинг составляется.

  -- Задание 2: FULL JOIN

--Ответ: Минимально 30 и максимально 600.

  -- Задание 3: Покупки

SELECT client_id FROM account
INNER JOIN transaction
ON account.id = transaction.account_id
WHERE transaction_date BETWEEN DATE_SUB(CURDATE(), INTERVAL 1 MONTH) AND CURDATE() 
  AND type = 'pur'
GROUP BY client_id
HAVING SUM(amount) < 5000;
/* Есть несколько допущений: 
"за последний месяц" я трактовал как "текущее значение дня месяца минус календарный месяц", 
однако могли иметь место другие трактовки ("за текущий месяц", "за последние 30/31 день" и тд);
функция получения текущей даты зависит от конкретной бд, я использовал MySQL; 
в условиях указано, что в таблице транзакций есть поле "тип", что может указывать на то, 
что не все транзакции являются покупками, однако не уточняется, какие типы существуют, 
поэтому я ввел условие type = 'pur' (от "purchase").
*/
