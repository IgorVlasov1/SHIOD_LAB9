-- Создание таблицы "Customers"
CREATE TABLE Customers (
    CustomerID SERIAL PRIMARY KEY,
    FirstName VARCHAR(255) NOT NULL,
    LastName VARCHAR(255) NOT NULL,
    Email VARCHAR(255) NOT NULL
);

-- Создание таблицы "Orders"
CREATE TABLE Orders (
    OrderID SERIAL PRIMARY KEY,
    CustomerID INT NOT NULL,
    OrderDate TIMESTAMP NOT NULL,
    TotalAmount DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- Создание таблицы "OrderDetails"
CREATE TABLE OrderDetails (
    OrderDetailID SERIAL PRIMARY KEY,
    OrderID INT NOT NULL,
    ProductID INT NOT NULL,
    Quantity INT NOT NULL,
    UnitPrice DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

INSERT INTO Customers (FirstName, LastName, Email) VALUES
('Ivan', 'Ivanov', 'ivan.ivanov@example.com'),
('Petr', 'Petrov', 'petr.petrov@example.com'),
('Sofia', 'Sokolova', 'sofia.sokolova@example.com'),
('Dmitry', 'Smirnov', 'dmitry.smirnov@example.com'),
('Olga', 'Orlova', 'olga.orlova@example.com'),
('Anna', 'Anisimova', 'anna.anisimova@example.com'),
('Nikolay', 'Nikolaev', 'nikolay.nikolaev@example.com'),
('Maria', 'Morozova', 'maria.morozova@example.com'),
('Yulia', 'Yakovleva', 'yulia.yakovleva@example.com'),
('Sergey', 'Sergeev', 'sergey.sergeev@example.com'),
('Elena', 'Egorova', 'elena.egorova@example.com'),
('Alexey', 'Alekseev', 'alexey.alekseev@example.com'),
('Ekaterina', 'Ershova', 'ekaterina.ershova@example.com'),
('Andrey', 'Antonov', 'andrey.antonov@example.com'),
('Viktoria', 'Volkova', 'viktoria.volkova@example.com'),
('Oleg', 'Ozerov', 'oleg.ozerov@example.com'),
('Irina', 'Ivanova', 'irina.ivanova@example.com'),
('Mikhail', 'Mikhailov', 'mikhail.mikhailov@example.com'),
('Svetlana', 'Svetlova', 'svetlana.svetlova@example.com'),
('Igor', 'Ignatiev', 'igor.ignatiev@example.com');

INSERT INTO Orders (CustomerID, OrderDate, TotalAmount) VALUES
(1, '2024-12-01 10:00:00', 100.00),
(2, '2024-12-02 11:00:00', 150.00),
(3, '2024-12-03 12:00:00', 200.00),
(4, '2024-12-04 13:00:00', 250.00),
(5, '2024-12-05 14:00:00', 300.00),
(6, '2024-12-06 15:00:00', 350.00),
(7, '2024-12-07 16:00:00', 400.00),
(8, '2024-12-08 17:00:00', 450.00),
(9, '2024-12-09 18:00:00', 500.00),
(10, '2024-12-10 19:00:00', 550.00),
(11, '2024-12-11 20:00:00', 600.00),
(12, '2024-12-12 21:00:00', 650.00),
(13, '2024-12-13 22:00:00', 700.00),
(14, '2024-12-14 23:00:00', 750.00),
(15, '2024-12-15 08:00:00', 800.00),
(16, '2024-12-16 09:00:00', 850.00),
(17, '2024-12-17 10:30:00', 900.00),
(18, '2024-12-18 11:30:00', 950.00),
(19, '2024-12-19 12:30:00', 1000.00),
(20, '2024-12-20 13:30:00', 1050.00);

INSERT INTO OrderDetails (OrderID, ProductID, Quantity, UnitPrice) VALUES
(1, 101, 2, 50.00),
(2, 102, 3, 50.00),
(3, 103, 4, 50.00),
(4, 104, 5, 50.00),
(5, 105, 6, 50.00),
(6, 106, 7, 50.00),
(7, 107, 8, 50.00),
(8, 108, 9, 50.00),
(9, 109, 10, 50.00),
(10, 110, 11, 50.00),
(11, 111, 12, 50.00),
(12, 112, 13, 50.00),
(13, 113, 14, 50.00),
(14, 114, 15, 50.00),
(15, 115, 16, 50.00),
(16, 116, 17, 50.00),
(17, 117, 18, 50.00),
(18, 118, 19, 50.00),
(19, 119, 20, 50.00),
(20, 120, 21, 50.00);




-- 7. Сформировать SQL-запрос для списка клиентов и суммарной стоимости заказов
-- Запрос возвращает список клиентов (имя и фамилия) и суммарную стоимость заказов каждого клиента.
-- SELECT: выбирает столбцы FirstName, LastName и вычисляет суммарную стоимость заказов (SUM).
-- FROM: указывает таблицу Customers (с псевдонимом c).
-- JOIN: объединяет таблицу Orders (с псевдонимом o) с Customers по полю CustomerID.
-- GROUP BY: группирует результаты по имени и фамилии клиентов.
SELECT
    c.FirstName,
    c.LastName,
    SUM(o.TotalAmount) AS TotalOrderAmount
FROM
    Customers c
JOIN
    Orders o ON c.CustomerID = o.CustomerID
GROUP BY
    c.FirstName, c.LastName;

-- 8. Отсортировать список по убыванию суммарной стоимости заказов клиента
-- Запрос аналогичен предыдущему, но добавляет сортировку по суммарной стоимости заказов в порядке убывания.
-- ORDER BY: указывает сортировку по TotalOrderAmount в порядке убывания (DESC).
SELECT
    c.FirstName,
    c.LastName,
    SUM(o.TotalAmount) AS TotalOrderAmount
FROM
    Customers c
JOIN
    Orders o ON c.CustomerID = o.CustomerID
GROUP BY
    c.FirstName, c.LastName
ORDER BY
    TotalOrderAmount DESC;

-- 9. Добавить столбец со средней суммарной стоимостью заказов
-- Запрос аналогичен предыдущему, но добавляет столбец AverageOrderAmount с общей средней стоимостью заказов.
-- AVG(SUM(o.TotalAmount)) OVER (): вычисляет среднее значение по суммарной стоимости заказов.
SELECT
    c.FirstName,
    c.LastName,
    SUM(o.TotalAmount) AS TotalOrderAmount,
    AVG(SUM(o.TotalAmount)) OVER () AS AverageOrderAmount
FROM
    Customers c
JOIN
    Orders o ON c.CustomerID = o.CustomerID
GROUP BY
    c.FirstName, c.LastName
ORDER BY
    TotalOrderAmount DESC;

-- 10. Вывести клиента с наибольшей суммарной стоимостью заказов
-- Запрос возвращает одного клиента с наибольшей суммарной стоимостью заказов.
-- LIMIT 1: ограничивает результат одним клиентом с наибольшей суммарной стоимостью заказов.
SELECT
    c.FirstName,
    c.LastName,
    SUM(o.TotalAmount) AS TotalOrderAmount
FROM
    Customers c
JOIN
    Orders o ON c.CustomerID = o.CustomerID
GROUP BY
    c.FirstName, c.LastName
ORDER BY
    TotalOrderAmount DESC
LIMIT 1;

-- 11. Вывести список заказов клиента с наибольшей суммарной стоимостью заказов
-- Запрос возвращает список заказов клиента с наибольшей суммарной стоимостью заказов.
-- - WITH: временная таблица TopCustomer, содержащая клиента с наибольшей суммарной стоимостью заказов.
-- SELECT, FROM, JOIN, GROUP BY, ORDER BY, LIMIT: используются для создания TopCustomer.
-- Основной SELECT: выбирает OrderID и TotalAmount из Orders, связывая их с TopCustomer по CustomerID.
-- ORDER BY: сортирует заказы по стоимости в порядке возрастания.
WITH TopCustomer AS (
    SELECT
        c.CustomerID,
        c.FirstName,
        c.LastName,
        SUM(o.TotalAmount) AS TotalOrderAmount
    FROM
        Customers c
    JOIN
        Orders o ON c.CustomerID = o.CustomerID
    GROUP BY
        c.CustomerID, c.FirstName, c.LastName
    ORDER BY
        TotalOrderAmount DESC
    LIMIT 1
)
SELECT
    o.OrderID,
    o.TotalAmount
FROM
    Orders o
JOIN
    TopCustomer tc ON o.CustomerID = tc.CustomerID
ORDER BY
    o.TotalAmount ASC;

-- 12. Вывести клиентов, у которых суммарная стоимость заказов превышает среднюю суммарную стоимость заказов клиентов
-- Запрос возвращает клиентов, чья суммарная стоимость заказов превышает среднюю.
-- WITH: временные таблицы CustomerTotals и AverageTotal.
-- CustomerTotals: суммирует стоимость заказов по каждому клиенту.
-- AverageTotal: вычисляет среднюю суммарную стоимость заказов по всем клиентам.
-- Основной SELECT: выбирает клиентов, чья суммарная стоимость заказов превышает среднюю.
WITH CustomerTotals AS (
    SELECT
        c.FirstName,
        c.LastName,
        SUM(o.TotalAmount) AS TotalOrderAmount
    FROM
        Customers c
    JOIN
        Orders o ON c.CustomerID = o.CustomerID
    GROUP BY
        c.FirstName, c.LastName
),
AverageTotal AS (
    SELECT
        AVG(TotalOrderAmount) AS AverageOrderAmount
    FROM
        CustomerTotals
)
SELECT
    ct.FirstName,
    ct.LastName,
    ct.TotalOrderAmount,
    at.AverageOrderAmount
FROM
    CustomerTotals ct,
    AverageTotal at
WHERE
    ct.TotalOrderAmount > at.AverageOrderAmount;
