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