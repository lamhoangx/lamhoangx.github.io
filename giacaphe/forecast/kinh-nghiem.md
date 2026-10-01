# Sổ học kinh nghiệm dự đoán giá cà phê

Cập nhật: 01/10/2026 07:35. Sổ giữ 60 ngày mốc gần nhất; mọi con số đo trên giá THẬT đã về, không con số nào do mô hình ngôn ngữ viết. Sai số tính bằng đ/kg (nội địa) hoặc USD/tấn (thế giới).

Đây là sổ nội bộ để cải thiện mô hình — không phải khuyến nghị mua bán.

## Trung bình 4 tỉnh

Đã ghi 18 mốc dự đoán, 17 mốc đã có giá thật để chấm.

### Sai số theo tầm dự đoán

| Tầm (ngày) | Số lần | Sai số TB | Đứng yên | Dải 90% phủ |
|---|---|---|---|---|
| 1 | 17 | 167 đ | 382 đ | 100% |
| 2 | 16 | 427 đ | 550 đ | 100% |
| 3 | 15 | 631 đ | 780 đ | 100% |
| 4 | 14 | 759 đ | 993 đ | 93% |
| 5 | 13 | 915 đ | 1.069 đ | 92% |
| 6 | 12 | 980 đ | 1.158 đ | 92% |
| 7 | 11 | 1.182 đ | 1.164 đ | 91% |

### Ngày-1: mô hình so với đứng yên

Trên 17 lần đo: sai số TB **167 đ**, đứng yên **382 đ**, đúng chiều 71%, dải 90% phủ 100%.
→ Mô hình **đang thắng** mốc đứng yên (−215 đ).

### Từng lớp giúp hay hại (ngày-1)

| Lớp | Có tiếng nói | Đúng chiều | Nếu bỏ lớp, sai số TB | Kết luận |
|---|---|---|---|---|
| truyền dẫn London | 12 | 83% | 385 đ | giúp (+218 đ) |
| tín hiệu sàn | 0 | — | 167 đ | chưa có tiếng nói |
| xu hướng gần | 0 | — | 167 đ | chưa có tiếng nói |
| AI điều tiết | 11 | 46% | 136 đ | hại (−31 đ) |

### Từng lớp AI riêng (ngày-1)

| Lớp AI | Có tiếng nói | Đúng chiều | Nếu bỏ riêng lớp, sai số TB | Kết luận |
|---|---|---|---|---|
| tâm lý bản tin | 11 | 55% | 153 đ | hại (−14 đ) |
| đề xuất lệch sàn | 4 | 0% | 167 đ | không đổi |
| cung–cầu thế giới (GLM) | 8 | 50% | 151 đ | hại (−16 đ) |

### GLM theo đồng thuận kỹ thuật–tin

| Đồng thuận | Số lần | Sai số TB | Nếu bỏ GLM |
|---|---|---|---|
| kỹ thuật và tin cùng chiều | 7 | 258 đ | 231 đ |
| không rõ | 1 | 178 đ | 102 đ |

Luật chốt trước: cần ≥ 20 mẫu "ngược chiều" (hiện 0) rồi mới xét hạ trọng số GLM ở nhóm đó.

### Phân loại lỗi ngày-1

- đúng chiều, vừa: 6 lần
- đứng yên, đoán đứng yên: 5 lần
- bỏ lỡ cú đi: 3 lần
- đúng chiều, quá tay: 2 lần
- đoán cú đi không xảy ra: 1 lần

Tỷ lệ truyền dẫn thực (giá trong nước chép bao nhiêu phần cú đi của sàn London, trung vị trên 8 ngày sàn đi ≥ +0,50%): **0,28**.

### Hiệu chỉnh hệ số truyền dẫn (beta)

Đang dùng **beta 0,5** (mặc định 0,5). chưa đủ mẫu (10/20) — dùng beta mặc định 0,5.

| beta | Sai số TB nếu dùng |
|---|---|
| 0,3 | 298 đ |
| 0,4 | 232 đ |
| 0,5 | 217 đ |
| 0,6 | 306 đ |
| 0,7 | 419 đ |
| 0,8 | 553 đ |

### Năm lỗi lớn nhất và lý do

- **17/09/2026** (mốc 16/09/2026), sai 512 đ:
  - Đúng chiều, quá tay: giá đi −300 đ, dự đoán −812 đ.
  - Sàn London đi thêm −1,52% sau lượt dự đoán — phần này lượt dự đoán chưa thể biết.
  - Giá trong nước chép 0,11 lần cú đi −3,00% của sàn (hệ số truyền dẫn đang dùng 0,5).
- **01/10/2026** (mốc 30/09/2026), sai 481 đ:
  - Đoán cú đi không xảy ra: giá đi 0 đ, dự đoán +481 đ.
  - Lớp truyền dẫn London kéo sai chiều (+481 đ), làm sai số tăng 481 đ.
- **29/09/2026** (mốc 28/09/2026), sai 398 đ:
  - Đúng chiều, quá tay: giá đi +200 đ, dự đoán +598 đ.
  - Giá trong nước chép 0,16 lần cú đi +1,34% của sàn (hệ số truyền dẫn đang dùng 0,5).
- **25/09/2026** (mốc 24/09/2026), sai 300 đ:
  - Bỏ lỡ cú đi: giá đi −300 đ, dự đoán 0 đ.
  - Sàn London đi thêm −0,91% sau lượt dự đoán — phần này lượt dự đoán chưa thể biết.
  - Giá trong nước chép 0,40 lần cú đi −0,81% của sàn (hệ số truyền dẫn đang dùng 0,5).
- **24/09/2026** (mốc 23/09/2026), sai 274 đ:
  - Đúng chiều, vừa: giá đi +1.000 đ, dự đoán +726 đ.
  - Lớp truyền dẫn London đúng chiều (+811 đ), bớt được 811 đ sai số.
  - Lớp AI điều tiết kéo sai chiều (−85 đ), làm sai số tăng 85 đ.

## Các chuỗi khác — ngày-1

| Chuỗi | Số lần | Sai số TB | Đứng yên | Đúng chiều | Dải 90% phủ |
|---|---|---|---|---|---|
| Đắk Lắk | 17 | 174 đ | 388 đ | 71% | 100% |
| Lâm Đồng | 17 | 166 đ | 382 đ | 71% | 100% |
| Gia Lai | 17 | 174 đ | 388 đ | 71% | 100% |
| Đắk Nông | 17 | 166 đ | 382 đ | 71% | 100% |
| Robusta London | 13 | 44 USD | 42 USD | 38% | 92% |
| Arabica New York | 13 | 108 USD | 116 USD | 69% | 92% |

## Cách đọc

- **Đứng yên** là sai số nếu chỉ đoán "ngày mai bằng hôm nay" — mốc đối chứng khó thắng nhất. Mô hình phải thắng cột này mới đáng giữ.
- **Nếu bỏ lớp** là sai số trung bình khi trừ phần đóng góp của lớp đó ra khỏi dự đoán, tính trên đúng đầu vào đã ghi lúc dự đoán. Lớn hơn sai số thật nghĩa là lớp đó đang giúp.
- **Dải 90% phủ** là tỷ lệ ngày giá thật rơi trong dải thấp–cao mô hình vẽ. Mục tiêu ~90%: thấp hơn nhiều là dải đang hẹp hơn sự thật.
- Hiệu chỉnh beta theo luật chốt trước: cần ≥ 20 mẫu có truyền dẫn, beta mới phải giảm sai số ≥ 3% so với beta đang dùng, và chỉ chọn trong lưới 0,3, 0,4, 0,5, 0,6, 0,7, 0,8.
