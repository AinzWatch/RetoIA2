
create table user(
	user_id 	int primary key,
	firstname 	varchar(100),
	lastname 	varchar(100),
	password 	varchar(255),
	email		varchar(100)
);

create table addresses(
	addresses_id	int primary key,
	user_id			int not null,
	country			varchar(50),
	state			varchar(50),
	city			varchar(50),
	address1		varchar(100),
	address2		varchar(100),
	FOREIGN KEY (user_id) REFERENCES user(user_id)
);

create table Payment_methods(
	payment_method_id		int	primary key,
	name					varchar(50)
);

create table Orders(
	order_id			int	primary key,
	user_id				int not null,
	timestamp			datetime not null,
	payment_method_id	int not null,
	FOREIGN KEY (user_id) REFERENCES user(user_id),
	FOREIGN KEY (payment_method_id) REFERENCES Payment_methods(payment_method_id)
);

create table Categories(
	category_id			int primary key,
	name				varchar(100) not null
);

create table Products(
	product_id		int	primary key,
	name			varchar(100),
	description		varchar(200),
	price			float		,
	stock			int			,
	category_id		int	not null,
	FOREIGN KEY (category_id) REFERENCES Categories(category_id)
);

create table Product_details(
	order_id		int not null,
	product_id		int	not null,
	count			int	not null,
	FOREIGN KEY (order_id) REFERENCES Orders(order_id),
	FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

-- Datos para la tabla user
INSERT INTO user (user_id, firstname, lastname, password, email) VALUES
(1, 'John', 'Doe', 'password123', 'john.doe@example.com'),
(2, 'Jane', 'Smith', 'password456', 'jane.smith@example.com'),
(3, 'Carlos', 'Perez', 'password789', 'carlos.perez@example.com');

-- Datos para la tabla addresses
INSERT INTO addresses (addresses_id, user_id, country, state, city, address1, address2) VALUES
(1, 1, 'USA', 'California', 'Los Angeles', '123 Main St', 'Apt 101'),
(2, 2, 'Canada', 'Ontario', 'Toronto', '456 Queen St', 'Suite 200'),
(3, 3, 'Mexico', 'CDMX', 'Mexico City', '789 Reforma Ave', NULL);

-- Datos para la tabla Payment_methods
INSERT INTO Payment_methods (payment_method_id, name) VALUES
(1, 'Credit Card'),
(2, 'PayPal'),
(3, 'Bank Transfer');

-- Datos para la tabla Orders
INSERT INTO Orders (order_id, user_id, timestamp, payment_method_id) VALUES
(1, 1, '2024-11-01 10:30:00', 1),
(2, 2, '2024-11-02 14:00:00', 2),
(3, 3, '2024-11-03 16:45:00', 3);

-- Datos para la tabla Categories
INSERT INTO Categories (category_id, name) VALUES
(1, 'Electronics'),
(2, 'Books'),
(3, 'Clothing');

-- Datos para la tabla Products
INSERT INTO Products (product_id, name, description, price, stock, category_id) VALUES
(1, 'Smartphone', 'Latest model smartphone with 5G', 699.99, 50, 1),
(2, 'Novel', 'Best-selling novel', 19.99, 200, 2),
(3, 'T-Shirt', '100% cotton, various sizes available', 9.99, 150, 3);

-- Datos para la tabla Product_details
INSERT INTO Product_details (order_id, product_id, count) VALUES
(1, 1, 2),
(2, 2, 1),
(3, 3, 3);
