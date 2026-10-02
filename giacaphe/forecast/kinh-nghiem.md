# Sổ học kinh nghiệm dự đoán giá cà phê

Cập nhật: 02/10/2026 07:35. Sổ giữ 60 ngày mốc gần nhất; mọi con số đo trên giá THẬT đã về, không con số nào do mô hình ngôn ngữ viết. Sai số tính bằng đ/kg (nội địa) hoặc USD/tấn (thế giới).

Đây là sổ nội bộ để cải thiện mô hình — không phải khuyến nghị mua bán.

## Trung bình 4 tỉnh

Đã ghi 19 mốc dự đoán, 18 mốc đã có giá thật để chấm.

### Sai số theo tầm dự đoán

| Tầm (ngày) | Số lần | Sai số TB | Đứng yên | Dải 90% phủ |
|---|---|---|---|---|
| 1 | 18 | 162 đ | 417 đ | 100% |
| 2 | 17 | 458 đ | 612 đ | 100% |
| 3 | 16 | 627 đ | 844 đ | 100% |
| 4 | 15 | 802 đ | 1.060 đ | 93% |
| 5 | 14 | 994 đ | 1.136 đ | 93% |
| 6 | 13 | 1.074 đ | 1.223 đ | 92% |
| 7 | 12 | 1.267 đ | 1.325 đ | 92% |

### Ngày-1: mô hình so với đứng yên

Trên 18 lần đo: sai số TB **162 đ**, đứng yên **417 đ**, đúng chiều 72%, dải 90% phủ 100%.
→ Mô hình **đang thắng** mốc đứng yên (−255 đ).

### Từng lớp giúp hay hại (ngày-1)

| Lớp | Có tiếng nói | Đúng chiều | Nếu bỏ lớp, sai số TB | Kết luận |
|---|---|---|---|---|
| truyền dẫn London | 13 | 85% | 419 đ | giúp (+257 đ) |
| tín hiệu sàn | 0 | — | 162 đ | chưa có tiếng nói |
| xu hướng gần | 0 | — | 162 đ | chưa có tiếng nói |
| AI điều tiết | 11 | 46% | 133 đ | hại (−29 đ) |

### Từng lớp AI riêng (ngày-1)

| Lớp AI | Có tiếng nói | Đúng chiều | Nếu bỏ riêng lớp, sai số TB | Kết luận |
|---|---|---|---|---|
| tâm lý bản tin | 11 | 55% | 149 đ | hại (−13 đ) |
| đề xuất lệch sàn | 4 | 0% | 162 đ | không đổi |
| cung–cầu thế giới (GLM) | 8 | 50% | 147 đ | hại (−15 đ) |

### GLM theo đồng thuận kỹ thuật–tin

| Đồng thuận | Số lần | Sai số TB | Nếu bỏ GLM |
|---|---|---|---|
| kỹ thuật và tin cùng chiều | 7 | 258 đ | 231 đ |
| không rõ | 1 | 178 đ | 102 đ |

Luật chốt trước: cần ≥ 20 mẫu "ngược chiều" (hiện 0) rồi mới xét hạ trọng số GLM ở nhóm đó.

### Phân loại lỗi ngày-1

- đúng chiều, vừa: 6 lần
- đứng yên, đoán đứng yên: 6 lần
- bỏ lỡ cú đi: 3 lần
- đúng chiều, quá tay: 2 lần
- đúng chiều, non tay: 1 lần

Tỷ lệ truyền dẫn thực (giá trong nước chép bao nhiêu phần cú đi của sàn London, trung vị trên 9 ngày sàn đi ≥ +0,50%): **0,40**.

### Hiệu chỉnh hệ số truyền dẫn (beta)

Đang dùng **beta 0,5** (mặc định 0,5). chưa đủ mẫu (10/20) — dùng beta mặc định 0,5.

| beta | Sai số TB nếu dùng |
|---|---|
| 0,3 | 340 đ |
| 0,4 | 256 đ |
| 0,5 | 220 đ |
| 0,6 | 291 đ |
| 0,7 | 384 đ |
| 0,8 | 499 đ |

### Năm lỗi lớn nhất và lý do

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
- **24/09/2026** (mốc 23/09/2026), sai 274 đ:
  - Đúng chiều, vừa: giá đi +1.000 đ, dự đoán +726 đ.
  - Lớp truyền dẫn London đúng chiều (+811 đ), bớt được 811 đ sai số.
  - Lớp AI điều tiết kéo sai chiều (−85 đ), làm sai số tăng 85 đ.

## Các chuỗi khác — ngày-1

| Chuỗi | Số lần | Sai số TB | Đứng yên | Đúng chiều | Dải 90% phủ |
|---|---|---|---|---|---|
| Đắk Lắk | 18 | 168 đ | 422 đ | 72% | 100% |
| Lâm Đồng | 18 | 161 đ | 417 đ | 72% | 100% |
| Gia Lai | 18 | 168 đ | 422 đ | 72% | 100% |
| Đắk Nông | 18 | 162 đ | 417 đ | 72% | 100% |
| Robusta London | 14 | 43 USD | 42 USD | 43% | 93% |
| Arabica New York | 14 | 112 USD | 119 USD | 64% | 93% |

## Cách đọc

- **Đứng yên** là sai số nếu chỉ đoán "ngày mai bằng hôm nay" — mốc đối chứng khó thắng nhất. Mô hình phải thắng cột này mới đáng giữ.
- **Nếu bỏ lớp** là sai số trung bình khi trừ phần đóng góp của lớp đó ra khỏi dự đoán, tính trên đúng đầu vào đã ghi lúc dự đoán. Lớn hơn sai số thật nghĩa là lớp đó đang giúp.
- **Dải 90% phủ** là tỷ lệ ngày giá thật rơi trong dải thấp–cao mô hình vẽ. Mục tiêu ~90%: thấp hơn nhiều là dải đang hẹp hơn sự thật.
- Hiệu chỉnh beta theo luật chốt trước: cần ≥ 20 mẫu có truyền dẫn, beta mới phải giảm sai số ≥ 3% so với beta đang dùng, và chỉ chọn trong lưới 0,3, 0,4, 0,5, 0,6, 0,7, 0,8.
