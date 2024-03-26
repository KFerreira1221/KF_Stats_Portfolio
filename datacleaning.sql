Select *
From [portfolio].[dbo].[Nashville Housing Data for Data Cleaning]

Update [portfolio].[dbo].[Nashville Housing Data for Data Cleaning]
SET SaleDate = CONVERT(Date,SaleDate)

Update [portfolio].[dbo].[Nashville Housing Data for Data Cleaning]
SET SaleDateConverted = CONVERT(Date,SaleDate)

Select *
From [portfolio].[dbo].[Nashville Housing Data for Data Cleaning]
order by ParcelID

Select a.ParcelID, a.PropertyAddress, b.ParcelID, b.PropertyAddress, ISNULL(a.PropertyAddress,b.PropertyAddress)
From [portfolio].[dbo].[Nashville Housing Data for Data Cleaning] a
JOIN [portfolio].[dbo].[Nashville Housing Data for Data Cleaning] b
	on a.ParcelID = b.ParcelID
	AND a.[UniqueID ] <> b.[UniqueID ]
Where a.PropertyAddress is null

Update a
SET PropertyAddress = ISNULL(a.PropertyAddress,b.PropertyAddress)
From [portfolio].[dbo].[Nashville Housing Data for Data Cleaning] a
JOIN [portfolio].[dbo].[Nashville Housing Data for Data Cleaning] b
	on a.ParcelID = b.ParcelID
	AND a.[UniqueID ] <> b.[UniqueID ]
Where a.PropertyAddress is null

Select PropertyAddress
From [portfolio].[dbo].[Nashville Housing Data for Data Cleaning]

SELECT
SUBSTRING(PropertyAddress, 1, CHARINDEX(',', PropertyAddress) -1 ) as Address
, SUBSTRING(PropertyAddress, CHARINDEX(',', PropertyAddress) + 1 , LEN(PropertyAddress)) as Address

From [portfolio].[dbo].[Nashville Housing Data for Data Cleaning]

Update [portfolio].[dbo].[Nashville Housing Data for Data Cleaning]
SET PropertySplitAddress = SUBSTRING(PropertyAddress, 1, CHARINDEX(',', PropertyAddress) -1 )

ALTER TABLE NashvilleHousing
Add PropertySplitCity Nvarchar(255);

Update [portfolio].[dbo].[Nashville Housing Data for Data Cleaning]
SET PropertySplitCity = SUBSTRING(PropertyAddress, CHARINDEX(',', PropertyAddress) + 1 , LEN(PropertyAddress))

Select OwnerAddress
From [portfolio].[dbo].[Nashville Housing Data for Data Cleaning]

Select
PARSENAME(REPLACE(OwnerAddress, ',', '.') , 3)
,PARSENAME(REPLACE(OwnerAddress, ',', '.') , 2)
,PARSENAME(REPLACE(OwnerAddress, ',', '.') , 1)
From [portfolio].[dbo].[Nashville Housing Data for Data Cleaning]

ALTER TABLE portfolio].[dbo].[Nashville Housing Data for Data Cleaning]
Add OwnerSplitAddress Nvarchar(255);

Update portfolio].[dbo].[Nashville Housing Data for Data Cleaning]
SET OwnerSplitAddress = PARSENAME(REPLACE(OwnerAddress, ',', '.') , 3)

ALTER TABLE portfolio].[dbo].[Nashville Housing Data for Data Cleaning]
Add OwnerSplitCity Nvarchar(255);

Update portfolio].[dbo].[Nashville Housing Data for Data Cleaning]
SET OwnerSplitCity = PARSENAME(REPLACE(OwnerAddress, ',', '.') , 2)

ALTER TABLE portfolio].[dbo].[Nashville Housing Data for Data Cleaning]
Add OwnerSplitState Nvarchar(255);

Update portfolio].[dbo].[Nashville Housing Data for Data Cleaning]
SET OwnerSplitState = PARSENAME(REPLACE(OwnerAddress, ',', '.') , 1)

Select *
From [portfolio].[dbo].[Nashville Housing Data for Data Cleaning]

Select Distinct(SoldAsVacant), Count(SoldAsVacant)
From [portfolio].[dbo].[Nashville Housing Data for Data Cleaning]
Group by SoldAsVacant
order by 2

Select SoldAsVacant
, CASE When SoldAsVacant = 'Y' THEN 'Yes'
	   When SoldAsVacant = 'N' THEN 'No'
	   ELSE SoldAsVacant
	   END
From [portfolio].[dbo].[Nashville Housing Data for Data Cleaning]

Update [portfolio].[dbo].[Nashville Housing Data for Data Cleaning]
SET SoldAsVacant = CASE When SoldAsVacant = 'Y' THEN 'Yes'
	   When SoldAsVacant = 'N' THEN 'No'
	   ELSE SoldAsVacant
	   END

WITH RowNumCTE AS(
Select *,
	ROW_NUMBER() OVER (
	PARTITION BY ParcelID,
				 PropertyAddress,
				 SalePrice,
				 SaleDate,
				 LegalReference
				 ORDER BY
					UniqueID
					) row_num

From [portfolio].[dbo].[Nashville Housing Data for Data Cleaning]
--order by ParcelID
)
Select *
From RowNumCTE
Where row_num > 1
Order by PropertyAddress

Select *
From [portfolio].[dbo].[Nashville Housing Data for Data Cleaning]

ALTER TABLE PortfolioProject.dbo.NashvilleHousing
DROP COLUMN OwnerAddress, TaxDistrict, PropertyAddress, SaleDate