-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 04, 2020 at 01:12 PM
-- Server version: 10.1.31-MariaDB
-- PHP Version: 7.2.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `carpool`
--

-- --------------------------------------------------------

--
-- Table structure for table `rides_proposals`
--

CREATE TABLE `rides_proposals` (
  `rider_id` decimal(10,0) NOT NULL,
  `r_id` int(10) DEFAULT NULL,
  `_pp_id` int(10) DEFAULT NULL,
  `Status` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rides_proposals`
--

INSERT INTO `rides_proposals` (`rider_id`, `r_id`, `_pp_id`, `Status`) VALUES
('7692891969', 20, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ride_info_offered`
--

CREATE TABLE `ride_info_offered` (
  `r_id` int(10) NOT NULL,
  `dri_u_id` decimal(10,0) NOT NULL,
  `r_date` date NOT NULL,
  `from_loc` varchar(255) DEFAULT NULL,
  `to_college` varchar(255) DEFAULT NULL,
  `from_time` varchar(255) DEFAULT NULL,
  `reach_time` varchar(255) DEFAULT NULL,
  `num_seats` int(10) DEFAULT NULL,
  `extras` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ride_info_offered`
--

INSERT INTO `ride_info_offered` (`r_id`, `dri_u_id`, `r_date`, `from_loc`, `to_college`, `from_time`, `reach_time`, `num_seats`, `extras`) VALUES
(20, '7692891969', '0000-00-00', 'Bhaverkua', 'Aitr', '9:30', '10:15', 2, 0);

-- --------------------------------------------------------

--
-- Table structure for table `ride_pick_points`
--

CREATE TABLE `ride_pick_points` (
  `_pp_id` int(11) NOT NULL,
  `r_id` int(10) NOT NULL,
  `pick_point` varchar(255) NOT NULL,
  `pick_point_time` varchar(255) NOT NULL,
  `pick_price` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ride_pick_points`
--

INSERT INTO `ride_pick_points` (`_pp_id`, `r_id`, `pick_point`, `pick_point_time`, `pick_price`) VALUES
(1, 20, 'Bhaverkua', '9:30', 100),
(2, 20, 'World cup square', '9:30', 50),
(3, 20, 'Best Price', '10:05', 25);

-- --------------------------------------------------------

--
-- Table structure for table `user_details`
--

CREATE TABLE `user_details` (
  `u_id` decimal(10,0) NOT NULL,
  `u_name` varchar(255) NOT NULL,
  `u_email` varchar(255) NOT NULL,
  `u_college` varchar(255) DEFAULT NULL,
  `u_dob` varchar(255) DEFAULT NULL,
  `u_sex` varchar(255) NOT NULL,
  `u_pass` varchar(255) NOT NULL,
  `u_enroll` varchar(255) DEFAULT NULL,
  `u_fb` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_details`
--

INSERT INTO `user_details` (`u_id`, `u_name`, `u_email`, `u_college`, `u_dob`, `u_sex`, `u_pass`, `u_enroll`, `u_fb`) VALUES
('7692891969', 'Kishan Santlani', 'acroprograming@gmail.com', 'Aitr', '23', 'M', '12345678', '50', ' ');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `rides_proposals`
--
ALTER TABLE `rides_proposals`
  ADD KEY `can propose` (`rider_id`);

--
-- Indexes for table `ride_info_offered`
--
ALTER TABLE `ride_info_offered`
  ADD PRIMARY KEY (`r_id`),
  ADD KEY `can offer rides` (`dri_u_id`);

--
-- Indexes for table `ride_pick_points`
--
ALTER TABLE `ride_pick_points`
  ADD PRIMARY KEY (`_pp_id`),
  ADD KEY `has` (`r_id`);

--
-- Indexes for table `user_details`
--
ALTER TABLE `user_details`
  ADD PRIMARY KEY (`u_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ride_info_offered`
--
ALTER TABLE `ride_info_offered`
  MODIFY `r_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `ride_pick_points`
--
ALTER TABLE `ride_pick_points`
  MODIFY `_pp_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `rides_proposals`
--
ALTER TABLE `rides_proposals`
  ADD CONSTRAINT `can propose` FOREIGN KEY (`rider_id`) REFERENCES `user_details` (`u_id`);

--
-- Constraints for table `ride_info_offered`
--
ALTER TABLE `ride_info_offered`
  ADD CONSTRAINT `can offer rides` FOREIGN KEY (`dri_u_id`) REFERENCES `user_details` (`u_id`);

--
-- Constraints for table `ride_pick_points`
--
ALTER TABLE `ride_pick_points`
  ADD CONSTRAINT `has` FOREIGN KEY (`r_id`) REFERENCES `ride_info_offered` (`r_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
