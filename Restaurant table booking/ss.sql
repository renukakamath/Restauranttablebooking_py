/*
SQLyog Ultimate v11.11 (64 bit)
MySQL - 5.7.9 : Database - restaurant_table_booking
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`restaurant_table_booking` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `restaurant_table_booking`;

/*Table structure for table `booking` */

DROP TABLE IF EXISTS `booking`;

CREATE TABLE `booking` (
  `Booking_id` int(11) NOT NULL AUTO_INCREMENT,
  `Customer_id` int(11) DEFAULT NULL,
  `Category_id` int(11) DEFAULT NULL,
  `Menu_id` int(11) DEFAULT NULL,
  `Timeslot_id` int(11) DEFAULT NULL,
  `Table_id` int(11) DEFAULT NULL,
  `Total` varchar(100) DEFAULT NULL,
  `Date` varchar(100) DEFAULT NULL,
  `time` varchar(100) DEFAULT NULL,
  `Status` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Booking_id`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;

/*Data for the table `booking` */

insert  into `booking`(`Booking_id`,`Customer_id`,`Category_id`,`Menu_id`,`Timeslot_id`,`Table_id`,`Total`,`Date`,`time`,`Status`) values (24,1,1,0,0,1,'0','2023-02-08','07:26','1'),(23,1,1,0,0,1,'0','2023-02-08','07:26','1'),(22,1,1,0,0,3,'0','2023-02-21','18:10','1'),(21,1,1,0,0,1,'0','2023-02-16','17:10','1'),(20,1,1,0,0,1,'0','','','1'),(19,1,1,0,0,2,'0','2023-02-16','15:46','1'),(18,1,1,0,0,2,'0','2023-02-16','15:46','1');

/*Table structure for table `bookmenu` */

DROP TABLE IF EXISTS `bookmenu`;

CREATE TABLE `bookmenu` (
  `Bookmenu_id` int(11) NOT NULL AUTO_INCREMENT,
  `Booking_id` int(11) DEFAULT NULL,
  `Menu_id` int(11) DEFAULT NULL,
  `Noofquantity` varchar(100) DEFAULT NULL,
  `Amount` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Bookmenu_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `bookmenu` */

/*Table structure for table `card` */

DROP TABLE IF EXISTS `card`;

CREATE TABLE `card` (
  `Card_id` int(11) NOT NULL AUTO_INCREMENT,
  `Customer_id` int(11) DEFAULT NULL,
  `Card_no` varchar(100) DEFAULT NULL,
  `Card_name` varchar(100) DEFAULT NULL,
  `Expiry_date` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Card_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `card` */

insert  into `card`(`Card_id`,`Customer_id`,`Card_no`,`Card_name`,`Expiry_date`) values (1,1,'1234567','ewe','2023-12');

/*Table structure for table `category` */

DROP TABLE IF EXISTS `category`;

CREATE TABLE `category` (
  `Category_id` int(11) NOT NULL AUTO_INCREMENT,
  `Category` varchar(100) DEFAULT NULL,
  `Status` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Category_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `category` */

insert  into `category`(`Category_id`,`Category`,`Status`) values (1,'ghgj','1');

/*Table structure for table `complaint` */

DROP TABLE IF EXISTS `complaint`;

CREATE TABLE `complaint` (
  `Complaint_id` int(11) NOT NULL AUTO_INCREMENT,
  `Customer_id` int(11) DEFAULT NULL,
  `Complaint` varchar(100) DEFAULT NULL,
  `Reply` varchar(100) DEFAULT NULL,
  `Date` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Complaint_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `complaint` */

/*Table structure for table `customer` */

DROP TABLE IF EXISTS `customer`;

CREATE TABLE `customer` (
  `Customer_id` int(11) NOT NULL AUTO_INCREMENT,
  `Username` varchar(100) DEFAULT NULL,
  `Customer_fname` varchar(100) DEFAULT NULL,
  `Customer_lname` varchar(100) DEFAULT NULL,
  `Customer_phone` varchar(100) DEFAULT NULL,
  `Customer_email` varchar(100) DEFAULT NULL,
  `Customer_status` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Customer_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `customer` */

insert  into `customer`(`Customer_id`,`Username`,`Customer_fname`,`Customer_lname`,`Customer_phone`,`Customer_email`,`Customer_status`) values (1,'anna','anna','elsa','12345678967','anna@gmail.com','1');

/*Table structure for table `extraservice` */

DROP TABLE IF EXISTS `extraservice`;

CREATE TABLE `extraservice` (
  `Extraservice_id` int(11) NOT NULL AUTO_INCREMENT,
  `Extraservice_name` varchar(100) DEFAULT NULL,
  `Description` varchar(100) DEFAULT NULL,
  `Price` int(11) DEFAULT NULL,
  PRIMARY KEY (`Extraservice_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `extraservice` */

insert  into `extraservice`(`Extraservice_id`,`Extraservice_name`,`Description`,`Price`) values (1,'cool drinks','cools',NULL),(2,'asdf','dfgh',54),(3,'asdf','dfghjk',54);

/*Table structure for table `extraservice_booked` */

DROP TABLE IF EXISTS `extraservice_booked`;

CREATE TABLE `extraservice_booked` (
  `Extraservicebooked_id` int(11) NOT NULL AUTO_INCREMENT,
  `Extraservice_id` int(11) DEFAULT NULL,
  `Booking_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`Extraservicebooked_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `extraservice_booked` */

insert  into `extraservice_booked`(`Extraservicebooked_id`,`Extraservice_id`,`Booking_id`) values (3,1,1),(2,1,1);

/*Table structure for table `login` */

DROP TABLE IF EXISTS `login`;

CREATE TABLE `login` (
  `Username` varchar(100) NOT NULL,
  `Password` varchar(100) DEFAULT NULL,
  `Usertype` varchar(100) DEFAULT NULL,
  `User_status` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Username`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `login` */

insert  into `login`(`Username`,`Password`,`Usertype`,`User_status`) values ('admin','admin','admin','1'),('anju','anju','staff','1'),('anna','anna','customer','1');

/*Table structure for table `menu` */

DROP TABLE IF EXISTS `menu`;

CREATE TABLE `menu` (
  `Menu_id` int(11) NOT NULL AUTO_INCREMENT,
  `Category_id` int(11) DEFAULT NULL,
  `Menu` varchar(100) DEFAULT NULL,
  `Rate` varchar(100) DEFAULT NULL,
  `image` varchar(1000) DEFAULT NULL,
  `M_status` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Menu_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `menu` */

insert  into `menu`(`Menu_id`,`Category_id`,`Menu`,`Rate`,`image`,`M_status`) values (1,1,'biryani','150',NULL,'1'),(2,1,'asd','as','static/images/57f63baf-8882-4184-ab1e-3e30f3615154Activity college admission.jpg','1');

/*Table structure for table `payment` */

DROP TABLE IF EXISTS `payment`;

CREATE TABLE `payment` (
  `Payment_id` int(11) NOT NULL AUTO_INCREMENT,
  `Booking_id` int(11) DEFAULT NULL,
  `Card_id` int(11) DEFAULT NULL,
  `Amount` varchar(100) DEFAULT NULL,
  `Date` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Payment_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `payment` */

insert  into `payment`(`Payment_id`,`Booking_id`,`Card_id`,`Amount`,`Date`) values (1,1,3,'SD','2023-01-10');

/*Table structure for table `staff` */

DROP TABLE IF EXISTS `staff`;

CREATE TABLE `staff` (
  `Staff_id` int(11) NOT NULL AUTO_INCREMENT,
  `Username` varchar(100) DEFAULT NULL,
  `Staff_fname` varchar(100) DEFAULT NULL,
  `Staff_lname` varchar(100) DEFAULT NULL,
  `Staff_mobile` varchar(100) DEFAULT NULL,
  `Staff_email` varchar(100) DEFAULT NULL,
  `Staff_city` varchar(100) DEFAULT NULL,
  `Staff_status` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Staff_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `staff` */

insert  into `staff`(`Staff_id`,`Username`,`Staff_fname`,`Staff_lname`,`Staff_mobile`,`Staff_email`,`Staff_city`,`Staff_status`) values (1,'anju','anna','elsa','12345678967','frozen','Ernakulam','1');

/*Table structure for table `tables` */

DROP TABLE IF EXISTS `tables`;

CREATE TABLE `tables` (
  `Table_id` int(11) NOT NULL AUTO_INCREMENT,
  `Table_num` varchar(100) DEFAULT NULL,
  `Table_category` varchar(100) DEFAULT NULL,
  `Table_status` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Table_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `tables` */

insert  into `tables`(`Table_id`,`Table_num`,`Table_category`,`Table_status`) values (1,'sss','aa','booked'),(2,'12','fffg','booked'),(3,'2','fffg','booked');

/*Table structure for table `timeslot` */

DROP TABLE IF EXISTS `timeslot`;

CREATE TABLE `timeslot` (
  `Timeslot_id` int(11) NOT NULL AUTO_INCREMENT,
  `Date` varchar(100) DEFAULT NULL,
  `Time` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Timeslot_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `timeslot` */

insert  into `timeslot`(`Timeslot_id`,`Date`,`Time`) values (1,'2023-01-18','22:50');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
