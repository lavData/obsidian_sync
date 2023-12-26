# Evaluation settings

4 real-world dataset:
- MovieLens 100K
- MiveLens 1m
- Lastfm 2K: tagged artists
- Foursquare New York: user checkin

=> Loại bỏ user nào có ít hơn 5 interactionsk.
![[Pasted image 20231215190819.png]]
Có sự chênh lệch cao giữa min max, độ lệch phương sai cao cũng thể hiện rằng có sự da dạng của quan sát cục bộ, hiệu suất có thể giảm so với tính toán tâp trung.

- Môi trường liên minh: Đây là một môi trường trong đó nhiều bên tham gia cùng một quá trình hoặc hệ thống mà không cần phải chia sẻ dữ liệu trực tiếp với nhau. Trong ngữ cảnh của bài báo, môi trường liên minh có thể ám chỉ việc nhiều người dùng hoặc thiết bị tham gia vào quá trình huấn luyện mô hình mà không cần phải tiết lộ dữ liệu cụ thể của họ cho nhau.

- Trường hợp cục bộ: Đây là tình huống hoặc điều kiện xảy ra tại mỗi thiết bị hoặc người dùng cụ thể trong một hệ thống phân tán. Trong ngữ cảnh của bài báo, trường hợp cục bộ có thể ám chỉ số lượng tương tác của mỗi người dùng với các mục hoặc số lượng dữ liệu mà mỗi thiết bị có sẵn để huấn luyện mô hình.

- Cài đặt tập trung: Đây là một mô hình hoặc hệ thống trong đó tất cả dữ liệu và quá trình xử lý được tập trung tại một nơi duy nhất. Trong ngữ cảnh của bài báo, cài đặt tập trung có thể ám chỉ việc tất cả dữ liệu huấn luyện và quá trình huấn luyện mô hình được thực hiện tại một trung tâm dữ liệu hoặc máy chủ duy nhất.


## Pre-processing.
- MovieLens 100K, number ratings -> implicit
- MiveLens 1m 
- Lastfm 2K: tagged artists => chỉ có thông tin user intecract  => không cần
- Foursquare New York: user checkin chỉ có thông tin user intecract  => không cần

## Phương pháp evaluatkje
Leave-one-out evaluation (thường được dùng trong lĩnh vực đề xuất sản phẩm).
Lấy cái cuối cùng tương tác làm kiểm tra, tương tác còn lại sẽ dùng để làm dữ liệu huấn luyện.

Mỗi sản phẩm. trong tập kiểm tra được ghép với 100 sản phẩm không được tương tác ngẫu nhiên => chuyển bài toán đề xuất thành bài toán xếp hạng.
Có thể metric 
Hit Ratio (HR): số lần xuất hiện trong Top-K 
Normalized Discounted Cumulative Gain (NDCG): Xem xét vị trí xếp hạng của sản phẩm thật so với vị trí xếp hạng của sản phẩm dự đoán, tính tỉ lệ chênh lệnh. 0 -> 1, giá trị càng cao thì thể hiện danh sách xếp hạng càng tốt.
K = 10
# Implêmntation details

phương pháp đề xuất: PyTorch
phương pháp khởi tạo Xavier
kích thước ẩn D = 12
số lớp ẩn  h = {48, 24, 12, 6}
Tất cả các trọng số được học bằng cách tối ưu hàm mất mát BCE, 4 tiêu cực cho mỗi tích cực
Tối ưu hóa adam với tốc độ học là 0.001
Trong mỗi thử nghiệm, 400 epoch, epoch cục bộ là 2.
Tìm kiếm theo lưới để tìm ra giá trị tới ưu c từ {10, 20, 50, 100, 200, 300, |P|} người tham gia mỗi vòng tổng hợp, trong đó |P| là tổng số người dùng có mặt trong tập dữ liệu. 

20, 120, 50 và 50 người cho mỗi tập dữ liệu dẫn đén mô hình cao nhất.

=> số lượng người tham gia trong một mô hình cục bộ có thể ảnh hưởng đến tham số c.

# Aggregation function impact
Hàm tổng hợp trọng số

Dùng các trọng số được cập nhật từ mô hình cục bộ để kết hợp tạo ra một bộ trọng số mới.

FedAvg
SimpleAvg
=> Không có cơ chể bảo vệ riêng tư
MF-FedAvg: truyền trọng số đơn giản từ ngừoi dùng đến máy chủ phổi hợp

HR@10

1. MF-FedAvg (Matrix Factorization Federated Averaging): - Được thiết kế để xử lý cập nhật của các yếu tố ẩn (latent factors) trong mô hình ma trận phân rã (matrix factorization). - Đã được thử nghiệm và cho thấy dẫn đến sự hội tụ nhanh hơn và chất lượng gợi ý cao hơn so với FedAvg trong các thử nghiệm. 
2. FedAvg (Federated Averaging): - Là một phương pháp tổng hợp phổ biến trong học máy phân tán, yêu cầu mỗi người dùng truyền tải các cập nhật tính toán của mình dưới dạng thông tin không mã hóa. - Có thể dẫn đến việc tiết lộ thông tin riêng tư nếu không được bảo vệ cẩn thận. 
3. SimpleAvg (Non-weighted Aggregation): - Là một phương pháp tổng hợp không có trọng số, đơn giản là lấy trung bình cộng của các thông tin được truyền tải từ các nguồn khác nhau. - Thường không hiệu quả bằng các phương pháp tổng hợp khác trong việc cải thiện chất lượng của mô hình gợi ý.

Đều bắt đầu với HR là 0.1:
- MF-FedAvg hội tụ nhanh hơn.
- → MF-FedAvg HR cao hơn 2-5% so với HR tương ứng của FedAvg.

Lý do:
- FedAvg phụ thuộc nặng vào số lượng ví dụ huấnl uyện cục bộ (số lượng dữ liệu mà mỗi thiết bị địa phương sử dụng để cập nhật mô hình). Trong khi MF không phụ thuộc nhiều.
- Còn MF-FedAvg tập trung vào số lượng người dùng cập nhật mỗi mục

# Data federation impact

So sánh chất lượng đề xuất vơi tốc độ hội tụ của FedNCF và NCF tập trung. 
- HR@10
- NDCG@10
→ 400 vòng huấn luyện

- GMF (Generalized Matrix Factorization) là một mô hình học máy dựa trên ma trận, nó sử dụng phép nhân ma trận để tính toán độ tương đồng giữa người dùng và các mục trong hệ thống đề xuất. 
- MLP (Multi-Layer Perceptron) là một mô hình học máy sử dụng mạng nơ-ron nhân tạo để tính toán độ tương đồng giữa người dùng và các mục trong hệ thống đề xuất. 
- NeuMF (Neural Collaborative Filtering) là một mô hình học máy kết hợp cả GMF và MLP để tính toán độ tương đồng giữa người dùng và các mục trong hệ thống đề xuất. Mô hình này sử dụng cả phép nhân ma trận và mạng nơ-ron nhân tạo để tính toán độ tương đồng và đưa ra đề xuất sản phẩm cho người dùng.

Fed yếu hơn tập trung
Nói về Fed
Neu vs FMF mạnh hơn MLP 180, 60 vòng, tận 400 vòng

FedNCF và NCF là 3% -> 16%, chấp nhận được.

# Efficiency comparision

Bằng cách đo lường các phép toán chấm động. FLOPS (Floating Point Operations) và kích thước của các tham số truyền đến máy chủ để tổng hợp trọng số sau đào tạo cục bộ.
=> FLOBS cho tháya tải việc tính toán

GMF cung cấp chi phí tính toán ít hơn 90 lần so với 2 cái còn lại.
Tham số cũng ít luôn.

Các kĩ thuật đơn giản sẽ ưa chuộng với các thiết bị tài nguyên thấp, NeuMF và GMF cũng cấp gần như các đề xuất tương đương.
NEUMF chuoonjg với các thiết bị tài nguyên cao.
=> Cân đối giữa chất lượng và độ phức tạp.

# Heterogeneity impact -> ảnh hưởng bởi sự đa dạng tài nguyên.

10.000 mẫu 16 cpu nhanh hơn 10% với 1 cpu
mẫu ảnh hưởng nhiều, nhưng tài nguyên cpu không ảnh hưởng quá nhiều. => model sẽ bị ảnh hưởng bởi số lượng mẫu chứ không phải tài nguyên

# Number of participants impact -> tác động của số lượng người tham gia.

Chất lượng đề xuất tương đương với cài đặt ban đầu.
Trung tâm: giảm 3%-7%
Liên kết: 1-6%

=> Số lượng người tăng thì chất lượng tăng => Các vòng huấn luyện bổ sung có thể dẫn đến đề xuất tốt hơn, thực tế các dữ liệu này không có sẵn trong môi trường trung tâm => học liên kết có tiềm năng vượt trội so với học tập trung.


# Secure aggregation impact (tác động của việc tổng hợp an toàn)

=> an toàn và bảo mật của hệ thống
Dùng để để 
