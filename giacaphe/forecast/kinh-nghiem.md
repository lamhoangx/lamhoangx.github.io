# Sổ học kinh nghiệm dự đoán giá cà phê

Cập nhật: 03/10/2026 19:30. Sổ giữ 60 ngày mốc gần nhất; mọi con số đo trên giá THẬT đã về, không con số nào do mô hình ngôn ngữ viết. Sai số tính bằng đ/kg (nội địa) hoặc USD/tấn (thế giới).

Đây là sổ nội bộ để cải thiện mô hình — không phải khuyến nghị mua bán.

## Trung bình 4 tỉnh

Đã ghi 20 mốc dự đoán, 19 mốc đã có giá thật để chấm.

### Sai số theo tầm dự đoán

| Tầm (ngày) | Số lần | Sai số TB | Đứng yên | Dải 90% phủ |
|---|---|---|---|---|
| 1 | 19 | 206 đ | 442 đ | 100% |
| 2 | 18 | 481 đ | 572 đ | 100% |
| 3 | 17 | 575 đ | 765 đ | 100% |
| 4 | 16 | 754 đ | 950 đ | 94% |
| 5 | 15 | 895 đ | 1.027 đ | 93% |
| 6 | 14 | 964 đ | 1.100 đ | 93% |
| 7 | 13 | 1.148 đ | 1.185 đ | 92% |

### Ngày-1: mô hình so với đứng yên

Trên 19 lần đo: sai số TB **206 đ**, đứng yên **442 đ**, đúng chiều 74%, dải 90% phủ 100%.
→ Mô hình **đang thắng** mốc đứng yên (−236 đ).

### Từng lớp giúp hay hại (ngày-1)

| Lớp | Có tiếng nói | Đúng chiều | Nếu bỏ lớp, sai số TB | Kết luận |
|---|---|---|---|---|
| truyền dẫn London | 14 | 86% | 445 đ | giúp (+239 đ) |
| tín hiệu sàn | 0 | — | 206 đ | chưa có tiếng nói |
| xu hướng gần | 0 | — | 206 đ | chưa có tiếng nói |
| AI điều tiết | 11 | 46% | 178 đ | hại (−28 đ) |

### Từng lớp AI riêng (ngày-1)

| Lớp AI | Có tiếng nói | Đúng chiều | Nếu bỏ riêng lớp, sai số TB | Kết luận |
|---|---|---|---|---|
| tâm lý bản tin | 11 | 55% | 193 đ | hại (−13 đ) |
| đề xuất lệch sàn | 4 | 0% | 205 đ | hại (−1 đ) |
| cung–cầu thế giới (GLM) | 8 | 50% | 191 đ | hại (−15 đ) |

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
- đúng chiều, non tay: 1 lần
- bỏ lỡ cú đi lớn: 1 lần
- đoán cú đi không xảy ra: 1 lần

Tỷ lệ truyền dẫn thực (giá trong nước chép bao nhiêu phần cú đi của sàn London, trung vị trên 10 ngày sàn đi ≥ +0,50%): **0,29**.

### Hiệu chỉnh hệ số truyền dẫn (beta)

Đang dùng **beta 0,5** (mặc định 0,5). chưa đủ mẫu (11/20) — dùng beta mặc định 0,5.

| beta | Sai số TB nếu dùng |
|---|---|
| 0,3 | 316 đ |
| 0,4 | 244 đ |
| 0,5 | 217 đ |
| 0,6 | 286 đ |
| 0,7 | 376 đ |
| 0,8 | 487 đ |

### Năm lỗi lớn nhất và lý do

- **02/10/2026** (mốc 01/10/2026), sai 841 đ:
  - Bỏ lỡ cú đi lớn: giá đi −800 đ, dự đoán +41 đ.
- **01/10/2026** (mốc 30/09/2026), sai 519 đ:
  - Đúng chiều, non tay: giá đi +1.000 đ, dự đoán +481 đ.
  - Lớp truyền dẫn London đúng chiều (+481 đ), bớt được 481 đ sai số.
  - Giá trong nước chép 0,96 lần cú đi +1,11% của sàn (hệ số truyền dẫn đang dùng 0,5).
- **17/09/2026** (mốc 16/09/2026), sai 512 đ:
  - Đúng chiều, quá tay: giá đi −300 đ, dự đoán −812 đ.
  - Sàn London đi thêm −1,52% sau lượt dự đoán — phần này lượt dự đoán chưa thể biết.
  - Giá trong nước chép 0,11 lần cú đi −3,00% của sàn (hệ số truyền dẫn đang dùng 0,5).
- **29/09/2026** (mốc 28/09/2026), sai 398 đ:
  - Đúng chiều, quá tay: giá đi +200 đ, dự đoán +598 đ.
  - Giá trong nước chép 0,16 lần cú đi +1,34% của sàn (hệ số truyền dẫn đang dùng 0,5).
- **25/09/2026** (mốc 24/09/2026), sai 300 đ:
  - Bỏ lỡ cú đi: giá đi −300 đ, dự đoán 0 đ.
  - Sàn London đi thêm −0,91% sau lượt dự đoán — phần này lượt dự đoán chưa thể biết.
  - Giá trong nước chép 0,40 lần cú đi −0,81% của sàn (hệ số truyền dẫn đang dùng 0,5).

## Các chuỗi khác — ngày-1

| Chuỗi | Số lần | Sai số TB | Đứng yên | Đúng chiều | Dải 90% phủ |
|---|---|---|---|---|---|
| Đắk Lắk | 19 | 206 đ | 453 đ | 74% | 100% |
| Lâm Đồng | 19 | 196 đ | 453 đ | 74% | 100% |
| Gia Lai | 19 | 206 đ | 453 đ | 74% | 100% |
| Đắk Nông | 19 | 210 đ | 437 đ | 68% | 100% |
| Robusta London | 16 | 38 USD | 38 USD | 44% | 94% |
| Arabica New York | 16 | 103 USD | 109 USD | 62% | 94% |

## Cách đọc

- **Đứng yên** là sai số nếu chỉ đoán "ngày mai bằng hôm nay" — mốc đối chứng khó thắng nhất. Mô hình phải thắng cột này mới đáng giữ.
- **Nếu bỏ lớp** là sai số trung bình khi trừ phần đóng góp của lớp đó ra khỏi dự đoán, tính trên đúng đầu vào đã ghi lúc dự đoán. Lớn hơn sai số thật nghĩa là lớp đó đang giúp.
- **Dải 90% phủ** là tỷ lệ ngày giá thật rơi trong dải thấp–cao mô hình vẽ. Mục tiêu ~90%: thấp hơn nhiều là dải đang hẹp hơn sự thật.
- Hiệu chỉnh beta theo luật chốt trước: cần ≥ 20 mẫu có truyền dẫn, beta mới phải giảm sai số ≥ 3% so với beta đang dùng, và chỉ chọn trong lưới 0,3, 0,4, 0,5, 0,6, 0,7, 0,8.
