# Sổ học kinh nghiệm dự đoán giá cà phê

Cập nhật: 26/09/2026 11:04. Sổ giữ 60 ngày mốc gần nhất; mọi con số đo trên giá THẬT đã về, không con số nào do mô hình ngôn ngữ viết. Sai số tính bằng đ/kg (nội địa) hoặc USD/tấn (thế giới).

Đây là sổ nội bộ để cải thiện mô hình — không phải khuyến nghị mua bán.

## Trung bình 4 tỉnh

Đã ghi 13 mốc dự đoán, 12 mốc đã có giá thật để chấm.

### Sai số theo tầm dự đoán

| Tầm (ngày) | Số lần | Sai số TB | Đứng yên | Dải 90% phủ |
|---|---|---|---|---|
| 1 | 12 | 147 đ | 508 đ | 100% |
| 2 | 11 | 520 đ | 664 đ | 100% |
| 3 | 10 | 737 đ | 960 đ | 100% |
| 4 | 9 | 834 đ | 1.111 đ | 89% |
| 5 | 8 | 762 đ | 1.150 đ | 100% |
| 6 | 7 | 682 đ | 1.314 đ | 100% |
| 7 | 6 | 952 đ | 1.533 đ | 100% |

### Ngày-1: mô hình so với đứng yên

Trên 12 lần đo: sai số TB **147 đ**, đứng yên **508 đ**, đúng chiều 75%, dải 90% phủ 100%.
→ Mô hình **đang thắng** mốc đứng yên (−361 đ).

### Từng lớp giúp hay hại (ngày-1)

| Lớp | Có tiếng nói | Đúng chiều | Nếu bỏ lớp, sai số TB | Kết luận |
|---|---|---|---|---|
| truyền dẫn London | 9 | 89% | 507 đ | giúp (+360 đ) |
| tín hiệu sàn | 0 | — | 147 đ | chưa có tiếng nói |
| xu hướng gần | 0 | — | 147 đ | chưa có tiếng nói |
| AI điều tiết | 9 | 56% | 103 đ | hại (−44 đ) |

### Từng lớp AI riêng (ngày-1)

| Lớp AI | Có tiếng nói | Đúng chiều | Nếu bỏ riêng lớp, sai số TB | Kết luận |
|---|---|---|---|---|
| tâm lý bản tin | 10 | 60% | 129 đ | hại (−18 đ) |
| đề xuất lệch sàn | 4 | 0% | 146 đ | hại (−1 đ) |
| cung–cầu thế giới (GLM) | 7 | 57% | 122 đ | hại (−25 đ) |

### GLM theo đồng thuận kỹ thuật–tin

| Đồng thuận | Số lần | Sai số TB | Nếu bỏ GLM |
|---|---|---|---|
| kỹ thuật và tin cùng chiều | 6 | 235 đ | 198 đ |
| không rõ | 1 | 178 đ | 102 đ |

Luật chốt trước: cần ≥ 20 mẫu "ngược chiều" (hiện 0) rồi mới xét hạ trọng số GLM ở nhóm đó.

### Phân loại lỗi ngày-1

- đúng chiều, vừa: 6 lần
- đứng yên, đoán đứng yên: 3 lần
- bỏ lỡ cú đi: 2 lần
- đúng chiều, quá tay: 1 lần

Tỷ lệ truyền dẫn thực (giá trong nước chép bao nhiêu phần cú đi của sàn London, trung vị trên 7 ngày sàn đi ≥ +0,50%): **0,40**.

### Hiệu chỉnh hệ số truyền dẫn (beta)

Đang dùng **beta 0,5** (mặc định 0,5). chưa đủ mẫu (8/20) — dùng beta mặc định 0,5.

| beta | Sai số TB nếu dùng |
|---|---|
| 0,3 | 318 đ |
| 0,4 | 208 đ |
| 0,5 | 161 đ |
| 0,6 | 245 đ |
| 0,7 | 358 đ |
| 0,8 | 499 đ |

### Năm lỗi lớn nhất và lý do

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
- **23/09/2026** (mốc 22/09/2026), sai 172 đ:
  - Đúng chiều, vừa: giá đi −1.000 đ, dự đoán −1.172 đ.
  - Lớp truyền dẫn London đúng chiều (−1.082 đ), bớt được 738 đ sai số.
  - Sàn London đi thêm +5,14% sau lượt dự đoán — phần này lượt dự đoán chưa thể biết.

## Các chuỗi khác — ngày-1

| Chuỗi | Số lần | Sai số TB | Đứng yên | Đúng chiều | Dải 90% phủ |
|---|---|---|---|---|---|
| Đắk Lắk | 12 | 156 đ | 517 đ | 75% | 100% |
| Lâm Đồng | 12 | 145 đ | 508 đ | 75% | 100% |
| Gia Lai | 12 | 156 đ | 517 đ | 75% | 100% |
| Đắk Nông | 12 | 146 đ | 508 đ | 75% | 100% |
| Robusta London | 10 | 51 USD | 50 USD | 50% | 90% |
| Arabica New York | 10 | 114 USD | 128 USD | 70% | 90% |

## Cách đọc

- **Đứng yên** là sai số nếu chỉ đoán "ngày mai bằng hôm nay" — mốc đối chứng khó thắng nhất. Mô hình phải thắng cột này mới đáng giữ.
- **Nếu bỏ lớp** là sai số trung bình khi trừ phần đóng góp của lớp đó ra khỏi dự đoán, tính trên đúng đầu vào đã ghi lúc dự đoán. Lớn hơn sai số thật nghĩa là lớp đó đang giúp.
- **Dải 90% phủ** là tỷ lệ ngày giá thật rơi trong dải thấp–cao mô hình vẽ. Mục tiêu ~90%: thấp hơn nhiều là dải đang hẹp hơn sự thật.
- Hiệu chỉnh beta theo luật chốt trước: cần ≥ 20 mẫu có truyền dẫn, beta mới phải giảm sai số ≥ 3% so với beta đang dùng, và chỉ chọn trong lưới 0,3, 0,4, 0,5, 0,6, 0,7, 0,8.
