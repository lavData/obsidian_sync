# Joining table

**Nested loop join**
- Duyệt qua từng table row.
- Với mỗi row, tiếp tục duyệt qua từng row của table còn lại. Chính là 2 vòng for lồng nhau.
- Đơn giản dễ dùng nhưng tốn kém.. hiệu năng.
**Hash join**
- Hash FK của table nhỏ hơn (số lượng row ít hơn).
- Lưu các giá trị hash đó vào **hash table** để thực hiện so sánh.
- Scan table lớn hơn, thực hiện hash FK và compare với các giá trị trong **hash table**. Tưởng giống **nested loop join** nhưng lại có sự khác biệt về mặt hiệu năng vì tốc độ truy xuất với **hash table** là O(1). Đổi lại là take time cho việc hash FK.
**Sort merge join**
- Sắp xếp cả 2 table.
- Các bước tiếp theo thực hiện giống nested loop join.
- Tuy nhiên sẽ dừng lại khi không tìm thấy các giá trị trùng nhau vì tận dụng lợi thế của **ordering**.

# Partitioning
Các **sub-table** cũng được coi là 1 table, có thể thực hiện **indexing** cho chúng. Từ đây dẫn đến 2 loại index cho **partitioning** là:

> - **Local index**: cho các sub-table thuộc table chính, lợi thế là giảm thời gian truy cập đến từng row trong **sub-table**.
> - **Global index**: cho table chính, tìm kiếm các record thuộc toàn bộ các **sub-table**.

# Bitmap index
**Bitmap index** có các tính chất:

> - Phù hợp với các column **low cardinality**.
> - Lưu bit cho mỗi giá trị nên giảm dung lượng lưu trữ cần dùng.
> - Chỉ hiệu quả với tìm kiếm **full match value**.
> - Kết hợp với nhiều index khác để tăng tốc độ với OR, AND.

Tuy nhiên, nó cũng có hạn chế:

> - Nếu thêm hoặc bớt một giá trị cần build lại toàn bộ **index table**. Với B-Tree index chỉ cần re-balance tree.
> - Riêng với PostgreSQL, **bitmap index** được lưu trên memory vì size của nó khá nhỏ, từ đó tăng tốc độ truy vấn. Vì vậy khi restart nó cần build lại toàn bộ **bitmap index**. Để tránh nhược điểm này, trong thực tế sẽ sử dụng kết hợp với column khác tạo thành **composite index**.

# Hash index
Một vài tính chất của **hash index** như sau:

> - Tốn ít dung lượng để lưu trữ hơn so với B-Tree index.
> - Tốc độ read/write nhanh hơn so với B-Tree index.
> - Không phù hợp với **ORDER BY** vì giá trị hash là không xác định.
> - Không phù hợp tìm kiếm theo khoảng giá trị.
> - Không thể tạo **composite index** với **hash index**.

## Hash index với nhiều column
Có 2 nguyên nhân chính:
> - Thứ nhất, **Hash index** chỉ phù hợp với các điều kiện so sánh bằng, chỉ tận dụng được khi toàn bộ các điều kiện của các column cùng là so sánh bằng.
> - Thứ hai, phần trên mình đề cập đến việc PostgreSQL sử dụng integer 32-bit để lưu các giá trị hash, tối đa hơn 4 tỉ. Việc một column hơn 4 tỉ giá trị unique gần như rất rất hiếm. Tuy nhiên với 2 column có số lượng giá trị là **m** và **n** thì tổng giá trị của hash value là **m * n**. Như vậy số lượng giá trị unique tối đa của column đã giảm xuống. Càng nhiều column số lượng giá trị tối đa càng giảm. Vậy nên hoàn toàn không phù hợp với **hash index**.

# Merge join
Trên thực tế, **merge join** chỉ phù hợp khi join các table có lượng data rất lớn vượt quá size của memory.

# Horizontal by range
Vì sao không thể tạo constraint PK hoặc unique (single column without partition column combination) với parent partition table? Cần tìm hiểu kĩ lại partition table là gì?

Bản chất của **partition** là chia một **logical table** ra thành nhiều **small physical pieces**. Lúc này table ENGINEER ban đầu mà ta định nghĩa chỉ là abstract table, định nghĩa ra các partition bao gồm những column nào, trường dữ liệu gì. Việc quyết định constraint unique sẽ apply cho toàn bộ các **partition**, điều đó khiến cho các **partition** phải liên hệ với nhau để check một value có là unique hay không, nó làm phá vỡ đi ý nghĩa **partition** ban đầu.

# Partition vs Sharding
**Partitioning** là việc chia tách các table theo chiều ngang nhưng nằm trên cùng một physical database/physical machine. **Sharding** cũng chia tách table theo chiều ngang nhưng các table nằm trên nhiều physical database/physical machine khác nhau, và thường **sharding** sử dụng PK làm **partition key**.