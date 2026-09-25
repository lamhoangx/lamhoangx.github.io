# Sổ học kinh nghiệm dự đoán giá cà phê

Cập nhật: 25/09/2026 07:49. Sổ giữ 60 ngày mốc gần nhất; mọi con số đo trên giá THẬT đã về, không con số nào do mô hình ngôn ngữ viết. Sai số tính bằng đ/kg (nội địa) hoặc USD/tấn (thế giới).

Đây là sổ nội bộ để cải thiện mô hình — không phải khuyến nghị mua bán.

## Trung bình 4 tỉnh

Đã ghi 12 mốc dự đoán, 11 mốc đã có giá thật để chấm.

### Sai số theo tầm dự đoán

| Tầm (ngày) | Số lần | Sai số TB | Đứng yên | Dải 90% phủ |
|---|---|---|---|---|
| 1 | 11 | 132 đ | 427 đ | 100% |
| 2 | 10 | 506 đ | 680 đ | 100% |
| 3 | 9 | 701 đ | 833 đ | 100% |
| 4 | 8 | 670 đ | 1.112 đ | 100% |
| 5 | 7 | 665 đ | 1.271 đ | 100% |
| 6 | 6 | 693 đ | 1.483 đ | 100% |
| 7 | 5 | 938 đ | 1.780 đ | 100% |

### Ngày-1: mô hình so với đứng yên

Trên 11 lần đo: sai số TB **132 đ**, đứng yên **427 đ**, đúng chiều 82%, dải 90% phủ 100%.
→ Mô hình **đang thắng** mốc đứng yên (−295 đ).

### Từng lớp giúp hay hại (ngày-1)

| Lớp | Có tiếng nói | Đúng chiều | Nếu bỏ lớp, sai số TB | Kết luận |
|---|---|---|---|---|
| truyền dẫn London | 8 | 88% | 436 đ | giúp (+304 đ) |
| tín hiệu sàn | 0 | — | 132 đ | chưa có tiếng nói |
| xu hướng gần | 0 | — | 132 đ | chưa có tiếng nói |
| AI điều tiết | 8 | 38% | 84 đ | hại (−48 đ) |

### Từng lớp AI riêng (ngày-1)

| Lớp AI | Có tiếng nói | Đúng chiều | Nếu bỏ riêng lớp, sai số TB | Kết luận |
|---|---|---|---|---|
| tâm lý bản tin | 9 | 44% | 112 đ | hại (−20 đ) |
| đề xuất lệch sàn | 4 | 0% | 131 đ | hại (−1 đ) |
| cung–cầu thế giới (GLM) | 7 | 43% | 105 đ | hại (−27 đ) |

### GLM theo đồng thuận kỹ thuật–tin

| Đồng thuận | Số lần | Sai số TB | Nếu bỏ GLM |
|---|---|---|---|
| kỹ thuật và tin cùng chiều | 6 | 185 đ | 148 đ |
| không rõ | 1 | 178 đ | 102 đ |

Luật chốt trước: cần ≥ 20 mẫu "ngược chiều" (hiện 0) rồi mới xét hạ trọng số GLM ở nhóm đó.

### Phân loại lỗi ngày-1

- đúng chiều, vừa: 5 lần
- đứng yên, đoán đứng yên: 4 lần
- bỏ lỡ cú đi: 1 lần
- đúng chiều, quá tay: 1 lần

Tỷ lệ truyền dẫn thực (giá trong nước chép bao nhiêu phần cú đi của sàn London, trung vị trên 5 ngày sàn đi ≥ +0,50%): **0,11**.

### Hiệu chỉnh hệ số truyền dẫn (beta)

Đang dùng **beta 0,5** (mặc định 0,5). chưa đủ mẫu (7/20) — dùng beta mặc định 0,5.

| beta | Sai số TB nếu dùng |
|---|---|
| 0,3 | 303 đ |
| 0,4 | 209 đ |
| 0,5 | 182 đ |
| 0,6 | 247 đ |
| 0,7 | 345 đ |
| 0,8 | 475 đ |

### Năm lỗi lớn nhất và lý do

- **17/09/2026** (mốc 16/09/2026), sai 512 đ:
  - Đúng chiều, quá tay: giá đi −300 đ, dự đoán −812 đ.
  - Sàn London đi thêm −1,52% sau lượt dự đoán — phần này lượt dự đoán chưa thể biết.
  - Giá trong nước chép 0,11 lần cú đi −3,00% của sàn (hệ số truyền dẫn đang dùng 0,5).
- **24/09/2026** (mốc 23/09/2026), sai 274 đ:
  - Đúng chiều, vừa: giá đi +1.000 đ, dự đoán +726 đ.
  - Lớp truyền dẫn London đúng chiều (+811 đ), bớt được 811 đ sai số.
  - Lớp AI điều tiết kéo sai chiều (−85 đ), làm sai số tăng 85 đ.
- **15/09/2026** (mốc 14/09/2026), sai 178 đ:
  - Bỏ lỡ cú đi: giá đi +200 đ, dự đoán +22 đ.
  - Lớp truyền dẫn London đúng chiều (+136 đ), bớt được 136 đ sai số.
  - Lớp AI điều tiết kéo sai chiều (−115 đ), làm sai số tăng 115 đ.
- **23/09/2026** (mốc 22/09/2026), sai 172 đ:
  - Đúng chiều, vừa: giá đi −1.000 đ, dự đoán −1.172 đ.
  - Lớp truyền dẫn London đúng chiều (−1.082 đ), bớt được 738 đ sai số.
  - Sàn London đi thêm +5,14% sau lượt dự đoán — phần này lượt dự đoán chưa thể biết.
- **20/09/2026** (mốc 19/09/2026), sai 100 đ:
  - Đứng yên, đoán đứng yên: giá đi 0 đ, dự đoán −100 đ.
  - Lớp AI điều tiết kéo sai chiều (−100 đ), làm sai số tăng 100 đ.

## Các chuỗi khác — ngày-1

| Chuỗi | Số lần | Sai số TB | Đứng yên | Đúng chiều | Dải 90% phủ |
|---|---|---|---|---|---|
| Đắk Lắk | 11 | 142 đ | 436 đ | 82% | 100% |
| Lâm Đồng | 11 | 131 đ | 445 đ | 82% | 100% |
| Gia Lai | 11 | 142 đ | 436 đ | 82% | 100% |
| Đắk Nông | 11 | 130 đ | 427 đ | 82% | 100% |
| Robusta London | 8 | 50 USD | 49 USD | 50% | 88% |
| Arabica New York | 8 | 126 USD | 149 USD | 75% | 88% |

## Cách đọc

- **Đứng yên** là sai số nếu chỉ đoán "ngày mai bằng hôm nay" — mốc đối chứng khó thắng nhất. Mô hình phải thắng cột này mới đáng giữ.
- **Nếu bỏ lớp** là sai số trung bình khi trừ phần đóng góp của lớp đó ra khỏi dự đoán, tính trên đúng đầu vào đã ghi lúc dự đoán. Lớn hơn sai số thật nghĩa là lớp đó đang giúp.
- **Dải 90% phủ** là tỷ lệ ngày giá thật rơi trong dải thấp–cao mô hình vẽ. Mục tiêu ~90%: thấp hơn nhiều là dải đang hẹp hơn sự thật.
- Hiệu chỉnh beta theo luật chốt trước: cần ≥ 20 mẫu có truyền dẫn, beta mới phải giảm sai số ≥ 3% so với beta đang dùng, và chỉ chọn trong lưới 0,3, 0,4, 0,5, 0,6, 0,7, 0,8.
