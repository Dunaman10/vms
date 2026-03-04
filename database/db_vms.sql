-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Mar 04, 2026 at 10:16 AM
-- Server version: 8.0.43
-- PHP Version: 8.3.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_vms`
--

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `id` bigint UNSIGNED NOT NULL,
  `admin_id` bigint UNSIGNED NOT NULL,
  `vehicle_id` bigint UNSIGNED NOT NULL,
  `driver_id` bigint UNSIGNED NOT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `purpose` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `approved_l1_id` bigint UNSIGNED DEFAULT NULL,
  `approved_l2_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bookings`
--

INSERT INTO `bookings` (`id`, `admin_id`, `vehicle_id`, `driver_id`, `start_date`, `end_date`, `purpose`, `status`, `approved_l1_id`, `approved_l2_id`, `created_at`, `updated_at`) VALUES
(4, 1, 1, 1, '2026-03-04 00:00:00', '2026-03-05 00:00:00', 'Angkut Orang', 'approved_l2', 2, 3, '2026-03-04 02:49:43', '2026-03-04 02:50:45'),
(5, 1, 2, 2, '2026-03-06 00:00:00', '2026-03-07 00:00:00', 'Angkutan Barang', 'approved_l1', 2, 3, '2026-03-04 03:06:06', '2026-03-04 03:09:05');

-- --------------------------------------------------------

--
-- Table structure for table `booking_approvals`
--

CREATE TABLE `booking_approvals` (
  `id` bigint UNSIGNED NOT NULL,
  `booking_id` bigint UNSIGNED NOT NULL,
  `approver_id` bigint UNSIGNED NOT NULL,
  `level` int NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notes` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `booking_approvals`
--

INSERT INTO `booking_approvals` (`id`, `booking_id`, `approver_id`, `level`, `status`, `notes`, `created_at`, `updated_at`) VALUES
(2, 4, 2, 1, 'approved', NULL, '2026-03-04 02:50:09', '2026-03-04 02:50:09'),
(3, 4, 3, 2, 'approved', NULL, '2026-03-04 02:50:45', '2026-03-04 02:50:45'),
(4, 5, 2, 1, 'approved', NULL, '2026-03-04 03:09:05', '2026-03-04 03:09:05');

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cache`
--

INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
('laravel-cache-boost.roster.scan', 'a:2:{s:6:\"roster\";O:21:\"Laravel\\Roster\\Roster\":3:{s:13:\"\0*\0approaches\";O:29:\"Illuminate\\Support\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}s:11:\"\0*\0packages\";O:32:\"Laravel\\Roster\\PackageCollection\":2:{s:8:\"\0*\0items\";a:12:{i:0;O:22:\"Laravel\\Roster\\Package\":8:{s:9:\"\0*\0direct\";b:1;s:13:\"\0*\0constraint\";s:4:\"^5.0\";s:9:\"\0*\0source\";E:43:\"Laravel\\Roster\\Enums\\PackageSource:COMPOSER\";s:10:\"\0*\0package\";E:38:\"Laravel\\Roster\\Enums\\Packages:FILAMENT\";s:14:\"\0*\0packageName\";s:17:\"filament/filament\";s:10:\"\0*\0version\";s:5:\"5.3.1\";s:6:\"\0*\0dev\";b:0;s:7:\"\0*\0path\";s:62:\"C:\\Users\\Syarif Hidayatullah\\Herd\\vms\\vendor\\filament\\filament\";}i:1;O:22:\"Laravel\\Roster\\Package\":8:{s:9:\"\0*\0direct\";b:1;s:13:\"\0*\0constraint\";s:5:\"^12.0\";s:9:\"\0*\0source\";r:11;s:10:\"\0*\0package\";E:37:\"Laravel\\Roster\\Enums\\Packages:LARAVEL\";s:14:\"\0*\0packageName\";s:17:\"laravel/framework\";s:10:\"\0*\0version\";s:7:\"12.53.0\";s:6:\"\0*\0dev\";b:0;s:7:\"\0*\0path\";s:62:\"C:\\Users\\Syarif Hidayatullah\\Herd\\vms\\vendor\\laravel\\framework\";}i:2;O:22:\"Laravel\\Roster\\Package\":8:{s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:7:\"v0.3.13\";s:9:\"\0*\0source\";r:11;s:10:\"\0*\0package\";E:37:\"Laravel\\Roster\\Enums\\Packages:PROMPTS\";s:14:\"\0*\0packageName\";s:15:\"laravel/prompts\";s:10:\"\0*\0version\";s:6:\"0.3.13\";s:6:\"\0*\0dev\";b:0;s:7:\"\0*\0path\";s:60:\"C:\\Users\\Syarif Hidayatullah\\Herd\\vms\\vendor\\laravel\\prompts\";}i:3;O:22:\"Laravel\\Roster\\Package\":8:{s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:6:\"v4.2.1\";s:9:\"\0*\0source\";r:11;s:10:\"\0*\0package\";E:38:\"Laravel\\Roster\\Enums\\Packages:LIVEWIRE\";s:14:\"\0*\0packageName\";s:17:\"livewire/livewire\";s:10:\"\0*\0version\";s:5:\"4.2.1\";s:6:\"\0*\0dev\";b:0;s:7:\"\0*\0path\";s:62:\"C:\\Users\\Syarif Hidayatullah\\Herd\\vms\\vendor\\livewire\\livewire\";}i:4;O:22:\"Laravel\\Roster\\Package\":8:{s:9:\"\0*\0direct\";b:1;s:13:\"\0*\0constraint\";s:4:\"^2.2\";s:9:\"\0*\0source\";r:11;s:10:\"\0*\0package\";E:35:\"Laravel\\Roster\\Enums\\Packages:BOOST\";s:14:\"\0*\0packageName\";s:13:\"laravel/boost\";s:10:\"\0*\0version\";s:5:\"2.2.2\";s:6:\"\0*\0dev\";b:1;s:7:\"\0*\0path\";s:58:\"C:\\Users\\Syarif Hidayatullah\\Herd\\vms\\vendor\\laravel\\boost\";}i:5;O:22:\"Laravel\\Roster\\Package\":8:{s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:6:\"v0.6.0\";s:9:\"\0*\0source\";r:11;s:10:\"\0*\0package\";E:33:\"Laravel\\Roster\\Enums\\Packages:MCP\";s:14:\"\0*\0packageName\";s:11:\"laravel/mcp\";s:10:\"\0*\0version\";s:5:\"0.6.0\";s:6:\"\0*\0dev\";b:1;s:7:\"\0*\0path\";s:56:\"C:\\Users\\Syarif Hidayatullah\\Herd\\vms\\vendor\\laravel\\mcp\";}i:6;O:22:\"Laravel\\Roster\\Package\":8:{s:9:\"\0*\0direct\";b:1;s:13:\"\0*\0constraint\";s:6:\"^1.2.2\";s:9:\"\0*\0source\";r:11;s:10:\"\0*\0package\";E:34:\"Laravel\\Roster\\Enums\\Packages:PAIL\";s:14:\"\0*\0packageName\";s:12:\"laravel/pail\";s:10:\"\0*\0version\";s:5:\"1.2.6\";s:6:\"\0*\0dev\";b:1;s:7:\"\0*\0path\";s:57:\"C:\\Users\\Syarif Hidayatullah\\Herd\\vms\\vendor\\laravel\\pail\";}i:7;O:22:\"Laravel\\Roster\\Package\":8:{s:9:\"\0*\0direct\";b:1;s:13:\"\0*\0constraint\";s:5:\"^1.24\";s:9:\"\0*\0source\";r:11;s:10:\"\0*\0package\";E:34:\"Laravel\\Roster\\Enums\\Packages:PINT\";s:14:\"\0*\0packageName\";s:12:\"laravel/pint\";s:10:\"\0*\0version\";s:6:\"1.27.1\";s:6:\"\0*\0dev\";b:1;s:7:\"\0*\0path\";s:57:\"C:\\Users\\Syarif Hidayatullah\\Herd\\vms\\vendor\\laravel\\pint\";}i:8;O:22:\"Laravel\\Roster\\Package\":8:{s:9:\"\0*\0direct\";b:1;s:13:\"\0*\0constraint\";s:5:\"^1.41\";s:9:\"\0*\0source\";r:11;s:10:\"\0*\0package\";E:34:\"Laravel\\Roster\\Enums\\Packages:SAIL\";s:14:\"\0*\0packageName\";s:12:\"laravel/sail\";s:10:\"\0*\0version\";s:6:\"1.53.0\";s:6:\"\0*\0dev\";b:1;s:7:\"\0*\0path\";s:57:\"C:\\Users\\Syarif Hidayatullah\\Herd\\vms\\vendor\\laravel\\sail\";}i:9;O:22:\"Laravel\\Roster\\Package\":8:{s:9:\"\0*\0direct\";b:1;s:13:\"\0*\0constraint\";s:4:\"^4.4\";s:9:\"\0*\0source\";r:11;s:10:\"\0*\0package\";E:34:\"Laravel\\Roster\\Enums\\Packages:PEST\";s:14:\"\0*\0packageName\";s:12:\"pestphp/pest\";s:10:\"\0*\0version\";s:5:\"4.4.1\";s:6:\"\0*\0dev\";b:1;s:7:\"\0*\0path\";s:57:\"C:\\Users\\Syarif Hidayatullah\\Herd\\vms\\vendor\\pestphp\\pest\";}i:10;O:22:\"Laravel\\Roster\\Package\":8:{s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:7:\"12.5.12\";s:9:\"\0*\0source\";r:11;s:10:\"\0*\0package\";E:37:\"Laravel\\Roster\\Enums\\Packages:PHPUNIT\";s:14:\"\0*\0packageName\";s:15:\"phpunit/phpunit\";s:10:\"\0*\0version\";s:7:\"12.5.12\";s:6:\"\0*\0dev\";b:1;s:7:\"\0*\0path\";s:60:\"C:\\Users\\Syarif Hidayatullah\\Herd\\vms\\vendor\\phpunit\\phpunit\";}i:11;O:22:\"Laravel\\Roster\\Package\":8:{s:9:\"\0*\0direct\";b:1;s:13:\"\0*\0constraint\";s:6:\"^4.0.0\";s:9:\"\0*\0source\";E:38:\"Laravel\\Roster\\Enums\\PackageSource:NPM\";s:10:\"\0*\0package\";E:41:\"Laravel\\Roster\\Enums\\Packages:TAILWINDCSS\";s:14:\"\0*\0packageName\";s:11:\"tailwindcss\";s:10:\"\0*\0version\";s:5:\"4.2.1\";s:6:\"\0*\0dev\";b:1;s:7:\"\0*\0path\";s:62:\"C:\\Users\\Syarif Hidayatullah\\Herd\\vms\\node_modules\\tailwindcss\";}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}s:21:\"\0*\0nodePackageManager\";E:43:\"Laravel\\Roster\\Enums\\NodePackageManager:NPM\";}s:9:\"timestamp\";i:1772599846;}', 1772686246),
('laravel-cache-illuminate:queue:restart', 'i:1772612681;', 2087972681),
('laravel-cache-livewire-rate-limiter:056fc329aaaa757d31db450f525da23fde4d1b36', 'i:4;', 1772617858),
('laravel-cache-livewire-rate-limiter:056fc329aaaa757d31db450f525da23fde4d1b36:timer', 'i:1772617858;', 1772617858),
('vehicle-management-system-cache-livewire-rate-limiter:056fc329aaaa757d31db450f525da23fde4d1b36', 'i:1;', 1772619029),
('vehicle-management-system-cache-livewire-rate-limiter:056fc329aaaa757d31db450f525da23fde4d1b36:timer', 'i:1772619029;', 1772619029);

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `drivers`
--

CREATE TABLE `drivers` (
  `id` bigint UNSIGNED NOT NULL,
  `driver_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `drivers`
--

INSERT INTO `drivers` (`id`, `driver_name`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Suryadi', 'Tersedia', '2026-03-03 23:29:17', '2026-03-03 23:29:17'),
(2, 'Karjo', 'Sedang Bertugas', '2026-03-03 23:29:54', '2026-03-03 23:29:54');

-- --------------------------------------------------------

--
-- Table structure for table `exports`
--

CREATE TABLE `exports` (
  `id` bigint UNSIGNED NOT NULL,
  `completed_at` timestamp NULL DEFAULT NULL,
  `file_disk` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `exporter` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `processed_rows` int UNSIGNED NOT NULL DEFAULT '0',
  `total_rows` int UNSIGNED NOT NULL,
  `successful_rows` int UNSIGNED NOT NULL DEFAULT '0',
  `user_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exports`
--

INSERT INTO `exports` (`id`, `completed_at`, `file_disk`, `file_name`, `exporter`, `processed_rows`, `total_rows`, `successful_rows`, `user_id`, `created_at`, `updated_at`) VALUES
(1, '2026-03-04 01:24:16', 'local', 'export-1-bookings', 'App\\Filament\\Exports\\BookingExporter', 1, 1, 0, 1, '2026-03-04 01:24:15', '2026-03-04 01:24:16'),
(2, '2026-03-04 01:24:56', 'local', 'export-2-bookings', 'App\\Filament\\Exports\\BookingExporter', 1, 1, 1, 1, '2026-03-04 01:24:54', '2026-03-04 01:24:56'),
(3, '2026-03-04 03:09:37', 'local', 'export-3-bookings', 'App\\Filament\\Exports\\BookingExporter', 2, 2, 2, 1, '2026-03-04 03:09:36', '2026-03-04 03:09:37');

-- --------------------------------------------------------

--
-- Table structure for table `failed_import_rows`
--

CREATE TABLE `failed_import_rows` (
  `id` bigint UNSIGNED NOT NULL,
  `data` json NOT NULL,
  `import_id` bigint UNSIGNED NOT NULL,
  `validation_error` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fuel_logs`
--

CREATE TABLE `fuel_logs` (
  `id` bigint UNSIGNED NOT NULL,
  `vehicle_id` bigint UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `liters_added` double NOT NULL,
  `cost` decimal(15,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `fuel_logs`
--

INSERT INTO `fuel_logs` (`id`, `vehicle_id`, `date`, `liters_added`, `cost`, `created_at`, `updated_at`) VALUES
(1, 1, '2026-03-04', 20, 240000.00, '2026-03-04 00:56:19', '2026-03-04 00:56:19'),
(2, 2, '2026-03-04', 25, 300000.00, '2026-03-04 02:52:53', '2026-03-04 02:52:53');

-- --------------------------------------------------------

--
-- Table structure for table `imports`
--

CREATE TABLE `imports` (
  `id` bigint UNSIGNED NOT NULL,
  `completed_at` timestamp NULL DEFAULT NULL,
  `file_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `importer` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `processed_rows` int UNSIGNED NOT NULL DEFAULT '0',
  `total_rows` int UNSIGNED NOT NULL,
  `successful_rows` int UNSIGNED NOT NULL DEFAULT '0',
  `user_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `job_batches`
--

INSERT INTO `job_batches` (`id`, `name`, `total_jobs`, `pending_jobs`, `failed_jobs`, `failed_job_ids`, `options`, `cancelled_at`, `created_at`, `finished_at`) VALUES
('a137dac5-4f7a-4e2a-9910-91c0abf03545', '', 2, 0, 0, '[]', 'a:2:{s:13:\"allowFailures\";b:1;s:7:\"finally\";a:1:{i:0;O:47:\"Laravel\\SerializableClosure\\SerializableClosure\":1:{s:12:\"serializable\";O:46:\"Laravel\\SerializableClosure\\Serializers\\Signed\":2:{s:12:\"serializable\";s:5526:\"O:46:\"Laravel\\SerializableClosure\\Serializers\\Native\":5:{s:3:\"use\";a:1:{s:4:\"next\";O:46:\"Filament\\Actions\\Exports\\Jobs\\ExportCompletion\":8:{s:11:\"\0*\0exporter\";O:36:\"App\\Filament\\Exports\\BookingExporter\":3:{s:9:\"\0*\0export\";O:38:\"Filament\\Actions\\Exports\\Models\\Export\":33:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";N;s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:1;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:8:{s:7:\"user_id\";i:1;s:8:\"exporter\";s:36:\"App\\Filament\\Exports\\BookingExporter\";s:10:\"total_rows\";i:1;s:9:\"file_disk\";s:5:\"local\";s:10:\"updated_at\";s:19:\"2026-03-04 08:24:15\";s:10:\"created_at\";s:19:\"2026-03-04 08:24:15\";s:2:\"id\";i:1;s:9:\"file_name\";s:17:\"export-1-bookings\";}s:11:\"\0*\0original\";a:8:{s:7:\"user_id\";i:1;s:8:\"exporter\";s:36:\"App\\Filament\\Exports\\BookingExporter\";s:10:\"total_rows\";i:1;s:9:\"file_disk\";s:5:\"local\";s:10:\"updated_at\";s:19:\"2026-03-04 08:24:15\";s:10:\"created_at\";s:19:\"2026-03-04 08:24:15\";s:2:\"id\";i:1;s:9:\"file_name\";s:17:\"export-1-bookings\";}s:10:\"\0*\0changes\";a:1:{s:9:\"file_name\";s:17:\"export-1-bookings\";}s:11:\"\0*\0previous\";a:0:{}s:8:\"\0*\0casts\";a:4:{s:12:\"completed_at\";s:9:\"timestamp\";s:14:\"processed_rows\";s:7:\"integer\";s:10:\"total_rows\";s:7:\"integer\";s:15:\"successful_rows\";s:7:\"integer\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:27:\"\0*\0relationAutoloadCallback\";N;s:26:\"\0*\0relationAutoloadContext\";N;s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:0:{}}s:12:\"\0*\0columnMap\";a:4:{s:20:\"vehicle.vehicle_name\";s:9:\"Kendaraan\";s:18:\"driver.driver_name\";s:9:\"Pengemudi\";s:7:\"purpose\";s:9:\"Keperluan\";s:6:\"status\";s:6:\"Status\";}s:10:\"\0*\0options\";a:0:{}}s:9:\"\0*\0export\";O:45:\"Illuminate\\Contracts\\Database\\ModelIdentifier\":5:{s:5:\"class\";s:38:\"Filament\\Actions\\Exports\\Models\\Export\";s:2:\"id\";i:1;s:9:\"relations\";a:0:{}s:10:\"connection\";s:5:\"mysql\";s:15:\"collectionClass\";N;}s:12:\"\0*\0columnMap\";a:4:{s:20:\"vehicle.vehicle_name\";s:9:\"Kendaraan\";s:18:\"driver.driver_name\";s:9:\"Pengemudi\";s:7:\"purpose\";s:9:\"Keperluan\";s:6:\"status\";s:6:\"Status\";}s:10:\"\0*\0formats\";a:2:{i:0;E:47:\"Filament\\Actions\\Exports\\Enums\\ExportFormat:Csv\";i:1;E:48:\"Filament\\Actions\\Exports\\Enums\\ExportFormat:Xlsx\";}s:10:\"\0*\0options\";a:0:{}s:12:\"\0*\0authGuard\";s:3:\"web\";s:7:\"chained\";a:1:{i:0;s:2399:\"O:44:\"Filament\\Actions\\Exports\\Jobs\\CreateXlsxFile\":4:{s:11:\"\0*\0exporter\";O:36:\"App\\Filament\\Exports\\BookingExporter\":3:{s:9:\"\0*\0export\";O:38:\"Filament\\Actions\\Exports\\Models\\Export\":33:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";N;s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:1;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:8:{s:7:\"user_id\";i:1;s:8:\"exporter\";s:36:\"App\\Filament\\Exports\\BookingExporter\";s:10:\"total_rows\";i:1;s:9:\"file_disk\";s:5:\"local\";s:10:\"updated_at\";s:19:\"2026-03-04 08:24:15\";s:10:\"created_at\";s:19:\"2026-03-04 08:24:15\";s:2:\"id\";i:1;s:9:\"file_name\";s:17:\"export-1-bookings\";}s:11:\"\0*\0original\";a:8:{s:7:\"user_id\";i:1;s:8:\"exporter\";s:36:\"App\\Filament\\Exports\\BookingExporter\";s:10:\"total_rows\";i:1;s:9:\"file_disk\";s:5:\"local\";s:10:\"updated_at\";s:19:\"2026-03-04 08:24:15\";s:10:\"created_at\";s:19:\"2026-03-04 08:24:15\";s:2:\"id\";i:1;s:9:\"file_name\";s:17:\"export-1-bookings\";}s:10:\"\0*\0changes\";a:1:{s:9:\"file_name\";s:17:\"export-1-bookings\";}s:11:\"\0*\0previous\";a:0:{}s:8:\"\0*\0casts\";a:4:{s:12:\"completed_at\";s:9:\"timestamp\";s:14:\"processed_rows\";s:7:\"integer\";s:10:\"total_rows\";s:7:\"integer\";s:15:\"successful_rows\";s:7:\"integer\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:27:\"\0*\0relationAutoloadCallback\";N;s:26:\"\0*\0relationAutoloadContext\";N;s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:0:{}}s:12:\"\0*\0columnMap\";a:4:{s:20:\"vehicle.vehicle_name\";s:9:\"Kendaraan\";s:18:\"driver.driver_name\";s:9:\"Pengemudi\";s:7:\"purpose\";s:9:\"Keperluan\";s:6:\"status\";s:6:\"Status\";}s:10:\"\0*\0options\";a:0:{}}s:9:\"\0*\0export\";O:45:\"Illuminate\\Contracts\\Database\\ModelIdentifier\":5:{s:5:\"class\";s:38:\"Filament\\Actions\\Exports\\Models\\Export\";s:2:\"id\";i:1;s:9:\"relations\";a:0:{}s:10:\"connection\";s:5:\"mysql\";s:15:\"collectionClass\";N;}s:12:\"\0*\0columnMap\";a:4:{s:20:\"vehicle.vehicle_name\";s:9:\"Kendaraan\";s:18:\"driver.driver_name\";s:9:\"Pengemudi\";s:7:\"purpose\";s:9:\"Keperluan\";s:6:\"status\";s:6:\"Status\";}s:10:\"\0*\0options\";a:0:{}}\";}s:19:\"chainCatchCallbacks\";a:0:{}}}s:8:\"function\";s:266:\"function (\\Illuminate\\Bus\\Batch $batch) use ($next) {\n                if (! $batch->cancelled()) {\n                    \\Illuminate\\Container\\Container::getInstance()->make(\\Illuminate\\Contracts\\Bus\\Dispatcher::class)->dispatch($next);\n                }\n            }\";s:5:\"scope\";s:27:\"Illuminate\\Bus\\ChainedBatch\";s:4:\"this\";N;s:4:\"self\";s:32:\"00000000000008490000000000000000\";}\";s:4:\"hash\";s:44:\"5IpuGEuG9wfQrYr29Dpht+Jc4tMrVoC2cixInS4m15M=\";}}}}', NULL, 1772612656, 1772612656),
('a137db02-3b10-4e89-90f4-e51714789e72', '', 2, 0, 0, '[]', 'a:2:{s:13:\"allowFailures\";b:1;s:7:\"finally\";a:1:{i:0;O:47:\"Laravel\\SerializableClosure\\SerializableClosure\":1:{s:12:\"serializable\";O:46:\"Laravel\\SerializableClosure\\Serializers\\Signed\":2:{s:12:\"serializable\";s:5526:\"O:46:\"Laravel\\SerializableClosure\\Serializers\\Native\":5:{s:3:\"use\";a:1:{s:4:\"next\";O:46:\"Filament\\Actions\\Exports\\Jobs\\ExportCompletion\":8:{s:11:\"\0*\0exporter\";O:36:\"App\\Filament\\Exports\\BookingExporter\":3:{s:9:\"\0*\0export\";O:38:\"Filament\\Actions\\Exports\\Models\\Export\":33:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";N;s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:1;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:8:{s:7:\"user_id\";i:1;s:8:\"exporter\";s:36:\"App\\Filament\\Exports\\BookingExporter\";s:10:\"total_rows\";i:1;s:9:\"file_disk\";s:5:\"local\";s:10:\"updated_at\";s:19:\"2026-03-04 08:24:54\";s:10:\"created_at\";s:19:\"2026-03-04 08:24:54\";s:2:\"id\";i:2;s:9:\"file_name\";s:17:\"export-2-bookings\";}s:11:\"\0*\0original\";a:8:{s:7:\"user_id\";i:1;s:8:\"exporter\";s:36:\"App\\Filament\\Exports\\BookingExporter\";s:10:\"total_rows\";i:1;s:9:\"file_disk\";s:5:\"local\";s:10:\"updated_at\";s:19:\"2026-03-04 08:24:54\";s:10:\"created_at\";s:19:\"2026-03-04 08:24:54\";s:2:\"id\";i:2;s:9:\"file_name\";s:17:\"export-2-bookings\";}s:10:\"\0*\0changes\";a:1:{s:9:\"file_name\";s:17:\"export-2-bookings\";}s:11:\"\0*\0previous\";a:0:{}s:8:\"\0*\0casts\";a:4:{s:12:\"completed_at\";s:9:\"timestamp\";s:14:\"processed_rows\";s:7:\"integer\";s:10:\"total_rows\";s:7:\"integer\";s:15:\"successful_rows\";s:7:\"integer\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:27:\"\0*\0relationAutoloadCallback\";N;s:26:\"\0*\0relationAutoloadContext\";N;s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:0:{}}s:12:\"\0*\0columnMap\";a:4:{s:20:\"vehicle.vehicle_name\";s:9:\"Kendaraan\";s:18:\"driver.driver_name\";s:9:\"Pengemudi\";s:7:\"purpose\";s:9:\"Keperluan\";s:6:\"status\";s:6:\"Status\";}s:10:\"\0*\0options\";a:0:{}}s:9:\"\0*\0export\";O:45:\"Illuminate\\Contracts\\Database\\ModelIdentifier\":5:{s:5:\"class\";s:38:\"Filament\\Actions\\Exports\\Models\\Export\";s:2:\"id\";i:2;s:9:\"relations\";a:0:{}s:10:\"connection\";s:5:\"mysql\";s:15:\"collectionClass\";N;}s:12:\"\0*\0columnMap\";a:4:{s:20:\"vehicle.vehicle_name\";s:9:\"Kendaraan\";s:18:\"driver.driver_name\";s:9:\"Pengemudi\";s:7:\"purpose\";s:9:\"Keperluan\";s:6:\"status\";s:6:\"Status\";}s:10:\"\0*\0formats\";a:2:{i:0;E:47:\"Filament\\Actions\\Exports\\Enums\\ExportFormat:Csv\";i:1;E:48:\"Filament\\Actions\\Exports\\Enums\\ExportFormat:Xlsx\";}s:10:\"\0*\0options\";a:0:{}s:12:\"\0*\0authGuard\";s:3:\"web\";s:7:\"chained\";a:1:{i:0;s:2399:\"O:44:\"Filament\\Actions\\Exports\\Jobs\\CreateXlsxFile\":4:{s:11:\"\0*\0exporter\";O:36:\"App\\Filament\\Exports\\BookingExporter\":3:{s:9:\"\0*\0export\";O:38:\"Filament\\Actions\\Exports\\Models\\Export\":33:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";N;s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:1;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:8:{s:7:\"user_id\";i:1;s:8:\"exporter\";s:36:\"App\\Filament\\Exports\\BookingExporter\";s:10:\"total_rows\";i:1;s:9:\"file_disk\";s:5:\"local\";s:10:\"updated_at\";s:19:\"2026-03-04 08:24:54\";s:10:\"created_at\";s:19:\"2026-03-04 08:24:54\";s:2:\"id\";i:2;s:9:\"file_name\";s:17:\"export-2-bookings\";}s:11:\"\0*\0original\";a:8:{s:7:\"user_id\";i:1;s:8:\"exporter\";s:36:\"App\\Filament\\Exports\\BookingExporter\";s:10:\"total_rows\";i:1;s:9:\"file_disk\";s:5:\"local\";s:10:\"updated_at\";s:19:\"2026-03-04 08:24:54\";s:10:\"created_at\";s:19:\"2026-03-04 08:24:54\";s:2:\"id\";i:2;s:9:\"file_name\";s:17:\"export-2-bookings\";}s:10:\"\0*\0changes\";a:1:{s:9:\"file_name\";s:17:\"export-2-bookings\";}s:11:\"\0*\0previous\";a:0:{}s:8:\"\0*\0casts\";a:4:{s:12:\"completed_at\";s:9:\"timestamp\";s:14:\"processed_rows\";s:7:\"integer\";s:10:\"total_rows\";s:7:\"integer\";s:15:\"successful_rows\";s:7:\"integer\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:27:\"\0*\0relationAutoloadCallback\";N;s:26:\"\0*\0relationAutoloadContext\";N;s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:0:{}}s:12:\"\0*\0columnMap\";a:4:{s:20:\"vehicle.vehicle_name\";s:9:\"Kendaraan\";s:18:\"driver.driver_name\";s:9:\"Pengemudi\";s:7:\"purpose\";s:9:\"Keperluan\";s:6:\"status\";s:6:\"Status\";}s:10:\"\0*\0options\";a:0:{}}s:9:\"\0*\0export\";O:45:\"Illuminate\\Contracts\\Database\\ModelIdentifier\":5:{s:5:\"class\";s:38:\"Filament\\Actions\\Exports\\Models\\Export\";s:2:\"id\";i:2;s:9:\"relations\";a:0:{}s:10:\"connection\";s:5:\"mysql\";s:15:\"collectionClass\";N;}s:12:\"\0*\0columnMap\";a:4:{s:20:\"vehicle.vehicle_name\";s:9:\"Kendaraan\";s:18:\"driver.driver_name\";s:9:\"Pengemudi\";s:7:\"purpose\";s:9:\"Keperluan\";s:6:\"status\";s:6:\"Status\";}s:10:\"\0*\0options\";a:0:{}}\";}s:19:\"chainCatchCallbacks\";a:0:{}}}s:8:\"function\";s:266:\"function (\\Illuminate\\Bus\\Batch $batch) use ($next) {\n                if (! $batch->cancelled()) {\n                    \\Illuminate\\Container\\Container::getInstance()->make(\\Illuminate\\Contracts\\Bus\\Dispatcher::class)->dispatch($next);\n                }\n            }\";s:5:\"scope\";s:27:\"Illuminate\\Bus\\ChainedBatch\";s:4:\"this\";N;s:4:\"self\";s:32:\"00000000000008730000000000000000\";}\";s:4:\"hash\";s:44:\"Cixq/zvz20xHuGdy7r8smnbkqYEXRWBoyl6EYsoTorU=\";}}}}', NULL, 1772612696, 1772612696),
('a1380071-cf1a-4b22-ab57-75ed0bbb73cf', '', 2, 0, 0, '[]', 'a:2:{s:13:\"allowFailures\";b:1;s:7:\"finally\";a:1:{i:0;O:47:\"Laravel\\SerializableClosure\\SerializableClosure\":1:{s:12:\"serializable\";O:46:\"Laravel\\SerializableClosure\\Serializers\\Signed\":2:{s:12:\"serializable\";s:5526:\"O:46:\"Laravel\\SerializableClosure\\Serializers\\Native\":5:{s:3:\"use\";a:1:{s:4:\"next\";O:46:\"Filament\\Actions\\Exports\\Jobs\\ExportCompletion\":8:{s:11:\"\0*\0exporter\";O:36:\"App\\Filament\\Exports\\BookingExporter\":3:{s:9:\"\0*\0export\";O:38:\"Filament\\Actions\\Exports\\Models\\Export\":33:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";N;s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:1;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:8:{s:7:\"user_id\";i:1;s:8:\"exporter\";s:36:\"App\\Filament\\Exports\\BookingExporter\";s:10:\"total_rows\";i:2;s:9:\"file_disk\";s:5:\"local\";s:10:\"updated_at\";s:19:\"2026-03-04 10:09:36\";s:10:\"created_at\";s:19:\"2026-03-04 10:09:36\";s:2:\"id\";i:3;s:9:\"file_name\";s:17:\"export-3-bookings\";}s:11:\"\0*\0original\";a:8:{s:7:\"user_id\";i:1;s:8:\"exporter\";s:36:\"App\\Filament\\Exports\\BookingExporter\";s:10:\"total_rows\";i:2;s:9:\"file_disk\";s:5:\"local\";s:10:\"updated_at\";s:19:\"2026-03-04 10:09:36\";s:10:\"created_at\";s:19:\"2026-03-04 10:09:36\";s:2:\"id\";i:3;s:9:\"file_name\";s:17:\"export-3-bookings\";}s:10:\"\0*\0changes\";a:1:{s:9:\"file_name\";s:17:\"export-3-bookings\";}s:11:\"\0*\0previous\";a:0:{}s:8:\"\0*\0casts\";a:4:{s:12:\"completed_at\";s:9:\"timestamp\";s:14:\"processed_rows\";s:7:\"integer\";s:10:\"total_rows\";s:7:\"integer\";s:15:\"successful_rows\";s:7:\"integer\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:27:\"\0*\0relationAutoloadCallback\";N;s:26:\"\0*\0relationAutoloadContext\";N;s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:0:{}}s:12:\"\0*\0columnMap\";a:4:{s:20:\"vehicle.vehicle_name\";s:9:\"Kendaraan\";s:18:\"driver.driver_name\";s:9:\"Pengemudi\";s:7:\"purpose\";s:9:\"Keperluan\";s:6:\"status\";s:6:\"Status\";}s:10:\"\0*\0options\";a:0:{}}s:9:\"\0*\0export\";O:45:\"Illuminate\\Contracts\\Database\\ModelIdentifier\":5:{s:5:\"class\";s:38:\"Filament\\Actions\\Exports\\Models\\Export\";s:2:\"id\";i:3;s:9:\"relations\";a:0:{}s:10:\"connection\";s:5:\"mysql\";s:15:\"collectionClass\";N;}s:12:\"\0*\0columnMap\";a:4:{s:20:\"vehicle.vehicle_name\";s:9:\"Kendaraan\";s:18:\"driver.driver_name\";s:9:\"Pengemudi\";s:7:\"purpose\";s:9:\"Keperluan\";s:6:\"status\";s:6:\"Status\";}s:10:\"\0*\0formats\";a:2:{i:0;E:47:\"Filament\\Actions\\Exports\\Enums\\ExportFormat:Csv\";i:1;E:48:\"Filament\\Actions\\Exports\\Enums\\ExportFormat:Xlsx\";}s:10:\"\0*\0options\";a:0:{}s:12:\"\0*\0authGuard\";s:3:\"web\";s:7:\"chained\";a:1:{i:0;s:2399:\"O:44:\"Filament\\Actions\\Exports\\Jobs\\CreateXlsxFile\":4:{s:11:\"\0*\0exporter\";O:36:\"App\\Filament\\Exports\\BookingExporter\":3:{s:9:\"\0*\0export\";O:38:\"Filament\\Actions\\Exports\\Models\\Export\":33:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";N;s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:1;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:8:{s:7:\"user_id\";i:1;s:8:\"exporter\";s:36:\"App\\Filament\\Exports\\BookingExporter\";s:10:\"total_rows\";i:2;s:9:\"file_disk\";s:5:\"local\";s:10:\"updated_at\";s:19:\"2026-03-04 10:09:36\";s:10:\"created_at\";s:19:\"2026-03-04 10:09:36\";s:2:\"id\";i:3;s:9:\"file_name\";s:17:\"export-3-bookings\";}s:11:\"\0*\0original\";a:8:{s:7:\"user_id\";i:1;s:8:\"exporter\";s:36:\"App\\Filament\\Exports\\BookingExporter\";s:10:\"total_rows\";i:2;s:9:\"file_disk\";s:5:\"local\";s:10:\"updated_at\";s:19:\"2026-03-04 10:09:36\";s:10:\"created_at\";s:19:\"2026-03-04 10:09:36\";s:2:\"id\";i:3;s:9:\"file_name\";s:17:\"export-3-bookings\";}s:10:\"\0*\0changes\";a:1:{s:9:\"file_name\";s:17:\"export-3-bookings\";}s:11:\"\0*\0previous\";a:0:{}s:8:\"\0*\0casts\";a:4:{s:12:\"completed_at\";s:9:\"timestamp\";s:14:\"processed_rows\";s:7:\"integer\";s:10:\"total_rows\";s:7:\"integer\";s:15:\"successful_rows\";s:7:\"integer\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:27:\"\0*\0relationAutoloadCallback\";N;s:26:\"\0*\0relationAutoloadContext\";N;s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:0:{}}s:12:\"\0*\0columnMap\";a:4:{s:20:\"vehicle.vehicle_name\";s:9:\"Kendaraan\";s:18:\"driver.driver_name\";s:9:\"Pengemudi\";s:7:\"purpose\";s:9:\"Keperluan\";s:6:\"status\";s:6:\"Status\";}s:10:\"\0*\0options\";a:0:{}}s:9:\"\0*\0export\";O:45:\"Illuminate\\Contracts\\Database\\ModelIdentifier\":5:{s:5:\"class\";s:38:\"Filament\\Actions\\Exports\\Models\\Export\";s:2:\"id\";i:3;s:9:\"relations\";a:0:{}s:10:\"connection\";s:5:\"mysql\";s:15:\"collectionClass\";N;}s:12:\"\0*\0columnMap\";a:4:{s:20:\"vehicle.vehicle_name\";s:9:\"Kendaraan\";s:18:\"driver.driver_name\";s:9:\"Pengemudi\";s:7:\"purpose\";s:9:\"Keperluan\";s:6:\"status\";s:6:\"Status\";}s:10:\"\0*\0options\";a:0:{}}\";}s:19:\"chainCatchCallbacks\";a:0:{}}}s:8:\"function\";s:266:\"function (\\Illuminate\\Bus\\Batch $batch) use ($next) {\n                if (! $batch->cancelled()) {\n                    \\Illuminate\\Container\\Container::getInstance()->make(\\Illuminate\\Contracts\\Bus\\Dispatcher::class)->dispatch($next);\n                }\n            }\";s:5:\"scope\";s:27:\"Illuminate\\Bus\\ChainedBatch\";s:4:\"this\";N;s:4:\"self\";s:32:\"00000000000008e40000000000000000\";}\";s:4:\"hash\";s:44:\"NYel5TmVsyk4sSsTL3p4DIZHZffcX7d0NJVmv1sAv8U=\";}}}}', NULL, 1772618976, 1772618977);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_regions_table', 1),
(2, '0001_01_01_000000_create_users_table', 1),
(3, '0001_01_01_000001_create_cache_table', 1),
(4, '0001_01_01_000002_create_jobs_table', 1),
(5, '2026_03_04_042000_create_vehicles_table', 1),
(6, '2026_03_04_042001_create_drivers_table', 1),
(7, '2026_03_04_042002_create_bookings_table', 1),
(8, '2026_03_04_042003_create_booking_approvals_table', 1),
(9, '2026_03_04_042004_create_fuel_logs_table', 1),
(10, '2026_03_04_042005_create_services_logs_table', 1),
(11, '2026_03_04_081319_create_notifications_table', 2),
(12, '2026_03_04_081338_create_imports_table', 2),
(13, '2026_03_04_081339_create_exports_table', 2),
(14, '2026_03_04_081340_create_failed_import_rows_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` bigint UNSIGNED NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `type`, `notifiable_type`, `notifiable_id`, `data`, `read_at`, `created_at`, `updated_at`) VALUES
('04fd8fa5-18ff-42ee-8a4f-6d174e43e2c2', 'Filament\\Notifications\\DatabaseNotification', 'App\\Models\\User', 1, '{\"actions\":[{\"name\":\"download_csv\",\"alpineClickHandler\":null,\"color\":null,\"event\":null,\"eventData\":[],\"dispatchDirection\":false,\"dispatchToComponent\":null,\"extraAttributes\":[],\"icon\":null,\"iconPosition\":\"before\",\"iconSize\":null,\"isOutlined\":false,\"isDisabled\":false,\"label\":\"Download .csv\",\"shouldClose\":false,\"shouldMarkAsRead\":true,\"shouldMarkAsUnread\":false,\"shouldOpenUrlInNewTab\":true,\"shouldPostToUrl\":false,\"size\":\"sm\",\"tooltip\":null,\"url\":\"\\/filament\\/exports\\/3\\/download?authGuard=web&format=csv&signature=9fbd7c8d1bf0e0efbf59365fe375f7c6045afa60bb919dfef8fc1b70b38c7945\",\"view\":\"filament::components.link\"},{\"name\":\"download_xlsx\",\"alpineClickHandler\":null,\"color\":null,\"event\":null,\"eventData\":[],\"dispatchDirection\":false,\"dispatchToComponent\":null,\"extraAttributes\":[],\"icon\":null,\"iconPosition\":\"before\",\"iconSize\":null,\"isOutlined\":false,\"isDisabled\":false,\"label\":\"Download .xlsx\",\"shouldClose\":false,\"shouldMarkAsRead\":true,\"shouldMarkAsUnread\":false,\"shouldOpenUrlInNewTab\":true,\"shouldPostToUrl\":false,\"size\":\"sm\",\"tooltip\":null,\"url\":\"\\/filament\\/exports\\/3\\/download?authGuard=web&format=xlsx&signature=ee80f62007ab3225064c668234d938d5e7aac92d03fdf627873f51bc71fd3034\",\"view\":\"filament::components.link\"}],\"body\":\"Export pemesanan kendaraan selesai, 2 baris berhasil diexport.\",\"color\":null,\"duration\":\"persistent\",\"icon\":\"heroicon-o-check-circle\",\"iconColor\":\"success\",\"status\":\"success\",\"title\":\"Export completed\",\"view\":null,\"viewData\":[],\"format\":\"filament\"}', '2026-03-04 03:09:50', '2026-03-04 03:09:37', '2026-03-04 03:09:50'),
('341ccf23-5e91-4ea3-b877-de46c613098a', 'Filament\\Notifications\\DatabaseNotification', 'App\\Models\\User', 1, '{\"actions\":[{\"name\":\"download_csv\",\"alpineClickHandler\":null,\"color\":null,\"event\":null,\"eventData\":[],\"dispatchDirection\":false,\"dispatchToComponent\":null,\"extraAttributes\":[],\"icon\":null,\"iconPosition\":\"before\",\"iconSize\":null,\"isOutlined\":false,\"isDisabled\":false,\"label\":\"Download .csv\",\"shouldClose\":false,\"shouldMarkAsRead\":true,\"shouldMarkAsUnread\":false,\"shouldOpenUrlInNewTab\":true,\"shouldPostToUrl\":false,\"size\":\"sm\",\"tooltip\":null,\"url\":\"\\/filament\\/exports\\/2\\/download?authGuard=web&format=csv&signature=365976b4ff5d2eeed82608f9731a518bf43606b81063052ed938ef6c99c771d8\",\"view\":\"filament::components.link\"},{\"name\":\"download_xlsx\",\"alpineClickHandler\":null,\"color\":null,\"event\":null,\"eventData\":[],\"dispatchDirection\":false,\"dispatchToComponent\":null,\"extraAttributes\":[],\"icon\":null,\"iconPosition\":\"before\",\"iconSize\":null,\"isOutlined\":false,\"isDisabled\":false,\"label\":\"Download .xlsx\",\"shouldClose\":false,\"shouldMarkAsRead\":true,\"shouldMarkAsUnread\":false,\"shouldOpenUrlInNewTab\":true,\"shouldPostToUrl\":false,\"size\":\"sm\",\"tooltip\":null,\"url\":\"\\/filament\\/exports\\/2\\/download?authGuard=web&format=xlsx&signature=599ac1a047f4c0b1fc8245e13fd637159c373c20127ac366de7d399d539ce7e8\",\"view\":\"filament::components.link\"}],\"body\":\"Export pemesanan kendaraan selesai, 1 baris berhasil diexport.\",\"color\":null,\"duration\":\"persistent\",\"icon\":\"heroicon-o-check-circle\",\"iconColor\":\"success\",\"status\":\"success\",\"title\":\"Export completed\",\"view\":null,\"viewData\":[],\"format\":\"filament\"}', '2026-03-04 01:25:00', '2026-03-04 01:24:56', '2026-03-04 01:25:00');

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `regions`
--

CREATE TABLE `regions` (
  `id` bigint UNSIGNED NOT NULL,
  `region_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `regions`
--

INSERT INTO `regions` (`id`, `region_name`, `type`, `created_at`, `updated_at`) VALUES
(1, 'Tangerang Selatan', 'Tambang', '2026-03-03 21:44:30', '2026-03-03 22:58:29'),
(2, 'Depok', 'Kantor Pusat', '2026-03-03 23:00:10', '2026-03-03 23:00:10'),
(4, 'Jakarta Selatan', 'Kantor Cabang', '2026-03-03 23:10:21', '2026-03-03 23:10:21'),
(5, 'Kalimantan Utara', 'Tambang', '2026-03-03 23:10:39', '2026-03-03 23:10:39'),
(6, 'Papua', 'Tambang', '2026-03-03 23:10:47', '2026-03-03 23:10:47'),
(7, 'NTT', 'Tambang', '2026-03-03 23:10:55', '2026-03-03 23:10:55'),
(8, 'Kalimantan Selatan', 'Tambang', '2026-03-03 23:11:15', '2026-03-03 23:11:15'),
(9, 'Bogor', 'Tambang', '2026-03-03 23:11:34', '2026-03-03 23:11:34');

-- --------------------------------------------------------

--
-- Table structure for table `services_logs`
--

CREATE TABLE `services_logs` (
  `id` bigint UNSIGNED NOT NULL,
  `vehicle_id` bigint UNSIGNED NOT NULL,
  `service_date` date NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `next_service_estimate` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `services_logs`
--

INSERT INTO `services_logs` (`id`, `vehicle_id`, `service_date`, `description`, `next_service_estimate`, `created_at`, `updated_at`) VALUES
(1, 2, '2026-03-31', 'Service Ban', '2026-04-30', '2026-03-04 01:00:46', '2026-03-04 01:00:46');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('HJPzJLCMOC1J3YW7jPEOb2F69o655PzsoZ2OadhQ', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiWVVsRG1GaUJXUnYyMHdYMmM5dFBNY3NsYVpUWlI4eXVFaVBiMEgwciI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czoyMToiaHR0cDovL3Ztcy50ZXN0L2FkbWluIjt9czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly92bXMudGVzdC9hdXRoL2xvZ2luIjtzOjU6InJvdXRlIjtzOjI0OiJmaWxhbWVudC5hdXRoLmF1dGgubG9naW4iO319', 1772618060),
('k6B3IYVGU6o4B0no1WlIMbrrl7zPoGMkEPHr3c3e', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'YTo4OntzOjY6Il90b2tlbiI7czo0MDoielVrQXdISmkwRzlJRm9FUlQ1cUg0UUhEdEMxNkxINFdLaVgzSkVOYiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czoyNDoiaHR0cDovL3Ztcy50ZXN0L2FwcHJvdmVyIjt9czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly92bXMudGVzdC9hZG1pbiI7czo1OiJyb3V0ZSI7czozMDoiZmlsYW1lbnQuYWRtaW4ucGFnZXMuZGFzaGJvYXJkIjt9czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjE3OiJwYXNzd29yZF9oYXNoX3dlYiI7czo2NDoiNWQwOTA5NWRmODE4NDEyZGFmMjc4ZGNkMWM5YTE4MDI4ZmJiOTMyNjNkZmVhOWQ5Yzc0ZGJjNGIzY2UzMDc4ZiI7czo2OiJ0YWJsZXMiO2E6MTp7czo0MDoiMjg2YmQ0MDU0ZDcyMGI5MjI5MDI5M2U1MWEyMjY4Y2ZfY29sdW1ucyI7YTo3OntpOjA7YTo3OntzOjQ6InR5cGUiO3M6NjoiY29sdW1uIjtzOjQ6Im5hbWUiO3M6MTQ6ImFkbWluLnVzZXJuYW1lIjtzOjU6ImxhYmVsIjtzOjExOiJEaWJ1YXQgT2xlaCI7czo4OiJpc0hpZGRlbiI7YjowO3M6OToiaXNUb2dnbGVkIjtiOjE7czoxMjoiaXNUb2dnbGVhYmxlIjtiOjA7czoyNDoiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjtOO31pOjE7YTo3OntzOjQ6InR5cGUiO3M6NjoiY29sdW1uIjtzOjQ6Im5hbWUiO3M6MjA6InZlaGljbGUudmVoaWNsZV9uYW1lIjtzOjU6ImxhYmVsIjtzOjk6IktlbmRhcmFhbiI7czo4OiJpc0hpZGRlbiI7YjowO3M6OToiaXNUb2dnbGVkIjtiOjE7czoxMjoiaXNUb2dnbGVhYmxlIjtiOjA7czoyNDoiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjtOO31pOjI7YTo3OntzOjQ6InR5cGUiO3M6NjoiY29sdW1uIjtzOjQ6Im5hbWUiO3M6MTg6ImRyaXZlci5kcml2ZXJfbmFtZSI7czo1OiJsYWJlbCI7czo5OiJQZW5nZW11ZGkiO3M6ODoiaXNIaWRkZW4iO2I6MDtzOjk6ImlzVG9nZ2xlZCI7YjoxO3M6MTI6ImlzVG9nZ2xlYWJsZSI7YjowO3M6MjQ6ImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI7Tjt9aTozO2E6Nzp7czo0OiJ0eXBlIjtzOjY6ImNvbHVtbiI7czo0OiJuYW1lIjtzOjEwOiJzdGFydF9kYXRlIjtzOjU6ImxhYmVsIjtzOjU6Ik11bGFpIjtzOjg6ImlzSGlkZGVuIjtiOjA7czo5OiJpc1RvZ2dsZWQiO2I6MTtzOjEyOiJpc1RvZ2dsZWFibGUiO2I6MDtzOjI0OiJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiO047fWk6NDthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czo4OiJlbmRfZGF0ZSI7czo1OiJsYWJlbCI7czo3OiJTZWxlc2FpIjtzOjg6ImlzSGlkZGVuIjtiOjA7czo5OiJpc1RvZ2dsZWQiO2I6MTtzOjEyOiJpc1RvZ2dsZWFibGUiO2I6MDtzOjI0OiJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiO047fWk6NTthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czo3OiJwdXJwb3NlIjtzOjU6ImxhYmVsIjtzOjk6IktlcGVybHVhbiI7czo4OiJpc0hpZGRlbiI7YjowO3M6OToiaXNUb2dnbGVkIjtiOjE7czoxMjoiaXNUb2dnbGVhYmxlIjtiOjA7czoyNDoiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjtOO31pOjY7YTo3OntzOjQ6InR5cGUiO3M6NjoiY29sdW1uIjtzOjQ6Im5hbWUiO3M6Njoic3RhdHVzIjtzOjU6ImxhYmVsIjtzOjY6IlN0YXR1cyI7czo4OiJpc0hpZGRlbiI7YjowO3M6OToiaXNUb2dnbGVkIjtiOjE7czoxMjoiaXNUb2dnbGVhYmxlIjtiOjA7czoyNDoiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjtOO319fXM6ODoiZmlsYW1lbnQiO2E6MDp7fX0=', 1772619160);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `region_id` bigint UNSIGNED NOT NULL,
  `username` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `region_id`, `username`, `password`, `role`, `created_at`, `updated_at`) VALUES
(1, 1, 'admin', '$2y$12$Q4pQcLp8iGgSLH6b6vOsde5u2h4oM1TPuX38HU6HlyP2oR0eyRYiG', 'admin', '2026-03-03 21:44:30', '2026-03-03 23:39:12'),
(2, 2, 'zaidun', '$2y$12$Pv1EuxV1QRB4HxCBT5AsxesZuno3SfaYZPmfu8W1Tyl0k5RHkj.TG', 'approver', '2026-03-03 23:38:57', '2026-03-04 00:58:43'),
(3, 5, 'bakrun', '$2y$12$rCdLWLTqAHW3ICi0VXo.IOMdEWcxOPa9l7er0qWhvjaIUlctRbmbi', 'approver', '2026-03-03 23:41:07', '2026-03-04 00:59:08');

-- --------------------------------------------------------

--
-- Table structure for table `vehicles`
--

CREATE TABLE `vehicles` (
  `id` bigint UNSIGNED NOT NULL,
  `region_id` bigint UNSIGNED NOT NULL,
  `vehicle_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `licenses_plate` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ownership` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fuel_consumption_rate` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `vehicles`
--

INSERT INTO `vehicles` (`id`, `region_id`, `vehicle_name`, `licenses_plate`, `type`, `ownership`, `fuel_consumption_rate`, `created_at`, `updated_at`) VALUES
(1, 4, 'Mobil Avanza', 'B 1234 SOP', 'Angkutan Orang', 'Milik Perusahaan', 20, '2026-03-04 00:18:03', '2026-03-04 00:18:03'),
(2, 2, 'Mobil Truck', 'B 4321 APS', 'Angkutan Barang', 'Sewaan', 25, '2026-03-04 00:21:18', '2026-03-04 00:21:18');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bookings_admin_id_foreign` (`admin_id`),
  ADD KEY `bookings_vehicle_id_foreign` (`vehicle_id`),
  ADD KEY `bookings_driver_id_foreign` (`driver_id`),
  ADD KEY `bookings_approved_l1_id_foreign` (`approved_l1_id`),
  ADD KEY `bookings_approved_l2_id_foreign` (`approved_l2_id`);

--
-- Indexes for table `booking_approvals`
--
ALTER TABLE `booking_approvals`
  ADD PRIMARY KEY (`id`),
  ADD KEY `booking_approvals_booking_id_foreign` (`booking_id`),
  ADD KEY `booking_approvals_approver_id_foreign` (`approver_id`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`),
  ADD KEY `cache_expiration_index` (`expiration`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`),
  ADD KEY `cache_locks_expiration_index` (`expiration`);

--
-- Indexes for table `drivers`
--
ALTER TABLE `drivers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `exports`
--
ALTER TABLE `exports`
  ADD PRIMARY KEY (`id`),
  ADD KEY `exports_user_id_foreign` (`user_id`);

--
-- Indexes for table `failed_import_rows`
--
ALTER TABLE `failed_import_rows`
  ADD PRIMARY KEY (`id`),
  ADD KEY `failed_import_rows_import_id_foreign` (`import_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `fuel_logs`
--
ALTER TABLE `fuel_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fuel_logs_vehicle_id_foreign` (`vehicle_id`);

--
-- Indexes for table `imports`
--
ALTER TABLE `imports`
  ADD PRIMARY KEY (`id`),
  ADD KEY `imports_user_id_foreign` (`user_id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `regions`
--
ALTER TABLE `regions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `services_logs`
--
ALTER TABLE `services_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `services_logs_vehicle_id_foreign` (`vehicle_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `users_region_id_foreign` (`region_id`);

--
-- Indexes for table `vehicles`
--
ALTER TABLE `vehicles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vehicles_region_id_foreign` (`region_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `booking_approvals`
--
ALTER TABLE `booking_approvals`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `drivers`
--
ALTER TABLE `drivers`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `exports`
--
ALTER TABLE `exports`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `failed_import_rows`
--
ALTER TABLE `failed_import_rows`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fuel_logs`
--
ALTER TABLE `fuel_logs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `imports`
--
ALTER TABLE `imports`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `regions`
--
ALTER TABLE `regions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `services_logs`
--
ALTER TABLE `services_logs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `vehicles`
--
ALTER TABLE `vehicles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bookings`
--
ALTER TABLE `bookings`
  ADD CONSTRAINT `bookings_admin_id_foreign` FOREIGN KEY (`admin_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `bookings_approved_l1_id_foreign` FOREIGN KEY (`approved_l1_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `bookings_approved_l2_id_foreign` FOREIGN KEY (`approved_l2_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `bookings_driver_id_foreign` FOREIGN KEY (`driver_id`) REFERENCES `drivers` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `bookings_vehicle_id_foreign` FOREIGN KEY (`vehicle_id`) REFERENCES `vehicles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `booking_approvals`
--
ALTER TABLE `booking_approvals`
  ADD CONSTRAINT `booking_approvals_approver_id_foreign` FOREIGN KEY (`approver_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `booking_approvals_booking_id_foreign` FOREIGN KEY (`booking_id`) REFERENCES `bookings` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `exports`
--
ALTER TABLE `exports`
  ADD CONSTRAINT `exports_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `failed_import_rows`
--
ALTER TABLE `failed_import_rows`
  ADD CONSTRAINT `failed_import_rows_import_id_foreign` FOREIGN KEY (`import_id`) REFERENCES `imports` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `fuel_logs`
--
ALTER TABLE `fuel_logs`
  ADD CONSTRAINT `fuel_logs_vehicle_id_foreign` FOREIGN KEY (`vehicle_id`) REFERENCES `vehicles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `imports`
--
ALTER TABLE `imports`
  ADD CONSTRAINT `imports_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `services_logs`
--
ALTER TABLE `services_logs`
  ADD CONSTRAINT `services_logs_vehicle_id_foreign` FOREIGN KEY (`vehicle_id`) REFERENCES `vehicles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_region_id_foreign` FOREIGN KEY (`region_id`) REFERENCES `regions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `vehicles`
--
ALTER TABLE `vehicles`
  ADD CONSTRAINT `vehicles_region_id_foreign` FOREIGN KEY (`region_id`) REFERENCES `regions` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
