CREATE DATABASE IF NOT EXISTS `UserManagement`;
USE `UserManagement`;

CREATE TABLE IF NOT EXISTS `user_account`(
    `uId` INT UNSIGNED AUTO_INCREMENT KEY,                  -- user id
    `uName` VARCHAR(40) NOT NULL UNIQUE,                    -- username
    'uPlace' INT UNSIGNED,                                  -- living place: table-living_place
    `uGender` CHAR(1) NOT NULL,                             -- gender
    `uPassword` VARCHAR(40) NOT NULL,                       -- password
    `uEMail` VARCHAR(50) NOT NULL UNIQUE,                   -- email
    'uPhoneNum' VARCHAR(20) UNIQUE,                         -- phone number
    `uRegDate` VARCHAR(10) NOT NULL                         -- registration date
);

CREATE TABLE IF NOT EXISTS `living_place` (
    `id` INT UNSIGNED NOT NULL auto_increment,
    `address` VARCHAR(20) COLLATE NOT NULL,
    `road` VARCHAR(64) COLLATE NOT NULL,
    `distinct` VARCHAR(64) COLLATE NOT NULL,
    `city` VARCHAR(64) COLLATE utf8_unicode_ci NOT NULL,
    `state` VARCHAR(64) COLLATE utf8_unicode_ci NOT NULL,
    `nation` VARCHAR(64) COLLATE NOT NULL,
    `zip` MEDIUMINT(8) UNSIGNED NOT NULL
);

# CREATE TABLE IF NOT EXISTS ‘Education_carrer’ (
#     'id' INT UNSIGNED NOT NULL auto_increment,
#     'Bachelor_school' VARCHAR(64),
#     'Bachelor_major' VARCHAR(64),
#     'master_school' VARCHAR(64),
#     'master_major' VARCHAR(64),
#     'phd_school' VARCHAR(64),
#     'phd_major' VARCHAR(64)
# );

CREATE DATABASE IF NOT EXISTS `OrganizationManagement`;
USE `OrganizationManagement`;

CREATE DATABASE IF NOT EXISTS `TaskManagement`;
USE `TaskManagement`;

CREATE DATABASE IF NOT EXISTS `SkillManagement`;
USE `SkillManagement`;

CREATE DATABASE IF NOT EXISTS `MaterialManagement`;
USE `MaterialManagement`;