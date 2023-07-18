--------------------------------------------------------
--                                                    --
--                    Write query                     --
--                                                    --
--------------------------------------------------------

USE PASTRY_SHOP
GO

-- Câu 1:
-- - Tìm nhân viên tạo hóa đơn nhiều nhất
-- - Nghĩa

SELECT *
FROM Employee
WHERE Employee_ID = ANY (SELECT TOP 1 WITH TIES Employee_ID
						 FROM Bill
						 GROUP BY Employee_ID
						 ORDER BY COUNT(Bill_ID) DESC)

-- Câu 2:
-- - Hiển thị lịch sử mua hàng của khách hàng thành viên có SĐT là 0956789012
-- - Chương

-- Câu 3:
-- - Hiển thị số lần được áp dụng của các voucher
-- - Vương
SELECT      v.Voucher_ID AS [Voucher ID],
            COUNT(*) AS [Total times applied]

FROM        Voucher v LEFT JOIN Bill b ON v.Voucher_ID = b.Voucher_ID
GROUP BY    v.Voucher_ID
ORDER BY    [Total times applied] DESC

-- Câu 4:
-- - Hiển thị danh sách hóa đơn của nhân viên Nguyễn Thị Thúy
-- - Nghĩa

SELECT *
FROM Bill
WHERE Employee_ID = (SELECT Employee_ID
					 FROM Employee
					 WHERE Employee_Name = N'Nguyễn Thị Thúy')

-- Câu 5:
-- - Hiển thị tổng doanh thu của mỗi tháng
-- - Vương
SELECT      YEAR(b.Create_Date) AS [Year],
            MONTH(b.Create_Date) AS [Month],
            SUM(b.Final_Price) AS [Total revenue]
            
FROM        Bill b
GROUP BY    YEAR(b.Create_Date),
            MONTH(b.Create_Date)

-- Câu 6:
-- - Hiển thị sản phẩm best seller của tháng 7
-- - Thúy

-- Câu 7:
-- - Hiển thị khách hàng thành viên có hóa đơn mua lớn nhất trong tháng 6 và thông tin hóa đơn đó
-- - Thông tin hóa đơn cần hiển thị: mã hóa đơn, số tiền khách đã chi trả
-- - Thúy

-- Câu 8:
-- - Hiển thị thông tin sản phẩm có số lượng mua nhiều nhất của các khách hàng vãng lai
-- - Thông tin sản phẩm cần hiển thị: Tên sản phẩn, giá sản phẩm, số lượng đã bán ra
-- - Chương