-- Create Users Table
CREATE TABLE Users (
    userID INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    dateJoined DATE NOT NULL,
    userType ENUM('Customer', 'Admin') NOT NULL
);

-- Create Categories Table
CREATE TABLE Categories (
    categoryID INT PRIMARY KEY AUTO_INCREMENT,
    categoryName VARCHAR(255) NOT NULL
);

-- Create Products Table
CREATE TABLE Products (
    productID INT PRIMARY KEY AUTO_INCREMENT,
    productName VARCHAR(255) NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    description TEXT,
    stock INT NOT NULL,
    categoryID INT,
    FOREIGN KEY (categoryID) REFERENCES Categories(categoryID)
);

-- Create Orders Table
CREATE TABLE Orders (
    orderID INT PRIMARY KEY AUTO_INCREMENT,
    userID INT,
    orderDate DATE NOT NULL,
    status ENUM('Pending', 'Shipped', 'Delivered') NOT NULL,
    FOREIGN KEY (userID) REFERENCES Users(userID)
);

-- Create OrderDetails Table
CREATE TABLE OrderDetails (
    orderDetailID INT PRIMARY KEY AUTO_INCREMENT,
    orderID INT,
    productID INT,
    quantity INT NOT NULL,
    subtotal DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (orderID) REFERENCES Orders(orderID),
    FOREIGN KEY (productID) REFERENCES Products(productID)
);

-- Create Shipping Table
CREATE TABLE Shipping (
    shippingID INT PRIMARY KEY AUTO_INCREMENT,
    orderID INT UNIQUE,
    address VARCHAR(255) NOT NULL,
    city VARCHAR(255) NOT NULL,
    state VARCHAR(255) NOT NULL,
    zipCode VARCHAR(10) NOT NULL,
    FOREIGN KEY (orderID) REFERENCES Orders(orderID)
);
