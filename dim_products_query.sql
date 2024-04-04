USE classic_dw;

DROP TABLE IF EXISTS dim_products;

CREATE TABLE `dim_products` (
  `productCode` varchar(15) NOT NULL,
  `productName` varchar(70) NOT NULL,
  `productLine` varchar(50) NOT NULL,
  `productScale` varchar(10) NOT NULL,
  `productVendor` varchar(50) NOT NULL,
  `productDescription` text NOT NULL,
  `quantityInStock` smallint NOT NULL,
  `buyPrice` decimal(10,2) NOT NULL,
  `MSRP` decimal(10,2) NOT NULL,
  PRIMARY KEY (`productCode`),
  KEY `productLine` (`productLine`)
 # CONSTRAINT `products_ibfk_1` FOREIGN KEY (`productLine`) REFERENCES `productlines` (`productLine`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `classic_dw`.`dim_products`
(`productCode`,
`productName`,
`productLine`,
`productScale`,
`productVendor`,
`productDescription`,
`quantityInStock`,
`buyPrice`,
`MSRP`)
SELECT `products`.`productCode`,
    `products`.`productName`,
    `products`.`productLine`,
    `products`.`productScale`,
    `products`.`productVendor`,
    `products`.`productDescription`,
    `products`.`quantityInStock`,
    `products`.`buyPrice`,
    `products`.`MSRP`
FROM `classicmodels`.`products`;

