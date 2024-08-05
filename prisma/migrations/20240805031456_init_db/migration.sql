/*
  Warnings:

  - You are about to drop the column `createAt` on the `Barbershop` table. All the data in the column will be lost.
  - You are about to drop the column `imageUrls` on the `Barbershop` table. All the data in the column will be lost.
  - You are about to drop the column `phone` on the `Barbershop` table. All the data in the column will be lost.
  - You are about to drop the column `barbershopId` on the `Booking` table. All the data in the column will be lost.
  - You are about to drop the column `createAt` on the `User` table. All the data in the column will be lost.
  - Added the required column `imageUrl` to the `Barbershop` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "Booking" DROP CONSTRAINT "Booking_barbershopId_fkey";

-- AlterTable
ALTER TABLE "Barbershop" DROP COLUMN "createAt",
DROP COLUMN "imageUrls",
DROP COLUMN "phone",
ADD COLUMN     "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "imageUrl" TEXT NOT NULL,
ADD COLUMN     "phones" TEXT[];

-- AlterTable
ALTER TABLE "Booking" DROP COLUMN "barbershopId";

-- AlterTable
ALTER TABLE "User" DROP COLUMN "createAt",
ADD COLUMN     "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP;
