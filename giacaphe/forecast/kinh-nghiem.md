# Sổ học kinh nghiệm dự đoán giá cà phê

Cập nhật: 29/09/2026 07:00. Sổ giữ 60 ngày mốc gần nhất; mọi con số đo trên giá THẬT đã về, không con số nào do mô hình ngôn ngữ viết. Sai số tính bằng đ/kg (nội địa) hoặc USD/tấn (thế giới).

Đây là sổ nội bộ để cải thiện mô hình — không phải khuyến nghị mua bán.

## Trung bình 4 tỉnh

Đã ghi 16 mốc dự đoán, 15 mốc đã có giá thật để chấm.

### Sai số theo tầm dự đoán

| Tầm (ngày) | Số lần | Sai số TB | Đứng yên | Dải 90% phủ |
|---|---|---|---|---|
| 1 | 15 | 159 đ | 407 đ | 100% |
| 2 | 14 | 418 đ | 600 đ | 100% |
| 3 | 13 | 667 đ | 885 đ | 100% |
| 4 | 12 | 855 đ | 1.142 đ | 92% |
| 5 | 11 | 1.032 đ | 1.145 đ | 91% |
| 6 | 10 | 1.008 đ | 1.180 đ | 90% |
| 7 | 9 | 1.097 đ | 1.111 đ | 100% |

### Ngày-1: mô hình so với đứng yên

Trên 15 lần đo: sai số TB **159 đ**, đứng yên **407 đ**, đúng chiều 67%, dải 90% phủ 100%.
→ Mô hình **đang thắng** mốc đứng yên (−248 đ).

### Từng lớp giúp hay hại (ngày-1)

| Lớp | Có tiếng nói | Đúng chiều | Nếu bỏ lớp, sai số TB | Kết luận |
|---|---|---|---|---|
| truyền dẫn London | 10 | 80% | 410 đ | giúp (+251 đ) |
| tín hiệu sàn | 0 | — | 159 đ | chưa có tiếng nói |
| xu hướng gần | 0 | — | 159 đ | chưa có tiếng nói |
| AI điều tiết | 11 | 46% | 124 đ | hại (−35 đ) |

### Từng lớp AI riêng (ngày-1)

| Lớp AI | Có tiếng nói | Đúng chiều | Nếu bỏ riêng lớp, sai số TB | Kết luận |
|---|---|---|---|---|
| tâm lý bản tin | 11 | 55% | 143 đ | hại (−16 đ) |
| đề xuất lệch sàn | 4 | 0% | 159 đ | không đổi |
| cung–cầu thế giới (GLM) | 8 | 50% | 141 đ | hại (−18 đ) |

### GLM theo đồng thuận kỹ thuật–tin

| Đồng thuận | Số lần | Sai số TB | Nếu bỏ GLM |
|---|---|---|---|
| kỹ thuật và tin cùng chiều | 7 | 287 đ | 259 đ |
| không rõ | 1 | 178 đ | 102 đ |

Luật chốt trước: cần ≥ 20 mẫu "ngược chiều" (hiện 0) rồi mới xét hạ trọng số GLM ở nhóm đó.

### Phân loại lỗi ngày-1

- đúng chiều, vừa: 6 lần
- đứng yên, đoán đứng yên: 5 lần
- bỏ lỡ cú đi: 2 lần
- đúng chiều, quá tay: 1 lần
- đoán cú đi không xảy ra: 1 lần

Tỷ lệ truyền dẫn thực (giá trong nước chép bao nhiêu phần cú đi của sàn London, trung vị trên 7 ngày sàn đi ≥ +0,50%): **0,40**.

### Hiệu chỉnh hệ số truyền dẫn (beta)

Đang dùng **beta 0,5** (mặc định 0,5). chưa đủ mẫu (9/20) — dùng beta mặc định 0,5.

| beta | Sai số TB nếu dùng |
|---|---|
| 0,3 | 321 đ |
| 0,4 | 238 đ |
| 0,5 | 209 đ |
| 0,6 | 298 đ |
| 0,7 | 412 đ |
| 0,8 | 552 đ |

### Năm lỗi lớn nhất và lý do

- **29/09/2026** (mốc 28/09/2026), sai 598 đ:
  - Đoán cú đi không xảy ra: giá đi 0 đ, dự đoán +598 đ.
  - Lớp truyền dẫn London kéo sai chiều (+626 đ), làm sai số tăng 570 đ.
- **17/09/2026** (mốc 16/09/2026), sai 512 đ:
  - Đúng chiều, quá tay: giá đi −300 đ, dự đoán −812 đ.
  - Sàn London đi thêm −1,52% sau lượt dự đoán — phần này lượt dự đoán chưa thể biết.
  - Giá trong nước chép 0,11 lần cú đi −3,00% của sàn (hệ số truyền dẫn đang dùng 0,5).
- **25/09/2026** (mốc 24/09/2026), sai 300 đ:
  - Bỏ lỡ cú đi: giá đi −300 đ, dự đoán 0 đ.
  - Sàn London đi thêm −0,91% sau lượt dự đoán — phần này lượt dự đoán chưa thể biết.
  - Giá trong nước chép 0,40 lần cú đi −0,81% của sàn (hệ số truyền dẫn đang dùng 0,5).
- **24/09/2026** (mốc 23/09/2026), sai 274 đ:
  - Đúng chiều, vừa: giá đi +1.000 đ, dự đoán +726 đ.
  - Lớp truyền dẫn London đúng chiều (+811 đ), bớt được 811 đ sai số.
  - Lớp AI điều tiết kéo sai chiều (−85 đ), làm sai số tăng 85 đ.
- **15/09/2026** (mốc 14/09/2026), sai 178 đ:
  - Bỏ lỡ cú đi: giá đi +200 đ, dự đoán +22 đ.
  - Lớp truyền dẫn London đúng chiều (+136 đ), bớt được 136 đ sai số.
  - Lớp AI điều tiết kéo sai chiều (−115 đ), làm sai số tăng 115 đ.

## Các chuỗi khác — ngày-1

| Chuỗi | Số lần | Sai số TB | Đứng yên | Đúng chiều | Dải 90% phủ |
|---|---|---|---|---|---|
| Đắk Lắk | 15 | 166 đ | 413 đ | 67% | 100% |
| Lâm Đồng | 15 | 158 đ | 407 đ | 67% | 100% |
| Gia Lai | 15 | 166 đ | 413 đ | 67% | 100% |
| Đắk Nông | 15 | 158 đ | 407 đ | 67% | 100% |
| Robusta London | 11 | 47 USD | 45 USD | 46% | 91% |
| Arabica New York | 11 | 108 USD | 116 USD | 64% | 91% |

## Cách đọc

- **Đứng yên** là sai số nếu chỉ đoán "ngày mai bằng hôm nay" — mốc đối chứng khó thắng nhất. Mô hình phải thắng cột này mới đáng giữ.
- **Nếu bỏ lớp** là sai số trung bình khi trừ phần đóng góp của lớp đó ra khỏi dự đoán, tính trên đúng đầu vào đã ghi lúc dự đoán. Lớn hơn sai số thật nghĩa là lớp đó đang giúp.
- **Dải 90% phủ** là tỷ lệ ngày giá thật rơi trong dải thấp–cao mô hình vẽ. Mục tiêu ~90%: thấp hơn nhiều là dải đang hẹp hơn sự thật.
- Hiệu chỉnh beta theo luật chốt trước: cần ≥ 20 mẫu có truyền dẫn, beta mới phải giảm sai số ≥ 3% so với beta đang dùng, và chỉ chọn trong lưới 0,3, 0,4, 0,5, 0,6, 0,7, 0,8.
