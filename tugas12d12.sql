
-----insert user part 3 realase 1 H
INSERT INTO users(name,gender,status)
VALUES("fajar","M","Active");

INSERT INTO users(name,gender,status)
VALUES("rizky","M","Active")

INSERT INTO users(name,gender,status)
VALUES("bianca","F","Active")

INSERT INTO users(name,gender,status)
VALUES("lilis","F","Active")

INSERT INTO users(name,gender,status)
VALUES("jaki","M","Active")


-----insert operators part 3 realase 1 A
INSERT INTO operators(nama_operator)
VALUES("IM3")

INSERT INTO operators(nama_operator)
VALUES("Simpati")

INSERT INTO operators(nama_operator)
VALUES("Esia")

INSERT INTO operators(nama_operator)
VALUES("mentari")

INSERT INTO operators(nama_operator)
VALUES("flexi")

-----insert product_type part 3 realase 1 B
INSERT INTO product_type(kategori)
VALUES("Pulsa")

INSERT INTO product_type(kategori)
VALUES("Elektronik")

INSERT INTO product_type(kategori)
VALUES("Pakaian")

-----insert product part 3 realase 1 C
INSERT INTO products(nama, price, id_product_type,id_operator)
VALUES("Pulsa elektrik",20000,1,3)

INSERT INTO products(nama, price, id_product_type,id_operator)
VALUES("Pulsa elektrik",30000,1,3)

-----insert product part 3 realase 1 D
INSERT INTO products(nama, price, id_product_type,id_operator)
VALUES("XIAOMI",20000,2,1)

INSERT INTO products(nama, price, id_product_type,id_operator)
VALUES("ADVAN",30000,2,1)

INSERT INTO products(nama, price, id_product_type,id_operator)
VALUES("SAMSUNG A10",30000,2,1)

-----insert product part 3 realase 1 E
INSERT INTO products(nama, price, id_product_type,id_operator)
VALUES("Baju FLEXI CORAK",20000,3,4)

INSERT INTO products(nama, price, id_product_type,id_operator)
VALUES("Baju Batik Flexi",30000,3,4)

INSERT INTO products(nama, price, id_product_type,id_operator)
VALUES("baju kaos flexi",30000,3,4)


-----insert product part 3 realase 1 F
INSERT INTO product_description(id_product,description)
VALUES(1,"pulsa elektrik 20000")

INSERT INTO product_description(id_product,description)
VALUES(2,"pulsa elektrik paket 20000")

INSERT INTO product_description(id_product,description)
VALUES(3,"hp mainan xiaomi")

INSERT INTO product_description(id_product,description)
VALUES(4,"hp mainan advan")

INSERT INTO product_description(id_product,description)
VALUES(5,"hp mainan samsung")

INSERT INTO product_description(id_product,description)
VALUES(6,"baju corak flexi yahut")

INSERT INTO product_description(id_product,description)
VALUES(7,"baju batik flexi yahut")

INSERT INTO product_description(id_product,description)
VALUES(8,"baju kaos flexi yahut")

-----insert product part 3 realase 1 g
INSERT INTO payment_method(name)
VALUES("gopay")

INSERT INTO payment_method(name)
VALUES("dana")

INSERT INTO payment_method(name)
VALUES("bca")


-----insert product part 3 realase 1 i
INSERT INTO transactions(user_id,total_qty,total_transaksi,tanggal_transaksi,id_payment_method)
VALUES(1,3,90000,2022-11-10,1)

INSERT INTO transactions(user_id,total_qty,total_transaksi,tanggal_transaksi,id_payment_method)
VALUES(2,4,120000,2022-11-10,1)

INSERT INTO transactions(user_id,total_qty,total_transaksi,tanggal_transaksi,id_payment_method)
VALUES(3,2,60000,2022-11-10,1)

INSERT INTO detail_transaksi(id_transksi,id_produk,price,qty)
VALUES(1,5,30000,3)

INSERT INTO detail_transaksi(id_transksi,id_produk,price,qty)
VALUES(2,4,30000,4)

INSERT INTO detail_transaksi(id_transksi,id_produk,price,qty)
VALUES(3,7,30000,2)




----- part 3 realase 2a

SELECT* from users WHERE gender ="M" OR gender ="f"
---- part 3 realase 2b

SELECT* from products WHERE id = 3

---- part 3 realase 2c

SELECT * from users WHERE name LIKE "%a%" and create_at <=now() and create_at>=2022-11-01 

---- part 3 realase 2D

SELECT COUNT(id) AS total
FROM users
WHERE gender = "F"

---  part 3 realase 2E

SELECT*FROM users ORDER BY name asc


---  part 3 realase 2f
SELECT MAX(id_produk)
FROM detail_transaksi
WHERE id_produk=3;

---  part 3 realase 3a
UPDATE products set
nama ="dummy"
WHERE id = 1

UPDATE detail_transaksi set
qty = 3
WHERE id_produk = 7



---  part 3 realase 4a
DELETE FROM products WHERE id = 1


---  part 3 realase 4b
DELETE FROM products WHERE id_product_type = 1


 ---  part 3 realase 2.1
   SELECT users.name, transactions.total_qty ,transactions.total_transaksi FROM transactions
    INNER JOIN detail_transaksi on  detail_transaksi.id_transaksi =   transactions.id
    INNER JOIN users on  users.id =   transactions.user_id
    WHERE transactions.user_id =1 OR transactions.user_id =2


 ---  part 3 realase 2.2
SELECT transactions.user_id,  transactions.total_transaksi FROM transactions
INNER JOIN users on users.id = transactions.user_id
WHERE transactions.user_id =1
GROUP BY transactions.user_id

-- ---  part 3 realase 2.3
SELECT detail_transaksi.id_produk, detail_transaksi.id_transaksi,detail_transaksi.price FROM detail_transaksi
INNER JOIN products on products.id =   detail_transaksi.id_produk
WHERE  products.id_product_type =2

-- ---  part 3 realase 2.4
SELECT * FROM products
RIGHT JOIN product_type on  product_type.id =   products.id_product_type


-- ---  part 3 realase 2.5
  SELECT * FROM transactions
    LEFT JOIN  detail_transaksi on transactions.id  =   detail_transaksi.id_transaksi 
   RIGHT join     users on  users.id =   transactions.user_id
   inner JOIN products on products.id = detail_transaksi.id_produk


-- ---  part 3 realase 2.8

SELECT*FROM products WHERE id NOT IN(SELECT DISTINCT id_produk from detail_transaksi)


SELECT*FROM detail_transaksi