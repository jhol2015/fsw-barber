/*
  Warnings:

  - You are about to drop the column `babershopId` on the `BarbershopService` table. All the data in the column will be lost.
  - You are about to drop the column `imageUrls` on the `BarbershopService` table. All the data in the column will be lost.
  - You are about to drop the column `createAt` on the `Booking` table. All the data in the column will be lost.
  - Added the required column `imageUrl` to the `BarbershopService` table without a default value. This is not possible if the table is not empty.
  - Made the column `barbershopId` on table `BarbershopService` required. This step will fail if there are existing NULL values in that column.

*/
-- DropForeignKey
ALTER TABLE "BarbershopService" DROP CONSTRAINT "BarbershopService_barbershopId_fkey";

-- DropForeignKey
ALTER TABLE "Booking" DROP CONSTRAINT "Booking_barbershopId_fkey";

-- DropIndex
DROP INDEX "User_email_key";

-- AlterTable
ALTER TABLE "BarbershopService" DROP COLUMN "babershopId",
DROP COLUMN "imageUrls",
ADD COLUMN     "imageUrl" TEXT NOT NULL,
ALTER COLUMN "barbershopId" SET NOT NULL;

-- AlterTable
ALTER TABLE "Booking" DROP COLUMN "createAt",
ADD COLUMN     "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ALTER COLUMN "barbershopId" DROP NOT NULL;

-- AddForeignKey
ALTER TABLE "BarbershopService" ADD CONSTRAINT "BarbershopService_barbershopId_fkey" FOREIGN KEY ("barbershopId") REFERENCES "Barbershop"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Booking" ADD CONSTRAINT "Booking_barbershopId_fkey" FOREIGN KEY ("barbershopId") REFERENCES "Barbershop"("id") ON DELETE SET NULL ON UPDATE CASCADE;
