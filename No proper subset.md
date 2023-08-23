#note #english 

---
**Q**: Before we define 3NF, we recall that a candidate key is a minimal superkey—that is, a superkey no proper subset of which is also a superkey. no proper subset nghĩa là gì

**A**: Trong ngữ cảnh này, "no proper subset" có nghĩa là không có tập con thích hợp.

Trong lý thuyết cơ sở dữ liệu, một superkey là một tập hợp của một hoặc nhiều thuộc tính mà có khả năng duy nhất xác định một bản ghi trong một quan hệ. Một candidate key là một superkey tối thiểu, có nghĩa là không có tập con của nó cũng là một superkey.

Khi nói rằng "no proper subset of which is also a superkey" (không có tập con thích hợp của nó cũng là một superkey), nghĩa là không có tập con nào khác của candidate key đó cũng có khả năng duy nhất xác định một bản ghi trong quan hệ. Nói cách khác, không có một tập con nào nhỏ hơn của candidate key đó có thể được sử dụng để duy nhất xác định các bản ghi.

Điều này làm cho candidate key trở thành một tập hợp thuộc tính quan trọng và không thể rút gọn hơn để duy nhất xác định dữ liệu.