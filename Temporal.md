# Proposal Solution
- Chạy bằng table Billservice
	- Sự khác nhau giữa Billsercie và BillServiceHis.


- Anh @sơn ơi, em đang cần tìm phương án chạy near-realtime hoàn chỉnh cho event BookingCompleted (không hoàn chỉnh bởi vì event BookingCompleted phụ thuộc vào table **billservicehis**, nhưng có một lượng record của table này được insert vào không theo thứ tự time state, nên em set 1 job chạy refill các recrod bị hụt này mỗi ngày một lần -> những event bị hụt sẽ vào cdp sẽ bị lag trong khoảng 1 ngày). Em đang tìm 

- Anh @sơn ơi, vì có vài nhu cầu improve kĩ thuật nên em  có vài câu hỏi: 
	- Field pending  trong billservice có ý nghĩa là gì, cứ xuất hiện trong billservice thì được xem booking completed?
	- Sự khác biệt về mechanism giữa billservicehis và billservice là gì vậy ạ?
- Em có kiểm tra ở table billservicehis thì vẫn có nhiều bill có pending bằng 1 anh ạ, nghĩa là sao anh.
- Vì nhu cầu upgrade data spec nên em cần thêm view aggregated_staff, em gửi anh logic tạo view anh tạo giúp em với ạ.

----
| field name | whereabouts |
| ---------- | ----------- |
| stylist_id    | Staff_Hairdresser_Id  trong table billservicehis                                                  |
| stylist_name  | Join billservicehis bsh với staff s  where bsh.Staff_Hairdresser_id = s.Id lấy field s.FullName   |
| stylist_level | Join billservicehis bsh với staff s  where bsh.Staff_Hairdresser_id = s.Id lấy field s.SkillLevel |


-------------


Rule:  Số lần sử dụng dv của stylist: Tính trong vòng 1 năm

---

6929919



------------
- Em thấy mình đang misunderstanding ấy anh, em đang nói đến việc miss event bên em khi sử dụng table billservicehis. Lý do bị miss liên quan đến việc bọn em kéo data bằng cách sử dụng state management -> nếu record được chèn vào không theo thứ tự thời gian thì sẽ bị miss event.

→ Do đó, nếu sử dụng field Created date và Update date của **billservicehis** thì đang có vấn đề khiến **miss event**.


Em cần hiểu logic giữa billservice và billservicehis:
- billservicehis chỉ là một replicate của billservice? Vậy nếu billservice có update gì, em cũng update theo ở bên em thì đảm bảo data sẽ đủ, đúng
- Định nghĩ một bill hoàn thành bên anh là gì? Ở trong script Gen_CustomerInteractionLogsCDP em thấy anh chỉ lấy những record có IsDeleted = 0 và Pending = 0 ở table billservicehis.


---

# Clickhouse cleanup


1. Check volume storage.
2. Create table cleanup.
3. Check accuracy
4. Move data back
5. 


-----
Bởi vì engine CH mà team đang sử dụng (2024/1/3) là [ReplacingMergeTree](https://clickhouse.com/docs/en/engines/table-engines/mergetree-family/replacingmergetree), có nghĩa rằng có một số record duplicate chưa được clean up. Do đó, cần dùng `OPTIMIZE` statement to cleanup outdate data.

# Why
...

# How
Run the `OPTIMIZE` statement for each table that needs cleanup and statistics after the cleanup for a sanity check. Alert if have any deterioration














```
CREATE TABLE UAct_replace
(
    UserID UInt64,
    PageViews UInt8,
    Duration UInt8,
    Sign Int8
)
ENGINE = ReplacingMergeTree(UserId)
PARTITION BY Sign
ORDER By UserId;
```





















