-- nlakekitten_SampleDB.dbo.categories definition

-- Drop table

-- DROP TABLE nlakekitten_SampleDB.dbo.categories;

CREATE TABLE nlakekitten_SampleDB.dbo.categories (
	CategoryID int IDENTITY(1,1) NOT NULL,
	CategoryName varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	Description varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	CONSTRAINT PK__categori__19093A2BA0B10751 PRIMARY KEY (CategoryID)
);


-- nlakekitten_SampleDB.dbo.customers definition

-- Drop table

-- DROP TABLE nlakekitten_SampleDB.dbo.customers;

CREATE TABLE nlakekitten_SampleDB.dbo.customers (
	CustomerID int NOT NULL,
	CustomerName varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	ContactName varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	Address varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	City varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	PostalCode varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	Country varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL
);


-- nlakekitten_SampleDB.dbo.employees definition

-- Drop table

-- DROP TABLE nlakekitten_SampleDB.dbo.employees;

CREATE TABLE nlakekitten_SampleDB.dbo.employees (
	EmployeeID int NOT NULL,
	LastName varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	FirstName varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	BirthDate date DEFAULT NULL NULL,
	Photo varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	Notes text COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CONSTRAINT PK__employee__7AD04FF101CB1DA8 PRIMARY KEY (EmployeeID)
);


-- nlakekitten_SampleDB.dbo.shippers definition

-- Drop table

-- DROP TABLE nlakekitten_SampleDB.dbo.shippers;

CREATE TABLE nlakekitten_SampleDB.dbo.shippers (
	ShipperID int NOT NULL,
	ShipperName varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	Phone varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	CONSTRAINT PK__shippers__1F8AFFB96A446B7A PRIMARY KEY (ShipperID)
);


-- nlakekitten_SampleDB.dbo.suppliers definition

-- Drop table

-- DROP TABLE nlakekitten_SampleDB.dbo.suppliers;

CREATE TABLE nlakekitten_SampleDB.dbo.suppliers (
	SupplierID int NOT NULL,
	SupplierName varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	ContactName varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	Address varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	City varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	PostalCode varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	Country varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	Phone varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	CONSTRAINT PK__supplier__4BE666944D0CA9B5 PRIMARY KEY (SupplierID)
);


-- nlakekitten_SampleDB.dbo.orders definition

-- Drop table

-- DROP TABLE nlakekitten_SampleDB.dbo.orders;

CREATE TABLE nlakekitten_SampleDB.dbo.orders (
	OrderID int NOT NULL,
	CustomerID int DEFAULT NULL NULL,
	EmployeeID int DEFAULT NULL NULL,
	OrderDate date DEFAULT NULL NULL,
	ShipperID int DEFAULT NULL NULL,
	CONSTRAINT PK__orders__C3905BAFB0DC5065 PRIMARY KEY (OrderID),
	CONSTRAINT FK__orders__Employee__31B762FC FOREIGN KEY (EmployeeID) REFERENCES nlakekitten_SampleDB.dbo.employees(EmployeeID),
	CONSTRAINT FK__orders__Employee__3864608B FOREIGN KEY (EmployeeID) REFERENCES nlakekitten_SampleDB.dbo.employees(EmployeeID),
	CONSTRAINT FK__orders__ShipperI__32AB8735 FOREIGN KEY (ShipperID) REFERENCES nlakekitten_SampleDB.dbo.shippers(ShipperID),
	CONSTRAINT FK__orders__ShipperI__395884C4 FOREIGN KEY (ShipperID) REFERENCES nlakekitten_SampleDB.dbo.shippers(ShipperID)
);


-- nlakekitten_SampleDB.dbo.products definition

-- Drop table

-- DROP TABLE nlakekitten_SampleDB.dbo.products;

CREATE TABLE nlakekitten_SampleDB.dbo.products (
	ProductID int NOT NULL,
	ProductName varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	SupplierID int DEFAULT NULL NULL,
	CategoryID int DEFAULT NULL NULL,
	Unit varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL NULL,
	Price decimal(18,0) NOT NULL,
	CONSTRAINT PK__products__B40CC6ED94CD467C PRIMARY KEY (ProductID),
	CONSTRAINT FK__products__Catego__3C34F16F FOREIGN KEY (CategoryID) REFERENCES nlakekitten_SampleDB.dbo.categories(CategoryID),
	CONSTRAINT FK__products__Suppli__3D2915A8 FOREIGN KEY (SupplierID) REFERENCES nlakekitten_SampleDB.dbo.suppliers(SupplierID)
);


-- nlakekitten_SampleDB.dbo.order_details definition

-- Drop table

-- DROP TABLE nlakekitten_SampleDB.dbo.order_details;

CREATE TABLE nlakekitten_SampleDB.dbo.order_details (
	OrderDetailID int NOT NULL,
	OrderID int DEFAULT NULL NULL,
	ProductID int DEFAULT NULL NULL,
	Quantity int DEFAULT NULL NULL,
	CONSTRAINT FK__order_det__Order__339FAB6E FOREIGN KEY (OrderID) REFERENCES nlakekitten_SampleDB.dbo.orders(OrderID),
	CONSTRAINT FK__order_det__Order__3A4CA8FD FOREIGN KEY (OrderID) REFERENCES nlakekitten_SampleDB.dbo.orders(OrderID),
	CONSTRAINT FK__order_det__Produ__3493CFA7 FOREIGN KEY (ProductID) REFERENCES nlakekitten_SampleDB.dbo.products(ProductID),
	CONSTRAINT FK__order_det__Produ__3B40CD36 FOREIGN KEY (ProductID) REFERENCES nlakekitten_SampleDB.dbo.products(ProductID)
);

INSERT INTO nlakekitten_SampleDB.dbo.categories (CategoryName,Description) VALUES
	 (N'Beverages',N'Soft drinks, coffees, teas, beers, and ales'),
	 (N'Condiments',N'Sweet and savory sauces, relishes, spreads, and seasonings'),
	 (N'Confections',N'Desserts, candies, and sweet breads'),
	 (N'Dairy Products',N'Cheeses'),
	 (N'Grains/Cereals',N'Breads, crackers, pasta, and cereal'),
	 (N'Meat/Poultry',N'Prepared meats'),
	 (N'Produce',N'Dried fruit and bean curd'),
	 (N'Seafood',N'Seaweed and fish');
INSERT INTO nlakekitten_SampleDB.dbo.customers (CustomerID,CustomerName,ContactName,Address,City,PostalCode,Country) VALUES
	 (1,N'Alfreds Futterkiste',N'Maria Anders',N'Obere Str. 57',N'Berlin',N'12209',N'Germany'),
	 (2,N'Ana Trujillo Emparedados y helados',N'Ana Trujillo',N'Avda. de la Constitución 2222',N'México D.F.',N'05021',N'Mexico'),
	 (3,N'Antonio Moreno Taquería',N'Antonio Moreno',N'Mataderos 2312',N'México D.F.',N'05023',N'Mexico'),
	 (4,N'Around the Horn',N'Thomas Hardy',N'120 Hanover Sq.',N'London',N'WA1 1DP',N'UK'),
	 (5,N'Berglunds snabbköp',N'Christina Berglund',N'Berguvsvägen 8',N'Luleå',N'S-958 22',N'Sweden'),
	 (6,N'Blauer See Delikatessen',N'Hanna Moos',N'Forsterstr. 57',N'Mannheim',N'68306',N'Germany'),
	 (7,N'Blondel père et fils',N'Frédérique Citeaux',N'24, place Kléber',N'Strasbourg',N'67000',N'France'),
	 (8,N'Bólido Comidas preparadas',N'Martín Sommer',N'C/ Araquil, 67',N'Madrid',N'28023',N'Spain'),
	 (9,N'Bon app ',N'Laurence Lebihans',N'12, rue des Bouchers',N'Marseille',N'13008',N'France'),
	 (10,N'Bottom-Dollar Marketse',N'Elizabeth Lincoln',N'23 Tsawassen Blvd.',N'Tsawassen',N'T2F 8M4',N'Canada');
INSERT INTO nlakekitten_SampleDB.dbo.customers (CustomerID,CustomerName,ContactName,Address,City,PostalCode,Country) VALUES
	 (11,N'B s Beverages',N'Victoria Ashworth',N'Fauntleroy Circus',N'London',N'EC2 5NT',N'UK'),
	 (12,N'Cactus Comidas para llevar',N'Patricio Simpson',N'Cerrito 333',N'Buenos Aires',N'1010',N'Argentina'),
	 (13,N'Centro comercial Moctezuma',N'Francisco Chang',N'Sierras de Granada 9993',N'México D.F.',N'05022',N'Mexico'),
	 (14,N'Chop-suey Chinese',N'Yang Wang',N'Hauptstr. 29',N'Bern',N'3012',N'Switzerland'),
	 (15,N'Comércio Mineiro',N'Pedro Afonso',N'Av. dos Lusíadas, 23',N'São Paulo',N'05432-043',N'Brazil'),
	 (16,N'Consolidated Holdings',N'Elizabeth Brown',N'Berkeley Gardens 12 Brewery',N'London',N'WX1 6LT',N'UK'),
	 (17,N'Drachenblut Delikatessend',N'Sven Ottlieb',N'Walserweg 21',N'Aachen',N'52066',N'Germany'),
	 (18,N'Du monde entier',N'Janine Labrune',N'67, rue des Cinquante Otages',N'Nantes',N'44000',N'France'),
	 (19,N'Eastern Connection',N'Ann Devon',N'35 King George',N'London',N'WX3 6FW',N'UK'),
	 (20,N'Ernst Handel',N'Roland Mendel',N'Kirchgasse 6',N'Graz',N'8010',N'Austria');
INSERT INTO nlakekitten_SampleDB.dbo.customers (CustomerID,CustomerName,ContactName,Address,City,PostalCode,Country) VALUES
	 (21,N'Familia Arquibaldo',N'Aria Cruz',N'Rua Orós, 92',N'São Paulo',N'05442-030',N'Brazil'),
	 (22,N'FISSA Fabrica Inter. Salchichas S.A.',N'Diego Roel',N'C/ Moralzarzal, 86',N'Madrid',N'28034',N'Spain'),
	 (23,N'Folies gourmandes',N'Martine Rancé',N'184, chaussée de Tournai',N'Lille',N'59000',N'France'),
	 (24,N'Folk och fä HB',N'Maria Larsson',N'Åkergatan 24',N'Bräcke',N'S-844 67',N'Sweden'),
	 (25,N'Frankenversand',N'Peter Franken',N'Berliner Platz 43',N'München',N'80805',N'Germany'),
	 (26,N'France restauration',N'Carine Schmitt',N'54, rue Royale',N'Nantes',N'44000',N'France'),
	 (27,N'Franchi S.p.A.',N'Paolo Accorti',N'Via Monte Bianco 34',N'Torino',N'10100',N'Italy'),
	 (28,N'Furia Bacalhau e Frutos do Mar',N'Lino Rodriguez',N'Jardim das rosas n. 32',N'Lisboa',N'1675',N'Portugal'),
	 (29,N'Galería del gastrónomo',N'Eduardo Saavedra',N'Rambla de Cataluña, 23',N'Barcelona',N'08022',N'Spain'),
	 (30,N'Godos Cocina Típica',N'José Pedro Freyre',N'C/ Romero, 33',N'Sevilla',N'41101',N'Spain');
INSERT INTO nlakekitten_SampleDB.dbo.customers (CustomerID,CustomerName,ContactName,Address,City,PostalCode,Country) VALUES
	 (31,N'Gourmet Lanchonetes',N'André Fonseca',N'Av. Brasil, 442',N'Campinas',N'04876-786',N'Brazil'),
	 (32,N'Great Lakes Food Market',N'Howard Snyder',N'2732 Baker Blvd.',N'Eugene',N'97403',N'USA'),
	 (33,N'GROSELLA-Restaurante',N'Manuel Pereira',N'5ª Ave. Los Palos Grandes',N'Caracas',N'1081',N'Venezuela'),
	 (34,N'Hanari Carnes',N'Mario Pontes',N'Rua do Paço, 67',N'Rio de Janeiro',N'05454-876',N'Brazil'),
	 (35,N'HILARIÓN-Abastos',N'Carlos Hernández',N'Carrera 22 con Ave. Carlos Soublette #8-35',N'San Cristóbal',N'5022',N'Venezuela'),
	 (36,N'Hungry Coyote Import Store',N'Yoshi Latimer',N'City Center Plaza 516 Main St.',N'Elgin',N'97827',N'USA'),
	 (37,N'Hungry Owl All-Night Grocers',N'Patricia McKenna',N'8 Johnstown Road',N'Cork',N'',N'Ireland'),
	 (38,N'Island Trading',N'Helen Bennett',N'Garden House Crowther Way',N'Cowes',N'PO31 7PJ',N'UK'),
	 (39,N'Königlich Essen',N'Philip Cramer',N'Maubelstr. 90',N'Brandenburg',N'14776',N'Germany'),
	 (40,N'La corne d abondance',N'Daniel Tonini',N'67, avenue de l Europe',N'Versailles',N'78000',N'France');
INSERT INTO nlakekitten_SampleDB.dbo.customers (CustomerID,CustomerName,ContactName,Address,City,PostalCode,Country) VALUES
	 (41,N'La maison d Asie',N'Annette Roulet',N'1 rue Alsace-Lorraine',N'Toulouse',N'31000',N'France'),
	 (42,N'Laughing Bacchus Wine Cellars',N'Yoshi Tannamuri',N'1900 Oak St.',N'Vancouver',N'V3F 2K1',N'Canada'),
	 (43,N'Lazy K Kountry Store',N'John Steel',N'12 Orchestra Terrace',N'Walla Walla',N'99362',N'USA'),
	 (44,N'Lehmanns Marktstand',N'Renate Messner',N'Magazinweg 7',N'Frankfurt a.M.',N'60528',N'Germany'),
	 (45,N'Let s Stop N Shop',N'Jaime Yorres',N'87 Polk St. Suite 5',N'San Francisco',N'94117',N'USA'),
	 (46,N'LILA-Supermercado',N'Carlos González',N'Carrera 52 con Ave. Bolívar #65-98 Llano Largo',N'Barquisimeto',N'3508',N'Venezuela'),
	 (47,N'LINO-Delicateses',N'Felipe Izquierdo',N'Ave. 5 de Mayo Porlamar',N'I. de Margarita',N'4980',N'Venezuela'),
	 (48,N'Lonesome Pine Restaurant',N'Fran Wilson',N'89 Chiaroscuro Rd.',N'Portland',N'97219',N'USA'),
	 (49,N'Magazzini Alimentari Riuniti',N'Giovanni Rovelli',N'Via Ludovico il Moro 22',N'Bergamo',N'24100',N'Italy'),
	 (50,N'Maison Dewey',N'Catherine Dewey',N'Rue Joseph-Bens 532',N'Bruxelles',N'B-1180',N'Belgium');
INSERT INTO nlakekitten_SampleDB.dbo.customers (CustomerID,CustomerName,ContactName,Address,City,PostalCode,Country) VALUES
	 (51,N'Mère Paillarde',N'Jean Fresnière',N'43 rue St. Laurent',N'Montréal',N'H1J 1C3',N'Canada'),
	 (52,N'Morgenstern Gesundkost',N'Alexander Feuer',N'Heerstr. 22',N'Leipzig',N'04179',N'Germany'),
	 (53,N'North/South',N'Simon Crowther',N'South House 300 Queensbridge',N'London',N'SW7 1RZ',N'UK'),
	 (54,N'Océano Atlántico Ltda.',N'Yvonne Moncada',N'Ing. Gustavo Moncada 8585 Piso 20-A',N'Buenos Aires',N'1010',N'Argentina'),
	 (55,N'Old World Delicatessen',N'Rene Phillips',N'2743 Bering St.',N'Anchorage',N'99508',N'USA'),
	 (56,N'Ottilies Käseladen',N'Henriette Pfalzheim',N'Mehrheimerstr. 369',N'Köln',N'50739',N'Germany'),
	 (57,N'Paris spécialités',N'Marie Bertrand',N'265, boulevard Charonne',N'Paris',N'75012',N'France'),
	 (58,N'Pericles Comidas clásicas',N'Guillermo Fernández',N'Calle Dr. Jorge Cash 321',N'México D.F.',N'05033',N'Mexico'),
	 (59,N'Piccolo und mehr',N'Georg Pipps',N'Geislweg 14',N'Salzburg',N'5020',N'Austria'),
	 (60,N'Princesa Isabel Vinhoss',N'Isabel de Castro',N'Estrada da saúde n. 58',N'Lisboa',N'1756',N'Portugal');
INSERT INTO nlakekitten_SampleDB.dbo.customers (CustomerID,CustomerName,ContactName,Address,City,PostalCode,Country) VALUES
	 (61,N'Que Delícia',N'Bernardo Batista',N'Rua da Panificadora, 12',N'Rio de Janeiro',N'02389-673',N'Brazil'),
	 (62,N'Queen Cozinha',N'Lúcia Carvalho',N'Alameda dos Canàrios, 891',N'São Paulo',N'05487-020',N'Brazil'),
	 (63,N'QUICK-Stop',N'Horst Kloss',N'Taucherstraße 10',N'Cunewalde',N'01307',N'Germany'),
	 (64,N'Rancho grande',N'Sergio Gutiérrez',N'Av. del Libertador 900',N'Buenos Aires',N'1010',N'Argentina'),
	 (65,N'Rattlesnake Canyon Grocery',N'Paula Wilson',N'2817 Milton Dr.',N'Albuquerque',N'87110',N'USA'),
	 (66,N'Reggiani Caseifici',N'Maurizio Moroni',N'Strada Provinciale 124',N'Reggio Emilia',N'42100',N'Italy'),
	 (67,N'Ricardo Adocicados',N'Janete Limeira',N'Av. Copacabana, 267',N'Rio de Janeiro',N'02389-890',N'Brazil'),
	 (68,N'Richter Supermarkt',N'Michael Holz',N'Grenzacherweg 237',N'Genève',N'1203',N'Switzerland'),
	 (69,N'Romero y tomillo',N'Alejandra Camino',N'Gran Vía, 1',N'Madrid',N'28001',N'Spain'),
	 (70,N'Santé Gourmet',N'Jonas Bergulfsen',N'Erling Skakkes gate 78',N'Stavern',N'4110',N'Norway');
INSERT INTO nlakekitten_SampleDB.dbo.customers (CustomerID,CustomerName,ContactName,Address,City,PostalCode,Country) VALUES
	 (71,N'Save-a-lot Markets',N'Jose Pavarotti',N'187 Suffolk Ln.',N'Boise',N'83720',N'USA'),
	 (72,N'Seven Seas Imports',N'Hari Kumar',N'90 Wadhurst Rd.',N'London',N'OX15 4NB',N'UK'),
	 (73,N'Simons bistro',N'Jytte Petersen',N'Vinbæltet 34',N'København',N'1734',N'Denmark'),
	 (74,N'Spécialités du monde',N'Dominique Perrier',N'25, rue Lauriston',N'Paris',N'75016',N'France'),
	 (75,N'Split Rail Beer & Ale',N'Art Braunschweiger',N'P.O. Box 555',N'Lander',N'82520',N'USA'),
	 (76,N'Suprêmes délices',N'Pascale Cartrain',N'Boulevard Tirou, 255',N'Charleroi',N'B-6000',N'Belgium'),
	 (77,N'The Big Cheese',N'Liz Nixon',N'89 Jefferson Way Suite 2',N'Portland',N'97201',N'USA'),
	 (78,N'The Cracker Box',N'Liu Wong',N'55 Grizzly Peak Rd.',N'Butte',N'59801',N'USA'),
	 (79,N'Toms Spezialitäten',N'Karin Josephs',N'Luisenstr. 48',N'Münster',N'44087',N'Germany'),
	 (80,N'Tortuga Restaurante',N'Miguel Angel Paolino',N'Avda. Azteca 123',N'México D.F.',N'05033',N'Mexico');
INSERT INTO nlakekitten_SampleDB.dbo.customers (CustomerID,CustomerName,ContactName,Address,City,PostalCode,Country) VALUES
	 (81,N'Tradição Hipermercados',N'Anabela Domingues',N'Av. Inês de Castro, 414',N'São Paulo',N'05634-030',N'Brazil'),
	 (82,N'Trail s Head Gourmet Provisioners',N'Helvetius Nagy',N'722 DaVinci Blvd.',N'Kirkland',N'98034',N'USA'),
	 (83,N'Vaffeljernet',N'Palle Ibsen',N'Smagsløget 45',N'Århus',N'8200',N'Denmark'),
	 (84,N'Victuailles en stock',N'Mary Saveley',N'2, rue du Commerce',N'Lyon',N'69004',N'France'),
	 (85,N'Vins et alcools Chevalier',N'Paul Henriot',N'59 rue de l Abbaye',N'Reims',N'51100',N'France'),
	 (86,N'Die Wandernde Kuh',N'Rita Müller',N'Adenauerallee 900',N'Stuttgart',N'70563',N'Germany'),
	 (87,N'Wartian Herkku',N'Pirkko Koskitalo',N'Torikatu 38',N'Oulu',N'90110',N'Finland'),
	 (88,N'Wellington Importadora',N'Paula Parente',N'Rua do Mercado, 12',N'Resende',N'08737-363',N'Brazil'),
	 (89,N'White Clover Markets',N'Karl Jablonski',N'305 - 14th Ave. S. Suite 3B',N'Seattle',N'98128',N'USA'),
	 (90,N'Wilman Kala',N'Matti Karttunen',N'Keskuskatu 45',N'Helsinki',N'21240',N'Finland');
INSERT INTO nlakekitten_SampleDB.dbo.customers (CustomerID,CustomerName,ContactName,Address,City,PostalCode,Country) VALUES
	 (91,N'Wolski',N'Zbyszek',N'ul. Filtrowa 68',N'Walla',N'01-012',N'Poland');
INSERT INTO nlakekitten_SampleDB.dbo.employees (EmployeeID,LastName,FirstName,BirthDate,Photo,Notes) VALUES
	 (1,N'Davolio',N'Nancy','1968-12-08',N'EmpID1.pic',N'Education includes a BA in psychology from Colorado State University. She also completed (The Art of the Cold Call). Nancy is a member of ''Toastmasters International''.'),
	 (2,N'Fuller',N'Andrew','1952-02-19',N'EmpID2.pic',N'Andrew received his BTS commercial and a Ph.D. in international marketing from the University of Dallas. He is fluent in French and Italian and reads German. He joined the company as a sales representative, was promoted to sales manager and was then named vice president of sales. Andrew is a member of the Sales Management Roundtable, the Seattle Chamber of Commerce, and the Pacific Rim Importers Association.'),
	 (3,N'Leverling',N'Janet','1963-08-30',N'EmpID3.pic',N'Janet has a BS degree in chemistry from Boston College). She has also completed a certificate program in food retailing management. Janet was hired as a sales associate and was promoted to sales representative.'),
	 (4,N'Peacock',N'Margaret','1958-09-19',N'EmpID4.pic',N'Margaret holds a BA in English literature from Concordia College and an MA from the American Institute of Culinary Arts. She was temporarily assigned to the London office before returning to her permanent post in Seattle.'),
	 (5,N'Buchanan',N'Steven','1955-03-04',N'EmpID5.pic',N'Steven Buchanan graduated from St. Andrews University, Scotland, with a BSC degree. Upon joining the company as a sales representative, he spent 6 months in an orientation program at the Seattle office and then returned to his permanent post in London, where he was promoted to sales manager. Mr. Buchanan has completed the courses ''Successful Telemarketing'' and ''International Sales Management''. He is fluent in French.'),
	 (6,N'Suyama',N'Michael','1963-07-02',N'EmpID6.pic',N'Michael is a graduate of Sussex University (MA, economics) and the University of California at Los Angeles (MBA, marketing). He has also taken the courses ''Multi-Cultural Selling'' and ''Time Management for the Sales Professional''. He is fluent in Japanese and can read and write French, Portuguese, and Spanish.'),
	 (7,N'King',N'Robert','1960-05-29',N'EmpID7.pic',N'Robert King served in the Peace Corps and traveled extensively before completing his degree in English at the University of Michigan and then joining the company. After completing a course entitled ''Selling in Europe'', he was transferred to the London office.'),
	 (8,N'Callahan',N'Laura','1958-01-09',N'EmpID8.pic',N'Laura received a BA in psychology from the University of Washington. She has also completed a course in business French. She reads and writes French.'),
	 (9,N'Dodsworth',N'Anne','1969-07-02',N'EmpID9.pic',N'Anne has a BA degree in English from St. Lawrence College. She is fluent in French and German.'),
	 (10,N'West',N'Adam','1928-09-19',N'EmpID10.pic',N'An old chum.');
INSERT INTO nlakekitten_SampleDB.dbo.order_details (OrderDetailID,OrderID,ProductID,Quantity) VALUES
	 (1,10248,11,12),
	 (2,10248,42,10),
	 (3,10248,72,5),
	 (4,10249,14,9),
	 (5,10249,51,40),
	 (6,10250,41,10),
	 (7,10250,51,35),
	 (8,10250,65,15),
	 (9,10251,22,6),
	 (10,10251,57,15);
INSERT INTO nlakekitten_SampleDB.dbo.order_details (OrderDetailID,OrderID,ProductID,Quantity) VALUES
	 (11,10251,65,20),
	 (12,10252,20,40),
	 (13,10252,33,25),
	 (14,10252,60,40),
	 (15,10253,31,20),
	 (16,10253,39,42),
	 (17,10253,49,40),
	 (18,10254,24,15),
	 (19,10254,55,21),
	 (20,10254,74,21);
INSERT INTO nlakekitten_SampleDB.dbo.order_details (OrderDetailID,OrderID,ProductID,Quantity) VALUES
	 (21,10255,2,20),
	 (22,10255,16,35),
	 (23,10255,36,25),
	 (24,10255,59,30),
	 (25,10256,53,15),
	 (26,10256,77,12),
	 (27,10257,27,25),
	 (28,10257,39,6),
	 (29,10257,77,15),
	 (30,10258,2,50);
INSERT INTO nlakekitten_SampleDB.dbo.order_details (OrderDetailID,OrderID,ProductID,Quantity) VALUES
	 (31,10258,5,65),
	 (32,10258,32,6),
	 (33,10259,21,10),
	 (34,10259,37,1),
	 (35,10260,41,16),
	 (36,10260,57,50),
	 (37,10260,62,15),
	 (38,10260,70,21),
	 (39,10261,21,20),
	 (40,10261,35,20);
INSERT INTO nlakekitten_SampleDB.dbo.order_details (OrderDetailID,OrderID,ProductID,Quantity) VALUES
	 (41,10262,5,12),
	 (42,10262,7,15),
	 (43,10262,56,2),
	 (44,10263,16,60),
	 (45,10263,24,28),
	 (46,10263,30,60),
	 (47,10263,74,36),
	 (48,10264,2,35),
	 (49,10264,41,25),
	 (50,10265,17,30);
INSERT INTO nlakekitten_SampleDB.dbo.order_details (OrderDetailID,OrderID,ProductID,Quantity) VALUES
	 (51,10265,70,20),
	 (52,10266,12,12),
	 (53,10267,40,50),
	 (54,10267,59,70),
	 (55,10267,76,15),
	 (56,10268,29,10),
	 (57,10268,72,4),
	 (58,10269,33,60),
	 (59,10269,72,20),
	 (60,10270,36,30);
INSERT INTO nlakekitten_SampleDB.dbo.order_details (OrderDetailID,OrderID,ProductID,Quantity) VALUES
	 (61,10270,43,25),
	 (62,10271,33,24),
	 (63,10272,20,6),
	 (64,10272,31,40),
	 (65,10272,72,24),
	 (66,10273,10,24),
	 (67,10273,31,15),
	 (68,10273,33,20),
	 (69,10273,40,60),
	 (70,10273,76,33);
INSERT INTO nlakekitten_SampleDB.dbo.order_details (OrderDetailID,OrderID,ProductID,Quantity) VALUES
	 (71,10274,71,20),
	 (72,10274,72,7),
	 (73,10275,24,12),
	 (74,10275,59,6),
	 (75,10276,10,15),
	 (76,10276,13,10),
	 (77,10277,28,20),
	 (78,10277,62,12),
	 (79,10278,44,16),
	 (80,10278,59,15);
INSERT INTO nlakekitten_SampleDB.dbo.order_details (OrderDetailID,OrderID,ProductID,Quantity) VALUES
	 (81,10278,63,8),
	 (82,10278,73,25),
	 (83,10279,17,15),
	 (84,10280,24,12),
	 (85,10280,55,20),
	 (86,10280,75,30),
	 (87,10281,19,1),
	 (88,10281,24,6),
	 (89,10281,35,4),
	 (90,10282,30,6);
INSERT INTO nlakekitten_SampleDB.dbo.order_details (OrderDetailID,OrderID,ProductID,Quantity) VALUES
	 (91,10282,57,2),
	 (92,10283,15,20),
	 (93,10283,19,18),
	 (94,10283,60,35),
	 (95,10283,72,3),
	 (96,10284,27,15),
	 (97,10284,44,21),
	 (98,10284,60,20),
	 (99,10284,67,5),
	 (100,10285,1,45);
INSERT INTO nlakekitten_SampleDB.dbo.order_details (OrderDetailID,OrderID,ProductID,Quantity) VALUES
	 (101,10285,40,40),
	 (102,10285,53,36),
	 (103,10286,35,100),
	 (104,10286,62,40),
	 (105,10287,16,40),
	 (106,10287,34,20),
	 (107,10287,46,15),
	 (108,10288,54,10),
	 (109,10288,68,3),
	 (110,10289,3,30);
INSERT INTO nlakekitten_SampleDB.dbo.order_details (OrderDetailID,OrderID,ProductID,Quantity) VALUES
	 (111,10289,64,9),
	 (112,10290,5,20),
	 (113,10290,29,15),
	 (114,10290,49,15),
	 (115,10290,77,10),
	 (116,10291,13,20),
	 (117,10291,44,24),
	 (118,10291,51,2),
	 (119,10292,20,20),
	 (120,10293,18,12);
INSERT INTO nlakekitten_SampleDB.dbo.order_details (OrderDetailID,OrderID,ProductID,Quantity) VALUES
	 (121,10293,24,10),
	 (122,10293,63,5),
	 (123,10293,75,6),
	 (124,10294,1,18),
	 (125,10294,17,15),
	 (126,10294,43,15),
	 (127,10294,60,21),
	 (128,10294,75,6),
	 (129,10295,56,4),
	 (130,10296,11,12);
INSERT INTO nlakekitten_SampleDB.dbo.order_details (OrderDetailID,OrderID,ProductID,Quantity) VALUES
	 (131,10296,16,30),
	 (132,10296,69,15),
	 (133,10297,39,60),
	 (134,10297,72,20),
	 (135,10298,2,40),
	 (136,10298,36,40),
	 (137,10298,59,30),
	 (138,10298,62,15),
	 (139,10299,19,15),
	 (140,10299,70,20);
INSERT INTO nlakekitten_SampleDB.dbo.order_details (OrderDetailID,OrderID,ProductID,Quantity) VALUES
	 (141,10300,66,30),
	 (142,10300,68,20),
	 (143,10301,40,10),
	 (144,10301,56,20),
	 (145,10302,17,40),
	 (146,10302,28,28),
	 (147,10302,43,12),
	 (148,10303,40,40),
	 (149,10303,65,30),
	 (150,10303,68,15);
INSERT INTO nlakekitten_SampleDB.dbo.order_details (OrderDetailID,OrderID,ProductID,Quantity) VALUES
	 (151,10304,49,30),
	 (152,10304,59,10),
	 (153,10304,71,2),
	 (154,10305,18,25),
	 (155,10305,29,25),
	 (156,10305,39,30),
	 (157,10306,30,10),
	 (158,10306,53,10),
	 (159,10306,54,5),
	 (160,10307,62,10);
INSERT INTO nlakekitten_SampleDB.dbo.order_details (OrderDetailID,OrderID,ProductID,Quantity) VALUES
	 (161,10307,68,3),
	 (162,10308,69,1),
	 (163,10308,70,5),
	 (164,10309,4,20),
	 (165,10309,6,30),
	 (166,10309,42,2),
	 (167,10309,43,20),
	 (168,10309,71,3),
	 (169,10310,16,10),
	 (170,10310,62,5);
INSERT INTO nlakekitten_SampleDB.dbo.order_details (OrderDetailID,OrderID,ProductID,Quantity) VALUES
	 (171,10311,42,6),
	 (172,10311,69,7),
	 (173,10312,28,4),
	 (174,10312,43,24),
	 (175,10312,53,20),
	 (176,10312,75,10),
	 (177,10313,36,12),
	 (178,10314,32,40),
	 (179,10314,58,30),
	 (180,10314,62,25);
INSERT INTO nlakekitten_SampleDB.dbo.order_details (OrderDetailID,OrderID,ProductID,Quantity) VALUES
	 (181,10315,34,14),
	 (182,10315,70,30),
	 (183,10316,41,10),
	 (184,10316,62,70),
	 (185,10317,1,20),
	 (186,10318,41,20),
	 (187,10318,76,6),
	 (188,10319,17,8),
	 (189,10319,28,14),
	 (190,10319,76,30);
INSERT INTO nlakekitten_SampleDB.dbo.order_details (OrderDetailID,OrderID,ProductID,Quantity) VALUES
	 (191,10320,71,30),
	 (192,10321,35,10),
	 (193,10322,52,20),
	 (194,10323,15,5),
	 (195,10323,25,4),
	 (196,10323,39,4),
	 (197,10324,16,21),
	 (198,10324,35,70),
	 (199,10324,46,30),
	 (200,10324,59,40);
INSERT INTO nlakekitten_SampleDB.dbo.order_details (OrderDetailID,OrderID,ProductID,Quantity) VALUES
	 (201,10324,63,80),
	 (202,10325,6,6),
	 (203,10325,13,12),
	 (204,10325,14,9),
	 (205,10325,31,4),
	 (206,10325,72,40),
	 (207,10326,4,24),
	 (208,10326,57,16),
	 (209,10326,75,50),
	 (210,10327,2,25);
INSERT INTO nlakekitten_SampleDB.dbo.order_details (OrderDetailID,OrderID,ProductID,Quantity) VALUES
	 (211,10327,11,50),
	 (212,10327,30,35),
	 (213,10327,58,30),
	 (214,10328,59,9),
	 (215,10328,65,40),
	 (216,10328,68,10),
	 (217,10329,19,10),
	 (218,10329,30,8),
	 (219,10329,38,20),
	 (220,10329,56,12);
INSERT INTO nlakekitten_SampleDB.dbo.order_details (OrderDetailID,OrderID,ProductID,Quantity) VALUES
	 (221,10330,26,50),
	 (222,10330,72,25),
	 (223,10331,54,15),
	 (224,10332,18,40),
	 (225,10332,42,10),
	 (226,10332,47,16),
	 (227,10333,14,10),
	 (228,10333,21,10),
	 (229,10333,71,40),
	 (230,10334,52,8);
INSERT INTO nlakekitten_SampleDB.dbo.order_details (OrderDetailID,OrderID,ProductID,Quantity) VALUES
	 (231,10334,68,10),
	 (232,10335,2,7),
	 (233,10335,31,25),
	 (234,10335,32,6),
	 (235,10335,51,48),
	 (236,10336,4,18),
	 (237,10337,23,40),
	 (238,10337,26,24),
	 (239,10337,36,20),
	 (240,10337,37,28);
INSERT INTO nlakekitten_SampleDB.dbo.order_details (OrderDetailID,OrderID,ProductID,Quantity) VALUES
	 (241,10337,72,25),
	 (242,10338,17,20),
	 (243,10338,30,15),
	 (244,10339,4,10),
	 (245,10339,17,70),
	 (246,10339,62,28),
	 (247,10340,18,20),
	 (248,10340,41,12),
	 (249,10340,43,40),
	 (250,10341,33,8);
INSERT INTO nlakekitten_SampleDB.dbo.order_details (OrderDetailID,OrderID,ProductID,Quantity) VALUES
	 (251,10341,59,9),
	 (252,10342,2,24),
	 (253,10342,31,56),
	 (254,10342,36,40),
	 (255,10342,55,40),
	 (256,10343,64,50),
	 (257,10343,68,4),
	 (258,10343,76,15),
	 (259,10344,4,35),
	 (260,10344,8,70);
INSERT INTO nlakekitten_SampleDB.dbo.order_details (OrderDetailID,OrderID,ProductID,Quantity) VALUES
	 (261,10345,8,70),
	 (262,10345,19,80),
	 (263,10345,42,9),
	 (264,10346,17,36),
	 (265,10346,56,20),
	 (266,10347,25,10),
	 (267,10347,39,50),
	 (268,10347,40,4),
	 (269,10347,75,6),
	 (270,10348,1,15);
INSERT INTO nlakekitten_SampleDB.dbo.order_details (OrderDetailID,OrderID,ProductID,Quantity) VALUES
	 (271,10348,23,25),
	 (272,10349,54,24),
	 (273,10350,50,15),
	 (274,10350,69,18),
	 (275,10351,38,20),
	 (276,10351,41,13),
	 (277,10351,44,77),
	 (278,10351,65,10),
	 (279,10352,24,10),
	 (280,10352,54,20);
INSERT INTO nlakekitten_SampleDB.dbo.order_details (OrderDetailID,OrderID,ProductID,Quantity) VALUES
	 (281,10353,11,12),
	 (282,10353,38,50),
	 (283,10354,1,12),
	 (284,10354,29,4),
	 (285,10355,24,25),
	 (286,10355,57,25),
	 (287,10356,31,30),
	 (288,10356,55,12),
	 (289,10356,69,20),
	 (290,10357,10,30);
INSERT INTO nlakekitten_SampleDB.dbo.order_details (OrderDetailID,OrderID,ProductID,Quantity) VALUES
	 (291,10357,26,16),
	 (292,10357,60,8),
	 (293,10358,24,10),
	 (294,10358,34,10),
	 (295,10358,36,20),
	 (296,10359,16,56),
	 (297,10359,31,70),
	 (298,10359,60,80),
	 (299,10360,28,30),
	 (300,10360,29,35);
INSERT INTO nlakekitten_SampleDB.dbo.order_details (OrderDetailID,OrderID,ProductID,Quantity) VALUES
	 (301,10360,38,10),
	 (302,10360,49,35),
	 (303,10360,54,28),
	 (304,10361,39,54),
	 (305,10361,60,55),
	 (306,10362,25,50),
	 (307,10362,51,20),
	 (308,10362,54,24),
	 (309,10363,31,20),
	 (310,10363,75,12);
INSERT INTO nlakekitten_SampleDB.dbo.order_details (OrderDetailID,OrderID,ProductID,Quantity) VALUES
	 (311,10363,76,12),
	 (312,10364,69,30),
	 (313,10364,71,5),
	 (314,10365,11,24),
	 (315,10366,65,5),
	 (316,10366,77,5),
	 (317,10367,34,36),
	 (318,10367,54,18),
	 (319,10367,65,15),
	 (320,10367,77,7);
INSERT INTO nlakekitten_SampleDB.dbo.order_details (OrderDetailID,OrderID,ProductID,Quantity) VALUES
	 (321,10368,21,5),
	 (322,10368,28,13),
	 (323,10368,57,25),
	 (324,10368,64,35),
	 (325,10369,29,20),
	 (326,10369,56,18),
	 (327,10370,1,15),
	 (328,10370,64,30),
	 (329,10370,74,20),
	 (330,10371,36,6);
INSERT INTO nlakekitten_SampleDB.dbo.order_details (OrderDetailID,OrderID,ProductID,Quantity) VALUES
	 (331,10372,20,12),
	 (332,10372,38,40),
	 (333,10372,60,70),
	 (334,10372,72,42),
	 (335,10373,58,80),
	 (336,10373,71,50),
	 (337,10374,31,30),
	 (338,10374,58,15),
	 (339,10375,14,15),
	 (340,10375,54,10);
INSERT INTO nlakekitten_SampleDB.dbo.order_details (OrderDetailID,OrderID,ProductID,Quantity) VALUES
	 (341,10376,31,42),
	 (342,10377,28,20),
	 (343,10377,39,20),
	 (344,10378,71,6),
	 (345,10379,41,8),
	 (346,10379,63,16),
	 (347,10379,65,20),
	 (348,10380,30,18),
	 (349,10380,53,20),
	 (350,10380,60,6);
INSERT INTO nlakekitten_SampleDB.dbo.order_details (OrderDetailID,OrderID,ProductID,Quantity) VALUES
	 (351,10380,70,30),
	 (352,10381,74,14),
	 (353,10382,5,32),
	 (354,10382,18,9),
	 (355,10382,29,14),
	 (356,10382,33,60),
	 (357,10382,74,50),
	 (358,10383,13,20),
	 (359,10383,50,15),
	 (360,10383,56,20);
INSERT INTO nlakekitten_SampleDB.dbo.order_details (OrderDetailID,OrderID,ProductID,Quantity) VALUES
	 (361,10384,20,28),
	 (362,10384,60,15),
	 (363,10385,7,10),
	 (364,10385,60,20),
	 (365,10385,68,8),
	 (366,10386,24,15),
	 (367,10386,34,10),
	 (368,10387,24,15),
	 (369,10387,28,6),
	 (370,10387,59,12);
INSERT INTO nlakekitten_SampleDB.dbo.order_details (OrderDetailID,OrderID,ProductID,Quantity) VALUES
	 (371,10387,71,15),
	 (372,10388,45,15),
	 (373,10388,52,20),
	 (374,10388,53,40),
	 (375,10389,10,16),
	 (376,10389,55,15),
	 (377,10389,62,20),
	 (378,10389,70,30),
	 (379,10390,31,60),
	 (380,10390,35,40);
INSERT INTO nlakekitten_SampleDB.dbo.order_details (OrderDetailID,OrderID,ProductID,Quantity) VALUES
	 (381,10390,46,45),
	 (382,10390,72,24),
	 (383,10391,13,18),
	 (384,10392,69,50),
	 (385,10393,2,25),
	 (386,10393,14,42),
	 (387,10393,25,7),
	 (388,10393,26,70),
	 (389,10393,31,32),
	 (390,10394,13,10);
INSERT INTO nlakekitten_SampleDB.dbo.order_details (OrderDetailID,OrderID,ProductID,Quantity) VALUES
	 (391,10394,62,10),
	 (392,10395,46,28),
	 (393,10395,53,70),
	 (394,10395,69,8),
	 (395,10396,23,40),
	 (396,10396,71,60),
	 (397,10396,72,21),
	 (398,10397,21,10),
	 (399,10397,51,18),
	 (400,10398,35,30);
INSERT INTO nlakekitten_SampleDB.dbo.order_details (OrderDetailID,OrderID,ProductID,Quantity) VALUES
	 (401,10398,55,120),
	 (402,10399,68,60),
	 (403,10399,71,30),
	 (404,10399,76,35),
	 (405,10399,77,14),
	 (406,10400,29,21),
	 (407,10400,35,35),
	 (408,10400,49,30),
	 (409,10401,30,18),
	 (410,10401,56,70);
INSERT INTO nlakekitten_SampleDB.dbo.order_details (OrderDetailID,OrderID,ProductID,Quantity) VALUES
	 (411,10401,65,20),
	 (412,10401,71,60),
	 (413,10402,23,60),
	 (414,10402,63,65),
	 (415,10403,16,21),
	 (416,10403,48,70),
	 (417,10404,26,30),
	 (418,10404,42,40),
	 (419,10404,49,30),
	 (420,10405,3,50);
INSERT INTO nlakekitten_SampleDB.dbo.order_details (OrderDetailID,OrderID,ProductID,Quantity) VALUES
	 (421,10406,1,10),
	 (422,10406,21,30),
	 (423,10406,28,42),
	 (424,10406,36,5),
	 (425,10406,40,2),
	 (426,10407,11,30),
	 (427,10407,69,15),
	 (428,10407,71,15),
	 (429,10408,37,10),
	 (430,10408,54,6);
INSERT INTO nlakekitten_SampleDB.dbo.order_details (OrderDetailID,OrderID,ProductID,Quantity) VALUES
	 (431,10408,62,35),
	 (432,10409,14,12),
	 (433,10409,21,12),
	 (434,10410,33,49),
	 (435,10410,59,16),
	 (436,10411,41,25),
	 (437,10411,44,40),
	 (438,10411,59,9),
	 (439,10412,14,20),
	 (440,10413,1,24);
INSERT INTO nlakekitten_SampleDB.dbo.order_details (OrderDetailID,OrderID,ProductID,Quantity) VALUES
	 (441,10413,62,40),
	 (442,10413,76,14),
	 (443,10414,19,18),
	 (444,10414,33,50),
	 (445,10415,17,2),
	 (446,10415,33,20),
	 (447,10416,19,20),
	 (448,10416,53,10),
	 (449,10416,57,20),
	 (450,10417,38,50);
INSERT INTO nlakekitten_SampleDB.dbo.order_details (OrderDetailID,OrderID,ProductID,Quantity) VALUES
	 (451,10417,46,2),
	 (452,10417,68,36),
	 (453,10417,77,35),
	 (454,10418,2,60),
	 (455,10418,47,55),
	 (456,10418,61,16),
	 (457,10418,74,15),
	 (458,10419,60,60),
	 (459,10419,69,20),
	 (460,10420,9,20);
INSERT INTO nlakekitten_SampleDB.dbo.order_details (OrderDetailID,OrderID,ProductID,Quantity) VALUES
	 (461,10420,13,2),
	 (462,10420,70,8),
	 (463,10420,73,20),
	 (464,10421,19,4),
	 (465,10421,26,30),
	 (466,10421,53,15),
	 (467,10421,77,10),
	 (468,10422,26,2),
	 (469,10423,31,14),
	 (470,10423,59,20);
INSERT INTO nlakekitten_SampleDB.dbo.order_details (OrderDetailID,OrderID,ProductID,Quantity) VALUES
	 (471,10424,35,60),
	 (472,10424,38,49),
	 (473,10424,68,30),
	 (474,10425,55,10),
	 (475,10425,76,20),
	 (476,10426,56,5),
	 (477,10426,64,7),
	 (478,10427,14,35),
	 (479,10428,46,20),
	 (480,10429,50,40);
INSERT INTO nlakekitten_SampleDB.dbo.order_details (OrderDetailID,OrderID,ProductID,Quantity) VALUES
	 (481,10429,63,35),
	 (482,10430,17,45),
	 (483,10430,21,50),
	 (484,10430,56,30),
	 (485,10430,59,70),
	 (486,10431,17,50),
	 (487,10431,40,50),
	 (488,10431,47,30),
	 (489,10432,26,10),
	 (490,10432,54,40);
INSERT INTO nlakekitten_SampleDB.dbo.order_details (OrderDetailID,OrderID,ProductID,Quantity) VALUES
	 (491,10433,56,28),
	 (492,10434,11,6),
	 (493,10434,76,18),
	 (494,10435,2,10),
	 (495,10435,22,12),
	 (496,10435,72,10),
	 (497,10436,46,5),
	 (498,10436,56,40),
	 (499,10436,64,30),
	 (500,10436,75,24);
INSERT INTO nlakekitten_SampleDB.dbo.order_details (OrderDetailID,OrderID,ProductID,Quantity) VALUES
	 (501,10437,53,15),
	 (502,10438,19,15),
	 (503,10438,34,20),
	 (504,10438,57,15),
	 (505,10439,12,15),
	 (506,10439,16,16),
	 (507,10439,64,6),
	 (508,10439,74,30),
	 (509,10440,2,45),
	 (510,10440,16,49);
INSERT INTO nlakekitten_SampleDB.dbo.order_details (OrderDetailID,OrderID,ProductID,Quantity) VALUES
	 (511,10440,29,24),
	 (512,10440,61,90),
	 (513,10441,27,50),
	 (514,10442,11,30),
	 (515,10442,54,80),
	 (516,10442,66,60),
	 (517,10443,11,6),
	 (518,10443,28,12);
INSERT INTO nlakekitten_SampleDB.dbo.orders (OrderID,CustomerID,EmployeeID,OrderDate,ShipperID) VALUES
	 (10248,90,5,'1996-07-04',3),
	 (10249,81,6,'1996-07-05',1),
	 (10250,34,4,'1996-07-08',2),
	 (10251,84,3,'1996-07-08',1),
	 (10252,76,4,'1996-07-09',2),
	 (10253,34,3,'1996-07-10',2),
	 (10254,14,5,'1996-07-11',2),
	 (10255,68,9,'1996-07-12',3),
	 (10256,88,3,'1996-07-15',2),
	 (10257,35,4,'1996-07-16',3);
INSERT INTO nlakekitten_SampleDB.dbo.orders (OrderID,CustomerID,EmployeeID,OrderDate,ShipperID) VALUES
	 (10258,20,1,'1996-07-17',1),
	 (10259,13,4,'1996-07-18',3),
	 (10260,55,4,'1996-07-19',1),
	 (10261,61,4,'1996-07-19',2),
	 (10262,65,8,'1996-07-22',3),
	 (10263,20,9,'1996-07-23',3),
	 (10264,24,6,'1996-07-24',3),
	 (10265,7,2,'1996-07-25',1),
	 (10266,87,3,'1996-07-26',3),
	 (10267,25,4,'1996-07-29',1);
INSERT INTO nlakekitten_SampleDB.dbo.orders (OrderID,CustomerID,EmployeeID,OrderDate,ShipperID) VALUES
	 (10268,33,8,'1996-07-30',3),
	 (10269,89,5,'1996-07-31',1),
	 (10270,87,1,'1996-08-01',1),
	 (10271,75,6,'1996-08-01',2),
	 (10272,65,6,'1996-08-02',2),
	 (10273,63,3,'1996-08-05',3),
	 (10274,85,6,'1996-08-06',1),
	 (10275,49,1,'1996-08-07',1),
	 (10276,80,8,'1996-08-08',3),
	 (10277,52,2,'1996-08-09',3);
INSERT INTO nlakekitten_SampleDB.dbo.orders (OrderID,CustomerID,EmployeeID,OrderDate,ShipperID) VALUES
	 (10278,5,8,'1996-08-12',2),
	 (10279,44,8,'1996-08-13',2),
	 (10280,5,2,'1996-08-14',1),
	 (10281,69,4,'1996-08-14',1),
	 (10282,69,4,'1996-08-15',1),
	 (10283,46,3,'1996-08-16',3),
	 (10284,44,4,'1996-08-19',1),
	 (10285,63,1,'1996-08-20',2),
	 (10286,63,8,'1996-08-21',3),
	 (10287,67,8,'1996-08-22',3);
INSERT INTO nlakekitten_SampleDB.dbo.orders (OrderID,CustomerID,EmployeeID,OrderDate,ShipperID) VALUES
	 (10288,66,4,'1996-08-23',1),
	 (10289,11,7,'1996-08-26',3),
	 (10290,15,8,'1996-08-27',1),
	 (10291,61,6,'1996-08-27',2),
	 (10292,81,1,'1996-08-28',2),
	 (10293,80,1,'1996-08-29',3),
	 (10294,65,4,'1996-08-30',2),
	 (10295,85,2,'1996-09-02',2),
	 (10296,46,6,'1996-09-03',1),
	 (10297,7,5,'1996-09-04',2);
INSERT INTO nlakekitten_SampleDB.dbo.orders (OrderID,CustomerID,EmployeeID,OrderDate,ShipperID) VALUES
	 (10298,37,6,'1996-09-05',2),
	 (10299,67,4,'1996-09-06',2),
	 (10300,49,2,'1996-09-09',2),
	 (10301,86,8,'1996-09-09',2),
	 (10302,76,4,'1996-09-10',2),
	 (10303,30,7,'1996-09-11',2),
	 (10304,80,1,'1996-09-12',2),
	 (10305,55,8,'1996-09-13',3),
	 (10306,69,1,'1996-09-16',3),
	 (10307,48,2,'1996-09-17',2);
INSERT INTO nlakekitten_SampleDB.dbo.orders (OrderID,CustomerID,EmployeeID,OrderDate,ShipperID) VALUES
	 (10308,2,7,'1996-09-18',3),
	 (10309,37,3,'1996-09-19',1),
	 (10310,77,8,'1996-09-20',2),
	 (10311,18,1,'1996-09-20',3),
	 (10312,86,2,'1996-09-23',2),
	 (10313,63,2,'1996-09-24',2),
	 (10314,65,1,'1996-09-25',2),
	 (10315,38,4,'1996-09-26',2),
	 (10316,65,1,'1996-09-27',3),
	 (10317,48,6,'1996-09-30',1);
INSERT INTO nlakekitten_SampleDB.dbo.orders (OrderID,CustomerID,EmployeeID,OrderDate,ShipperID) VALUES
	 (10318,38,8,'1996-10-01',2),
	 (10319,80,7,'1996-10-02',3),
	 (10320,87,5,'1996-10-03',3),
	 (10321,38,3,'1996-10-03',2),
	 (10322,58,7,'1996-10-04',3),
	 (10323,39,4,'1996-10-07',1),
	 (10324,71,9,'1996-10-08',1),
	 (10325,39,1,'1996-10-09',3),
	 (10326,8,4,'1996-10-10',2),
	 (10327,24,2,'1996-10-11',1);
INSERT INTO nlakekitten_SampleDB.dbo.orders (OrderID,CustomerID,EmployeeID,OrderDate,ShipperID) VALUES
	 (10328,28,4,'1996-10-14',3),
	 (10329,75,4,'1996-10-15',2),
	 (10330,46,3,'1996-10-16',1),
	 (10331,9,9,'1996-10-16',1),
	 (10332,51,3,'1996-10-17',2),
	 (10333,87,5,'1996-10-18',3),
	 (10334,84,8,'1996-10-21',2),
	 (10335,37,7,'1996-10-22',2),
	 (10336,60,7,'1996-10-23',2),
	 (10337,25,4,'1996-10-24',3);
INSERT INTO nlakekitten_SampleDB.dbo.orders (OrderID,CustomerID,EmployeeID,OrderDate,ShipperID) VALUES
	 (10338,55,4,'1996-10-25',3),
	 (10339,51,2,'1996-10-28',2),
	 (10340,9,1,'1996-10-29',3),
	 (10341,73,7,'1996-10-29',3),
	 (10342,25,4,'1996-10-30',2),
	 (10343,44,4,'1996-10-31',1),
	 (10344,89,4,'1996-11-01',2),
	 (10345,63,2,'1996-11-04',2),
	 (10346,65,3,'1996-11-05',3),
	 (10347,21,4,'1996-11-06',3);
INSERT INTO nlakekitten_SampleDB.dbo.orders (OrderID,CustomerID,EmployeeID,OrderDate,ShipperID) VALUES
	 (10348,86,4,'1996-11-07',2),
	 (10349,75,7,'1996-11-08',1),
	 (10350,41,6,'1996-11-11',2),
	 (10351,20,1,'1996-11-11',1),
	 (10352,28,3,'1996-11-12',3),
	 (10353,59,7,'1996-11-13',3),
	 (10354,58,8,'1996-11-14',3),
	 (10355,4,6,'1996-11-15',1),
	 (10356,86,6,'1996-11-18',2),
	 (10357,46,1,'1996-11-19',3);
INSERT INTO nlakekitten_SampleDB.dbo.orders (OrderID,CustomerID,EmployeeID,OrderDate,ShipperID) VALUES
	 (10358,41,5,'1996-11-20',1),
	 (10359,72,5,'1996-11-21',3),
	 (10360,7,4,'1996-11-22',3),
	 (10361,63,1,'1996-11-22',2),
	 (10362,9,3,'1996-11-25',1),
	 (10363,17,4,'1996-11-26',3),
	 (10364,19,1,'1996-11-26',1),
	 (10365,3,3,'1996-11-27',2),
	 (10366,29,8,'1996-11-28',2),
	 (10367,83,7,'1996-11-28',3);
INSERT INTO nlakekitten_SampleDB.dbo.orders (OrderID,CustomerID,EmployeeID,OrderDate,ShipperID) VALUES
	 (10368,20,2,'1996-11-29',2),
	 (10369,75,8,'1996-12-02',2),
	 (10370,14,6,'1996-12-03',2),
	 (10371,41,1,'1996-12-03',1),
	 (10372,62,5,'1996-12-04',2),
	 (10373,37,4,'1996-12-05',3),
	 (10374,91,1,'1996-12-05',3),
	 (10375,36,3,'1996-12-06',2),
	 (10376,51,1,'1996-12-09',2),
	 (10377,72,1,'1996-12-09',3);
INSERT INTO nlakekitten_SampleDB.dbo.orders (OrderID,CustomerID,EmployeeID,OrderDate,ShipperID) VALUES
	 (10378,24,5,'1996-12-10',3),
	 (10379,61,2,'1996-12-11',1),
	 (10380,37,8,'1996-12-12',3),
	 (10381,46,3,'1996-12-12',3),
	 (10382,20,4,'1996-12-13',1),
	 (10383,4,8,'1996-12-16',3),
	 (10384,5,3,'1996-12-16',3),
	 (10385,75,1,'1996-12-17',2),
	 (10386,21,9,'1996-12-18',3),
	 (10387,70,1,'1996-12-18',2);
INSERT INTO nlakekitten_SampleDB.dbo.orders (OrderID,CustomerID,EmployeeID,OrderDate,ShipperID) VALUES
	 (10388,72,2,'1996-12-19',1),
	 (10389,10,4,'1996-12-20',2),
	 (10390,20,6,'1996-12-23',1),
	 (10391,17,3,'1996-12-23',3),
	 (10392,59,2,'1996-12-24',3),
	 (10393,71,1,'1996-12-25',3),
	 (10394,36,1,'1996-12-25',3),
	 (10395,35,6,'1996-12-26',1),
	 (10396,25,1,'1996-12-27',3),
	 (10397,60,5,'1996-12-27',1);
INSERT INTO nlakekitten_SampleDB.dbo.orders (OrderID,CustomerID,EmployeeID,OrderDate,ShipperID) VALUES
	 (10398,71,2,'1996-12-30',3),
	 (10399,83,8,'1996-12-31',3),
	 (10400,19,1,'1997-01-01',3),
	 (10401,65,1,'1997-01-01',1),
	 (10402,20,8,'1997-01-02',2),
	 (10403,20,4,'1997-01-03',3),
	 (10404,49,2,'1997-01-03',1),
	 (10405,47,1,'1997-01-06',1),
	 (10406,62,7,'1997-01-07',1),
	 (10407,56,2,'1997-01-07',2);
INSERT INTO nlakekitten_SampleDB.dbo.orders (OrderID,CustomerID,EmployeeID,OrderDate,ShipperID) VALUES
	 (10408,23,8,'1997-01-08',1),
	 (10409,54,3,'1997-01-09',1),
	 (10410,10,3,'1997-01-10',3),
	 (10411,10,9,'1997-01-10',3),
	 (10412,87,8,'1997-01-13',2),
	 (10413,41,3,'1997-01-14',2),
	 (10414,21,2,'1997-01-14',3),
	 (10415,36,3,'1997-01-15',1),
	 (10416,87,8,'1997-01-16',3),
	 (10417,73,4,'1997-01-16',3);
INSERT INTO nlakekitten_SampleDB.dbo.orders (OrderID,CustomerID,EmployeeID,OrderDate,ShipperID) VALUES
	 (10418,63,4,'1997-01-17',1),
	 (10419,68,4,'1997-01-20',2),
	 (10420,88,3,'1997-01-21',1),
	 (10421,61,8,'1997-01-21',1),
	 (10422,27,2,'1997-01-22',1),
	 (10423,31,6,'1997-01-23',3),
	 (10424,51,7,'1997-01-23',2),
	 (10425,41,6,'1997-01-24',2),
	 (10426,29,4,'1997-01-27',1),
	 (10427,59,4,'1997-01-27',2);
INSERT INTO nlakekitten_SampleDB.dbo.orders (OrderID,CustomerID,EmployeeID,OrderDate,ShipperID) VALUES
	 (10428,66,7,'1997-01-28',1),
	 (10429,37,3,'1997-01-29',2),
	 (10430,20,4,'1997-01-30',1),
	 (10431,10,4,'1997-01-30',2),
	 (10432,75,3,'1997-01-31',2),
	 (10433,60,3,'1997-02-03',3),
	 (10434,24,3,'1997-02-03',2),
	 (10435,16,8,'1997-02-04',2),
	 (10436,7,3,'1997-02-05',2),
	 (10437,87,8,'1997-02-05',1);
INSERT INTO nlakekitten_SampleDB.dbo.orders (OrderID,CustomerID,EmployeeID,OrderDate,ShipperID) VALUES
	 (10438,79,3,'1997-02-06',2),
	 (10439,51,6,'1997-02-07',3),
	 (10440,71,4,'1997-02-10',2),
	 (10441,55,3,'1997-02-10',2),
	 (10442,20,3,'1997-02-11',2),
	 (10443,66,8,'1997-02-12',1);
INSERT INTO nlakekitten_SampleDB.dbo.products (ProductID,ProductName,SupplierID,CategoryID,Unit,Price) VALUES
	 (1,N'Chais',1,1,N'10 boxes x 20 bags',18),
	 (2,N'Chang',1,1,N'24 - 12 oz bottles',19),
	 (3,N'Aniseed Syrup',1,2,N'12 - 550 ml bottles',10),
	 (4,N'Chef Anton s Cajun Seasoning',2,2,N'48 - 6 oz jars',22),
	 (5,N'Chef Anton s Gumbo Mix',2,2,N'36 boxes',21),
	 (6,N'Grandma s Boysenberry Spread',3,2,N'12 - 8 oz jars',25),
	 (7,N'Uncle Bob s Organic Dried Pears',3,7,N'12 - 1 lb pkgs.',30),
	 (8,N'Northwoods Cranberry Sauce',3,2,N'12 - 12 oz jars',40),
	 (9,N'Mishi Kobe Niku',4,6,N'18 - 500 g pkgs.',97),
	 (10,N'Ikura',4,8,N'12 - 200 ml jars',31);
INSERT INTO nlakekitten_SampleDB.dbo.products (ProductID,ProductName,SupplierID,CategoryID,Unit,Price) VALUES
	 (11,N'Queso Cabrales',5,4,N'1 kg pkg.',21),
	 (12,N'Queso Manchego La Pastora',5,4,N'10 - 500 g pkgs.',38),
	 (13,N'Konbu',6,8,N'2 kg box',6),
	 (14,N'Tofu',6,7,N'40 - 100 g pkgs.',23),
	 (15,N'Genen Shouyu',6,2,N'24 - 250 ml bottles',16),
	 (16,N'Pavlova',7,3,N'32 - 500 g boxes',17),
	 (17,N'Alice Mutton',7,6,N'20 - 1 kg tins',39),
	 (18,N'Carnarvon Tigers',7,8,N'16 kg pkg.',63),
	 (19,N'Teatime Chocolate Biscuits',8,3,N'10 boxes x 12 pieces',9),
	 (20,N'Sir Rodney s Marmalade',8,3,N'30 gift boxes',81);
INSERT INTO nlakekitten_SampleDB.dbo.products (ProductID,ProductName,SupplierID,CategoryID,Unit,Price) VALUES
	 (21,N'Sir Rodney s Scones',8,3,N'24 pkgs. x 4 pieces',10),
	 (22,N'Gustaf s Knäckebröd',9,5,N'24 - 500 g pkgs.',21),
	 (23,N'Tunnbröd',9,5,N'12 - 250 g pkgs.',9),
	 (24,N'Guaraná Fantástica',10,1,N'12 - 355 ml cans',5),
	 (25,N'NuNuCa Nuß-Nougat-Creme',11,3,N'20 - 450 g glasses',14),
	 (26,N'Gumbär Gummibärchen',11,3,N'100 - 250 g bags',31),
	 (27,N'Schoggi Schokolade',11,3,N'100 - 100 g pieces',44),
	 (28,N'Rössle Sauerkraut',12,7,N'25 - 825 g cans',46),
	 (29,N'Thüringer Rostbratwurst',12,6,N'50 bags x 30 sausgs.',124),
	 (30,N'Nord-Ost Matjeshering',13,8,N'10 - 200 g glasses',26);
INSERT INTO nlakekitten_SampleDB.dbo.products (ProductID,ProductName,SupplierID,CategoryID,Unit,Price) VALUES
	 (31,N'Gorgonzola Telino',14,4,N'12 - 100 g pkgs',13),
	 (32,N'Mascarpone Fabioli',14,4,N'24 - 200 g pkgs.',32),
	 (33,N'Geitost',15,4,N'500 g',3),
	 (34,N'Sasquatch Ale',16,1,N'24 - 12 oz bottles',14),
	 (35,N'Steeleye Stout',16,1,N'24 - 12 oz bottles',18),
	 (36,N'Inlagd Sill',17,8,N'24 - 250 g jars',19),
	 (37,N'Gravad lax',17,8,N'12 - 500 g pkgs.',26),
	 (38,N'Côte de Blaye',18,1,N'12 - 75 cl bottles',264),
	 (39,N'Chartreuse verte',18,1,N'750 cc per bottle',18),
	 (40,N'Boston Crab Meat',19,8,N'24 - 4 oz tins',18);
INSERT INTO nlakekitten_SampleDB.dbo.products (ProductID,ProductName,SupplierID,CategoryID,Unit,Price) VALUES
	 (41,N'Jack s New England Clam Chowder',19,8,N'12 - 12 oz cans',10),
	 (42,N'Singaporean Hokkien Fried Mee',20,5,N'32 - 1 kg pkgs.',14),
	 (43,N'Ipoh Coffee',20,1,N'16 - 500 g tins',46),
	 (44,N'Gula Malacca',20,2,N'20 - 2 kg bags',19),
	 (45,N'Røgede sild',21,8,N'1k pkg.',10),
	 (46,N'Spegesild',21,8,N'4 - 450 g glasses',12),
	 (47,N'Zaanse koeken',22,3,N'10 - 4 oz boxes',10),
	 (48,N'Chocolade',22,3,N'10 pkgs.',13),
	 (49,N'Maxilaku',23,3,N'24 - 50 g pkgs.',20),
	 (50,N'Valkoinen suklaa',23,3,N'12 - 100 g bars',16);
INSERT INTO nlakekitten_SampleDB.dbo.products (ProductID,ProductName,SupplierID,CategoryID,Unit,Price) VALUES
	 (51,N'Manjimup Dried Apples',24,7,N'50 - 300 g pkgs.',53),
	 (52,N'Filo Mix',24,5,N'16 - 2 kg boxes',7),
	 (53,N'Perth Pasties',24,6,N'48 pieces',33),
	 (54,N'Tourtière',25,6,N'16 pies',7),
	 (55,N'Pâté chinois',25,6,N'24 boxes x 2 pies',24),
	 (56,N'Gnocchi di nonna Alice',26,5,N'24 - 250 g pkgs.',38),
	 (57,N'Ravioli Angelo',26,5,N'24 - 250 g pkgs.',20),
	 (58,N'Escargots de Bourgogne',27,8,N'24 pieces',13),
	 (59,N'Raclette Courdavault',28,4,N'5 kg pkg.',55),
	 (60,N'Camembert Pierrot',28,4,N'15 - 300 g rounds',34);
INSERT INTO nlakekitten_SampleDB.dbo.products (ProductID,ProductName,SupplierID,CategoryID,Unit,Price) VALUES
	 (61,N'Sirop d érable',29,2,N'24 - 500 ml bottles',29),
	 (62,N'Tarte au sucre',29,3,N'48 pies',49),
	 (63,N'Vegie-spread',7,2,N'15 - 625 g jars',44),
	 (64,N'Wimmers gute Semmelknödel',12,5,N'20 bags x 4 pieces',33),
	 (65,N'Louisiana Fiery Hot Pepper Sauce',2,2,N'32 - 8 oz bottles',21),
	 (66,N'Louisiana Hot Spiced Okra',2,2,N'24 - 8 oz jars',17),
	 (67,N'Laughing Lumberjack Lager',16,1,N'24 - 12 oz bottles',14),
	 (68,N'Scottish Longbreads',8,3,N'10 boxes x 8 pieces',13),
	 (69,N'Gudbrandsdalsost',15,4,N'10 kg pkg.',36),
	 (70,N'Outback Lager',7,1,N'24 - 355 ml bottles',15);
INSERT INTO nlakekitten_SampleDB.dbo.products (ProductID,ProductName,SupplierID,CategoryID,Unit,Price) VALUES
	 (71,N'Fløtemysost',15,4,N'10 - 500 g pkgs.',22),
	 (72,N'Mozzarella di Giovanni',14,4,N'24 - 200 g pkgs.',35),
	 (73,N'Röd Kaviar',17,8,N'24 - 150 g jars',15),
	 (74,N'Longlife Tofu',4,7,N'5 kg pkg.',10),
	 (75,N'Rhönbräu Klosterbier',12,1,N'24 - 0.5 l bottles',8),
	 (76,N'Lakkalikööri',23,1,N'500 ml',18),
	 (77,N'Original Frankfurter grüne Soße',12,2,N'12 boxes',13);
INSERT INTO nlakekitten_SampleDB.dbo.shippers (ShipperID,ShipperName,Phone) VALUES
	 (1,N'Speedy Express',N'(503) 555-9831'),
	 (2,N'United Package',N'(503) 555-3199'),
	 (3,N'Federal Shipping',N'(503) 555-9931');
INSERT INTO nlakekitten_SampleDB.dbo.suppliers (SupplierID,SupplierName,ContactName,Address,City,PostalCode,Country,Phone) VALUES
	 (1,N'Exotic Liquid',N'Charlotte Cooper',N'49 Gilbert St.',N'Londona',N'EC1 4SD',N'UK',N'(171) 555-2222'),
	 (2,N'New Orleans Cajun Delights',N'Shelley Burke',N'P.O. Box 78934',N'New Orleans',N'70117',N'USA',N'(100) 555-4822'),
	 (3,N'Grandma Kelly s Homestead',N'Regina Murphy',N'707 Oxford Rd.',N'Ann Arbor',N'48104',N'USA',N'(313) 555-5735'),
	 (4,N'Tokyo Traders',N'Yoshi Nagase',N'9-8 Sekimai Musashino-shi',N'Tokyo',N'100',N'Japan',N'(03) 3555-5011'),
	 (5,N'Cooperativa de Quesos  Las Cabras ',N'Antonio del Valle Saavedra',N'Calle del Rosal 4',N'Oviedo',N'33007',N'Spain',N'(98) 598 76 54'),
	 (6,N'Mayumi s',N'Mayumi Ohno',N'92 Setsuko Chuo-ku',N'Osaka',N'545',N'Japan',N'(06) 431-7877'),
	 (7,N'Pavlova, Ltd.',N'Ian Devling',N'74 Rose St. Moonie Ponds',N'Melbourne',N'3058',N'Australia',N'(03) 444-2343'),
	 (8,N'Specialty Biscuits, Ltd.',N'Peter Wilson',N'29 King s Way',N'Manchester',N'M14 GSD',N'UK',N'(161) 555-4448'),
	 (9,N'PB Knäckebröd AB',N'Lars Peterson',N'Kaloadagatan 13',N'Göteborg',N'S-345 67',N'Sweden',N'031-987 65 43'),
	 (10,N'Refrescos Americanas LTDA',N'Carlos Diaz',N'Av. das Americanas 12.890',N'São Paulo',N'5442',N'Brazil',N'(11) 555 4640');
INSERT INTO nlakekitten_SampleDB.dbo.suppliers (SupplierID,SupplierName,ContactName,Address,City,PostalCode,Country,Phone) VALUES
	 (11,N'Heli Süßwaren GmbH & Co. KG',N'Petra Winkler',N'Tiergartenstraße 5',N'Berlin',N'10785',N'Germany',N'(010) 9984510'),
	 (12,N'Plutzer Lebensmittelgroßmärkte AG',N'Martin Bein',N'Bogenallee 51',N'Frankfurt',N'60439',N'Germany',N'(069) 992755'),
	 (13,N'Nord-Ost-Fisch Handelsgesellschaft mbH',N'Sven Petersen',N'Frahmredder 112a',N'Cuxhaven',N'27478',N'Germany',N'(04721) 8713'),
	 (14,N'Formaggi Fortini s.r.l.',N'Elio Rossi',N'Viale Dante, 75',N'Ravenna',N'48100',N'Italy',N'(0544) 60323'),
	 (15,N'Norske Meierier',N'Beate Vileid',N'Hatlevegen 5',N'Sandvika',N'1320',N'Norway',N'(0)2-953010'),
	 (16,N'Bigfoot Breweries',N'Cheryl Saylor',N'3400 - 8th Avenue Suite 210',N'Bend',N'97101',N'USA',N'(503) 555-9931'),
	 (17,N'Svensk Sjöföda AB',N'Michael Björn',N'Brovallavägen 231',N'Stockholm',N'S-123 45',N'Sweden',N'08-123 45 67'),
	 (18,N'Aux joyeux ecclésiastiques',N'Guylène Nodier',N'203, Rue des Francs-Bourgeois',N'Paris',N'75004',N'France',N'(1) 03.83.00.68'),
	 (19,N'New England Seafood Cannery',N'Robb Merchant',N'Order Processing Dept. 2100 Paul Revere Blvd.',N'Boston',N'02134',N'USA',N'(617) 555-3267'),
	 (20,N'Leka Trading',N'Chandra Leka',N'471 Serangoon Loop, Suite #402',N'Singapore',N'0512',N'Singapore',N'555-8787');
INSERT INTO nlakekitten_SampleDB.dbo.suppliers (SupplierID,SupplierName,ContactName,Address,City,PostalCode,Country,Phone) VALUES
	 (21,N'Lyngbysild',N'Niels Petersen',N'Lyngbysild Fiskebakken 10',N'Lyngby',N'2800',N'Denmark',N'43844108'),
	 (22,N'Zaanse Snoepfabriek',N'Dirk Luchte',N'Verkoop Rijnweg 22',N'Zaandam',N'9999 ZZ',N'Netherlands',N'(12345) 1212'),
	 (23,N'Karkki Oy',N'Anne Heikkonen',N'Valtakatu 12',N'Lappeenranta',N'53120',N'Finland',N'(953) 10956'),
	 (24,N'G day, Mate',N'Wendy Mackenzie',N'170 Prince Edward Parade Hunter s Hill',N'Sydney',N'2042',N'Australia',N'(02) 555-5914'),
	 (25,N'Ma Maison',N'Jean-Guy Lauzon',N'2960 Rue St. Laurent',N'Montréal',N'H1J 1C3',N'Canada',N'(514) 555-9022'),
	 (26,N'Pasta Buttini s.r.l.',N'Giovanni Giudici',N'Via dei Gelsomini, 153',N'Salerno',N'84100',N'Italy',N'(089) 6547665'),
	 (27,N'Escargots Nouveaux',N'Marie Delamare',N'22, rue H. Voiron',N'Montceau',N'71300',N'France',N'85.57.00.07'),
	 (28,N'Gai pâturage',N'Eliane Noz',N'Bat. B 3, rue des Alpes',N'Annecy',N'74000',N'France',N'38.76.98.06'),
	 (29,N'Forêts d érables',N'Chantal Goulet',N'148 rue Chasseur',N'Ste-Hyacinthe',N'J2S 7S8',N'Canada',N'(514) 555-2955');
