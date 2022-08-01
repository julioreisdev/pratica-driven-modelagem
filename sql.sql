CREATE TABLE users (
	id SERIAL PRIMARY KEY,
	name VARCHAR(50) NOT NULL,
	email TEXT NOT NULL UNIQUE,
	password TEXT NOT NULL
);

CREATE TABLE products (
	id SERIAL PRIMARY KEY,
	name VARCHAR(50) NOT NULL,
	price INTEGER NOT NULL,
	"imageUrl" TEXT NOT NULL
);
CREATE TYPE "categoryType" AS ENUM ('social', 'jeans', 'infantil');
CREATE TYPE "sizeProduct" AS ENUM ('P', 'M', 'G', 'GG');
CREATE TABLE dataproduct (
	id SERIAL PRIMARY KEY,
	"productId" INTEGER NOT NULL REFERENCES products(id),
	category "categoryType" NOT NULL,
	size "sizeProduct" NOT NULL
);

CREATE TABLE images (
	id SERIAL PRIMARY KEY,
	"productId" INTEGER NOT NULL REFERENCES products(id),
	"imageUrl" TEXT NOT NULL
);

--VAI FICAR UMA LINHA PRA CADA PRODUTO COMPRADO
CREATE TYPE "purchaseStatus" AS ENUM ('criada', 'paga', 'entregue', 'cancelada');
CREATE TABLE purchase (
	id SERIAL PRIMARY KEY,
	"productId" INTEGER NOT NULL REFERENCES products(id),
	"userId" INTEGER NOT NULL REFERENCES users(id),
	amount INTEGER NOT NULL,
	value INTEGER NOT NULL,
	type "purchaseStatus" NOT NULL,
	date DATE NOT NULL DEFAULT NOW(),
	addresess TEXT NOT NULL
);

