# Sổ học kinh nghiệm dự đoán giá cà phê

Cập nhật: 15/10/2026 19:30. Sổ giữ 60 ngày mốc gần nhất; mọi con số đo trên giá THẬT đã về, không con số nào do mô hình ngôn ngữ viết. Sai số tính bằng đ/kg (nội địa) hoặc USD/tấn (thế giới).

Đây là sổ nội bộ để cải thiện mô hình — không phải khuyến nghị mua bán.

## Trung bình 4 tỉnh

Đã ghi 31 mốc dự đoán, 30 mốc đã có giá thật để chấm.

### Sai số theo tầm dự đoán

| Tầm (ngày) | Số lần | Sai số TB | Đứng yên | Dải 90% phủ |
|---|---|---|---|---|
| 1 | 29 | 224 đ | 448 đ | 100% |
| 2 | 28 | 553 đ | 518 đ | 96% |
| 3 | 27 | 670 đ | 752 đ | 93% |
| 4 | 26 | 897 đ | 854 đ | 88% |
| 5 | 26 | 928 đ | 931 đ | 92% |
| 6 | 25 | 994 đ | 972 đ | 96% |
| 7 | 24 | 1.142 đ | 1.046 đ | 92% |

### Ngày-1: mô hình so với đứng yên

Trên 30 lần đo: sai số TB **241 đ**, đứng yên **433 đ**, đúng chiều 73%, dải 90% phủ 100%.
→ Mô hình **đang thắng** mốc đứng yên (−192 đ).

### Từng lớp giúp hay hại (ngày-1)

| Lớp | Có tiếng nói | Đúng chiều | Nếu bỏ lớp, sai số TB | Kết luận |
|---|---|---|---|---|
| truyền dẫn London | 23 | 83% | 442 đ | giúp (+201 đ) |
| tín hiệu sàn | 0 | — | 241 đ | chưa có tiếng nói |
| xu hướng gần | 0 | — | 241 đ | chưa có tiếng nói |
| AI điều tiết | 17 | 35% | 224 đ | hại (−17 đ) |

### Từng lớp AI riêng (ngày-1)

| Lớp AI | Có tiếng nói | Đúng chiều | Nếu bỏ riêng lớp, sai số TB | Kết luận |
|---|---|---|---|---|
| tâm lý bản tin | 15 | 60% | 233 đ | hại (−8 đ) |
| đề xuất lệch sàn | 5 | 0% | 240 đ | hại (−1 đ) |
| cung–cầu thế giới (GLM) | 17 | 35% | 234 đ | hại (−7 đ) |

### GLM theo đồng thuận kỹ thuật–tin

| Đồng thuận | Số lần | Sai số TB | Nếu bỏ GLM |
|---|---|---|---|
| kỹ thuật và tin cùng chiều | 11 | 327 đ | 312 đ |
| kỹ thuật và tin ngược chiều | 4 | 344 đ | 358 đ |
| không rõ | 2 | 143 đ | 90 đ |

Luật chốt trước: cần ≥ 20 mẫu "ngược chiều" (hiện 4) rồi mới xét hạ trọng số GLM ở nhóm đó.

### Phân loại lỗi ngày-1

- đúng chiều, vừa: 11 lần
- đứng yên, đoán đứng yên: 7 lần
- đúng chiều, quá tay: 4 lần
- bỏ lỡ cú đi: 3 lần
- đoán cú đi không xảy ra: 3 lần
- đúng chiều, non tay: 1 lần
- bỏ lỡ cú đi lớn: 1 lần

Tỷ lệ truyền dẫn thực (giá trong nước chép bao nhiêu phần cú đi của sàn London, trung vị trên 16 ngày sàn đi ≥ +0,50%): **0,44**.

### Hiệu chỉnh hệ số truyền dẫn (beta)

Đang dùng **beta 0,5** (mặc định 0,5). giữ 0,5: tốt nhất trên lưới là 0,5 (MAE 284 so với 284) nhưng chưa vượt ngưỡng cải thiện 3%.

| beta | Sai số TB nếu dùng |
|---|---|
| 0,3 | 342 đ |
| 0,4 | 298 đ |
| 0,5 | 284 đ |
| 0,6 | 356 đ |
| 0,7 | 452 đ |
| 0,8 | 564 đ |

### Năm lỗi lớn nhất và lý do

- **02/10/2026** (mốc 01/10/2026), sai 841 đ:
  - Bỏ lỡ cú đi lớn: giá đi −800 đ, dự đoán +41 đ.
- **06/10/2026** (mốc 05/10/2026), sai 799 đ:
  - Đoán cú đi không xảy ra: giá đi 0 đ, dự đoán +799 đ.
  - Lớp truyền dẫn London kéo sai chiều (+799 đ), làm sai số tăng 799 đ.
- **12/10/2026** (mốc 10/10/2026), sai 743 đ:
  - Đoán cú đi không xảy ra: giá đi 0 đ, dự đoán −743 đ.
  - Lớp truyền dẫn London kéo sai chiều (−603 đ), làm sai số tăng 603 đ.
  - Sàn London đi thêm +1,30% sau lượt dự đoán — phần này lượt dự đoán chưa thể biết.
- **07/10/2026** (mốc 06/10/2026), sai 526 đ:
  - Đúng chiều, quá tay: giá đi +300 đ, dự đoán +826 đ.
  - Giá trong nước chép 0,18 lần cú đi +1,76% của sàn (hệ số truyền dẫn đang dùng 0,5).
- **01/10/2026** (mốc 30/09/2026), sai 519 đ:
  - Đúng chiều, non tay: giá đi +1.000 đ, dự đoán +481 đ.
  - Lớp truyền dẫn London đúng chiều (+481 đ), bớt được 481 đ sai số.
  - Giá trong nước chép 0,96 lần cú đi +1,11% của sàn (hệ số truyền dẫn đang dùng 0,5).

## Các chuỗi khác — ngày-1

| Chuỗi | Số lần | Sai số TB | Đứng yên | Đúng chiều | Dải 90% phủ |
|---|---|---|---|---|---|
| Đắk Lắk | 30 | 245 đ | 437 đ | 73% | 100% |
| Lâm Đồng | 30 | 232 đ | 437 đ | 73% | 100% |
| Gia Lai | 30 | 245 đ | 437 đ | 73% | 100% |
| Đắk Nông | 30 | 240 đ | 433 đ | 70% | 100% |
| Robusta London | 25 | 40 USD | 40 USD | 44% | 92% |
| Arabica New York | 25 | 94 USD | 101 USD | 64% | 92% |

## Cách đọc

- **Đứng yên** là sai số nếu chỉ đoán "ngày mai bằng hôm nay" — mốc đối chứng khó thắng nhất. Mô hình phải thắng cột này mới đáng giữ.
- **Nếu bỏ lớp** là sai số trung bình khi trừ phần đóng góp của lớp đó ra khỏi dự đoán, tính trên đúng đầu vào đã ghi lúc dự đoán. Lớn hơn sai số thật nghĩa là lớp đó đang giúp.
- **Dải 90% phủ** là tỷ lệ ngày giá thật rơi trong dải thấp–cao mô hình vẽ. Mục tiêu ~90%: thấp hơn nhiều là dải đang hẹp hơn sự thật.
- Hiệu chỉnh beta theo luật chốt trước: cần ≥ 20 mẫu có truyền dẫn, beta mới phải giảm sai số ≥ 3% so với beta đang dùng, và chỉ chọn trong lưới 0,3, 0,4, 0,5, 0,6, 0,7, 0,8.
