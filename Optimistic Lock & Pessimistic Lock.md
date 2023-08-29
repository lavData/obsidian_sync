#tech #database 

---
# [Optimistic lock và Pessimistic lock](https://viblo.asia/p/009-optimistic-lock-va-pessimistic-lock-L4x5xr7aZBM)


⏰ Pessimistic lock hoạt động tương tự như trò chơi trên. Khi transaction T(1) start và modify data, nó sẽ thực hiện lock row, page hoặc table tùy thuộc vào điều kiện query. Các transaction T(x) sau không thể modify data trên row đó mà bắt buộc phải chờ cho đến khi T(1) hoàn thành.

⏲︎
- Fetch data kèm theo version hiện tại. Tất cả các transaction đều có thể fetch data mà không lo ngại vấn đề blocking.
- Update data, đồng thời thêm một version mới.
- Commit transaction. Bây giờ mới là lúc acquire lock. Bác Gấu kiểm tra version cũ của record đó có trùng với version hiện tại mà bác Gấu biết không. Nếu đúng thì cho phép update, đồng thời cập nhật version mới của data. Sau đó release lock. Nếu sai version thì.. tất nhiên rồi, lệnh update không thành công.

