-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 07, 2022 at 12:45 AM
-- Server version: 10.1.32-MariaDB
-- PHP Version: 5.6.36

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `assignment`
--

-- --------------------------------------------------------

--
-- Table structure for table `archive`
--

CREATE TABLE `archive` (
  `id` int(11) NOT NULL,
  `createdAt` bigint(20) DEFAULT NULL,
  `fromModel` varchar(255) DEFAULT NULL,
  `originalRecord` longtext,
  `originalRecordId` longtext
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `questions_predifined_answers`
--

CREATE TABLE `questions_predifined_answers` (
  `id` int(11) NOT NULL,
  `category` varchar(255) DEFAULT NULL,
  `answers` longtext
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `questions_predifined_answers`
--

INSERT INTO `questions_predifined_answers` (`id`, `category`, `answers`) VALUES
(1, 'AGE_AND_JOB', '[{\"age_range\":13,\"job_status\":1,\"questions\":[\"Assignment Submissions Deadlines\",\"Having Low Scores to Subjects\",\"Mental Stress Due To Exams\"]},{\"age_range\":20,\"job_status\":1,\"questions\":[\"Assignment Submissions Deadlines\",\"Having Low Scores to Subjects\",\"Low O/L,A/L Results Depression\",\"Lack Of Hire Education Opportunities\"]},{\"age_range\":20,\"job_status\":2,\"questions\":[\"Workplace Problems\",\"Business Problems\"]},{\"age_range\":20,\"job_status\":3,\"questions\":[\"Unemployed Looking For Jobs\",\"Business Problems\",\"Preparing To Start An Own Business\",\"Unemployed And Uneducated With No Plan\"]},{\"age_range\":30,\"job_status\":1,\"questions\":[\"Assignment Submissions Deadlines\",\"Having Low Scores to Subjects\",\"Lack Of Hire Education Opportunities\",\"Problems About Higher Studies\",\"Problems About Paying Tution Fees For Higher Studies\",\"Finding Job Internship\"]},{\"age_range\":30,\"job_status\":2,\"questions\":[\"Finding Job Internship\",\"Searching Job Vaccancies For DreamJob\",\"How To Find Opportunity To The DreamJob\",\"Lack Of Salary\",\"Lack Of Increment\",\"Workplace Problems\",\"Thinking About Shifting Job Place/Job Position\",\"Issues Related To Immigration\"]},{\"age_range\":30,\"job_status\":3,\"questions\":[\"Unemployed Looking For Jobs\",\"Business Problems\",\"Preparing To Start An Own Business\",\"Unemployed And Uneducated With No Plan\"]},{\"age_range\":40,\"job_status\":1,\"questions\":[\"Assignment Submissions Deadlines\",\"Having Low Scores to Subjects\",\"Lack Of Hire Education Opportunities\",\"Problems About Higher Studies\",\"Problems About Paying Tution Fees For Higher Studies\",\"Finding Job Internship\",\"Thnking To Start A Startup Company\"]},{\"age_range\":40,\"job_status\":2,\"questions\":[\"Searching Job Vaccancies For DreamJob\",\"Lack Of Salary\",\"Lack Of Increment\",\"Workplace Problems\",\"Getting Promotion In Current Job\",\"Issues Related To Immigration\",\"Thnking To Start A Startup Company\"]},{\"age_range\":40,\"job_status\":3,\"questions\":[\"Unemployed Looking For Jobs\",\"Business Problems\",\"Preparing To Start An Own Business\",\"Unemployed And Uneducated With No Plan\"]},{\"age_range\":50,\"questions\":[\"Lack Of Salary\",\"Lack Of Increment\",\"Workplace Problems\",\"Change Workplace Problems\",\"Getting Promotion In Current Job\",\"Business Problems\"]},{\"age_range\":60,\"questions\":[\"Getting Retired\",\"Making Retirement Plans\",\"Health Problems\",\"Business Problems\"]}]'),
(2, 'CIVIL_STATUS', '[{\"civil_status\":2,\"questions\":[\"Matters In The Relationship\",\"Partner\'s Problems\",\"Family Problems Of The Both Sides\",\"Thinking About Marriage And How To Propose\"]},{\"civil_status\":3,\"questions\":[\"Matters In The Relationship\",\"Partner\'s Problems\",\"Family Problems Of The Both Sides\",\"Thinking About Marriage And How To Propose\",\"Expecting a child\",\"Child\'s School Matters\",\"Child\'s Health Issues\"]}]'),
(3, 'FOOD_TYPE', '[{\"food_type\":2,\"questions\":[\"Health Problems\",\"Over Weight Problems\"]},{\"food_type\":3,\"questions\":[\"Lower Nutrition\",\"Weight Loss Problems\",\"Cost Of buying Additional Vitamins, Proteins\"]}]'),
(4, 'DEPENDANT', '[{\"is_dependants_available\":true,\"questions\":[\"Survival Problems\",\"Market Price For Essential Goods\",\"Bill Payments\",\"Increment Of Utility Cost\"]}]');

-- --------------------------------------------------------

--
-- Table structure for table `question_answers`
--

CREATE TABLE `question_answers` (
  `id` int(11) NOT NULL,
  `user_id` double DEFAULT NULL,
  `save_name` varchar(255) DEFAULT NULL,
  `answer` longtext
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `question_answers`
--

INSERT INTO `question_answers` (`id`, `user_id`, `save_name`, `answer`) VALUES
(1, 1, 'save 1', '{\"age\":\"50\",\"civil_status\":1,\"food_type\":1,\"job_status\":1,\"number_of_dependants\":2,\"questions\":[\"Getting Retired\",\"Making Retirement Plans\",\"Health Problems\",\"Business Problems\",\"Survival Problems\",\"Market Price For Essential Goods\",\"Bill Payments\",\"Increment Of Utility Cost\"]}');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `name`, `email`, `password`) VALUES
(1, 'test', 'test@gmail.com', '$2b$10$kJxH99KZ/xFFmvMop.RsOOfQ7d5TynoBVo7fZUtfJoVGSJLKVAVM6'),
(2, 'testing', 'test1@gmail.com', '$2b$10$vPPoORmDu/RFnhBaLUJfxOlDWI2tY9KiT5e2sVdH7JmOeWCR24jhq');

-- --------------------------------------------------------

--
-- Table structure for table `user_question_answers`
--

CREATE TABLE `user_question_answers` (
  `id` int(11) NOT NULL,
  `user_id` double DEFAULT NULL,
  `answer` longtext
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `archive`
--
ALTER TABLE `archive`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `questions_predifined_answers`
--
ALTER TABLE `questions_predifined_answers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `question_answers`
--
ALTER TABLE `question_answers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `user_question_answers`
--
ALTER TABLE `user_question_answers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `archive`
--
ALTER TABLE `archive`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `questions_predifined_answers`
--
ALTER TABLE `questions_predifined_answers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `question_answers`
--
ALTER TABLE `question_answers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user_question_answers`
--
ALTER TABLE `user_question_answers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
