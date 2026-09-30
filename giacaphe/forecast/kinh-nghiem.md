# Sổ học kinh nghiệm dự đoán giá cà phê

Cập nhật: 30/09/2026 10:06. Sổ giữ 60 ngày mốc gần nhất; mọi con số đo trên giá THẬT đã về, không con số nào do mô hình ngôn ngữ viết. Sai số tính bằng đ/kg (nội địa) hoặc USD/tấn (thế giới).

Đây là sổ nội bộ để cải thiện mô hình — không phải khuyến nghị mua bán.

## Trung bình 4 tỉnh

Đã ghi 17 mốc dự đoán, 16 mốc đã có giá thật để chấm.

### Sai số theo tầm dự đoán

| Tầm (ngày) | Số lần | Sai số TB | Đứng yên | Dải 90% phủ |
|---|---|---|---|---|
| 1 | 16 | 139 đ | 394 đ | 100% |
| 2 | 15 | 429 đ | 587 đ | 100% |
| 3 | 14 | 648 đ | 850 đ | 100% |
| 4 | 13 | 832 đ | 1.085 đ | 92% |
| 5 | 12 | 993 đ | 1.175 đ | 92% |
| 6 | 11 | 1.070 đ | 1.182 đ | 91% |
| 7 | 10 | 1.187 đ | 1.220 đ | 90% |

### Ngày-1: mô hình so với đứng yên

Trên 16 lần đo: sai số TB **139 đ**, đứng yên **394 đ**, đúng chiều 69%, dải 90% phủ 100%.
→ Mô hình **đang thắng** mốc đứng yên (−255 đ).

### Từng lớp giúp hay hại (ngày-1)

| Lớp | Có tiếng nói | Đúng chiều | Nếu bỏ lớp, sai số TB | Kết luận |
|---|---|---|---|---|
| truyền dẫn London | 11 | 82% | 397 đ | giúp (+258 đ) |
| tín hiệu sàn | 0 | — | 139 đ | chưa có tiếng nói |
| xu hướng gần | 0 | — | 139 đ | chưa có tiếng nói |
| AI điều tiết | 11 | 46% | 106 đ | hại (−33 đ) |

### Từng lớp AI riêng (ngày-1)

| Lớp AI | Có tiếng nói | Đúng chiều | Nếu bỏ riêng lớp, sai số TB | Kết luận |
|---|---|---|---|---|
| tâm lý bản tin | 11 | 55% | 123 đ | hại (−16 đ) |
| đề xuất lệch sàn | 4 | 0% | 138 đ | hại (−1 đ) |
| cung–cầu thế giới (GLM) | 8 | 50% | 122 đ | hại (−17 đ) |

### GLM theo đồng thuận kỹ thuật–tin

| Đồng thuận | Số lần | Sai số TB | Nếu bỏ GLM |
|---|---|---|---|
| kỹ thuật và tin cùng chiều | 7 | 258 đ | 231 đ |
| không rõ | 1 | 178 đ | 102 đ |

Luật chốt trước: cần ≥ 20 mẫu "ngược chiều" (hiện 0) rồi mới xét hạ trọng số GLM ở nhóm đó.

### Phân loại lỗi ngày-1

- đúng chiều, vừa: 6 lần
- đứng yên, đoán đứng yên: 6 lần
- bỏ lỡ cú đi: 2 lần
- đúng chiều, quá tay: 2 lần

Tỷ lệ truyền dẫn thực (giá trong nước chép bao nhiêu phần cú đi của sàn London, trung vị trên 8 ngày sàn đi ≥ +0,50%): **0,28**.

### Hiệu chỉnh hệ số truyền dẫn (beta)

Đang dùng **beta 0,5** (mặc định 0,5). chưa đủ mẫu (9/20) — dùng beta mặc định 0,5.

| beta | Sai số TB nếu dùng |
|---|---|
| 0,3 | 299 đ |
| 0,4 | 216 đ |
| 0,5 | 187 đ |
| 0,6 | 276 đ |
| 0,7 | 390 đ |
| 0,8 | 529 đ |

### Năm lỗi lớn nhất và lý do

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
- **15/09/2026** (mốc 14/09/2026), sai 178 đ:
  - Bỏ lỡ cú đi: giá đi +200 đ, dự đoán +22 đ.
  - Lớp truyền dẫn London đúng chiều (+136 đ), bớt được 136 đ sai số.
  - Lớp AI điều tiết kéo sai chiều (−115 đ), làm sai số tăng 115 đ.

## Các chuỗi khác — ngày-1

| Chuỗi | Số lần | Sai số TB | Đứng yên | Đúng chiều | Dải 90% phủ |
|---|---|---|---|---|---|
| Đắk Lắk | 16 | 145 đ | 400 đ | 69% | 100% |
| Lâm Đồng | 16 | 137 đ | 394 đ | 69% | 100% |
| Gia Lai | 16 | 145 đ | 400 đ | 69% | 100% |
| Đắk Nông | 16 | 138 đ | 394 đ | 69% | 100% |
| Robusta London | 12 | 47 USD | 45 USD | 42% | 92% |
| Arabica New York | 12 | 117 USD | 125 USD | 67% | 92% |

## Cách đọc

- **Đứng yên** là sai số nếu chỉ đoán "ngày mai bằng hôm nay" — mốc đối chứng khó thắng nhất. Mô hình phải thắng cột này mới đáng giữ.
- **Nếu bỏ lớp** là sai số trung bình khi trừ phần đóng góp của lớp đó ra khỏi dự đoán, tính trên đúng đầu vào đã ghi lúc dự đoán. Lớn hơn sai số thật nghĩa là lớp đó đang giúp.
- **Dải 90% phủ** là tỷ lệ ngày giá thật rơi trong dải thấp–cao mô hình vẽ. Mục tiêu ~90%: thấp hơn nhiều là dải đang hẹp hơn sự thật.
- Hiệu chỉnh beta theo luật chốt trước: cần ≥ 20 mẫu có truyền dẫn, beta mới phải giảm sai số ≥ 3% so với beta đang dùng, và chỉ chọn trong lưới 0,3, 0,4, 0,5, 0,6, 0,7, 0,8.
