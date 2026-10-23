# Sổ học kinh nghiệm dự đoán giá cà phê

Cập nhật: 24/10/2026 05:45. Sổ giữ 60 ngày mốc gần nhất; mọi con số đo trên giá THẬT đã về, không con số nào do mô hình ngôn ngữ viết. Sai số tính bằng đ/kg (nội địa) hoặc USD/tấn (thế giới).

Đây là sổ nội bộ để cải thiện mô hình — không phải khuyến nghị mua bán.

## Trung bình 4 tỉnh

Đã ghi 38 mốc dự đoán, 37 mốc đã có giá thật để chấm.

### Sai số theo tầm dự đoán

| Tầm (ngày) | Số lần | Sai số TB | Đứng yên | Dải 90% phủ |
|---|---|---|---|---|
| 1 | 32 | 281 đ | 603 đ | 100% |
| 2 | 31 | 683 đ | 639 đ | 94% |
| 3 | 30 | 786 đ | 883 đ | 90% |
| 4 | 29 | 1.024 đ | 900 đ | 86% |
| 5 | 28 | 885 đ | 850 đ | 96% |
| 6 | 28 | 931 đ | 1.021 đ | 96% |
| 7 | 29 | 1.102 đ | 1.028 đ | 93% |

### Ngày-1: mô hình so với đứng yên

Trên 37 lần đo: sai số TB **281 đ**, đứng yên **527 đ**, đúng chiều 70%, dải 90% phủ 100%.
→ Mô hình **đang thắng** mốc đứng yên (−246 đ).

### Từng lớp giúp hay hại (ngày-1)

| Lớp | Có tiếng nói | Đúng chiều | Nếu bỏ lớp, sai số TB | Kết luận |
|---|---|---|---|---|
| truyền dẫn London | 29 | 86% | 541 đ | giúp (+260 đ) |
| tín hiệu sàn | 0 | — | 281 đ | chưa có tiếng nói |
| xu hướng gần | 0 | — | 281 đ | chưa có tiếng nói |
| AI điều tiết | 21 | 38% | 260 đ | hại (−21 đ) |

### Từng lớp AI riêng (ngày-1)

| Lớp AI | Có tiếng nói | Đúng chiều | Nếu bỏ riêng lớp, sai số TB | Kết luận |
|---|---|---|---|---|
| tâm lý bản tin | 19 | 58% | 271 đ | hại (−10 đ) |
| đề xuất lệch sàn | 5 | 0% | 280 đ | hại (−1 đ) |
| cung–cầu thế giới (GLM) | 23 | 39% | 271 đ | hại (−10 đ) |

### GLM theo đồng thuận kỹ thuật–tin

| Đồng thuận | Số lần | Sai số TB | Nếu bỏ GLM |
|---|---|---|---|
| kỹ thuật và tin cùng chiều | 16 | 404 đ | 382 đ |
| kỹ thuật và tin ngược chiều | 5 | 306 đ | 324 đ |
| không rõ | 2 | 143 đ | 90 đ |

Luật chốt trước: cần ≥ 20 mẫu "ngược chiều" (hiện 5) rồi mới xét hạ trọng số GLM ở nhóm đó.

### Phân loại lỗi ngày-1

- đúng chiều, vừa: 13 lần
- đúng chiều, quá tay: 6 lần
- đứng yên, đoán đứng yên: 6 lần
- bỏ lỡ cú đi: 4 lần
- đoán cú đi không xảy ra: 4 lần
- đúng chiều, non tay: 3 lần
- bỏ lỡ cú đi lớn: 1 lần

Tỷ lệ truyền dẫn thực (giá trong nước chép bao nhiêu phần cú đi của sàn London, trung vị trên 22 ngày sàn đi ≥ +0,50%): **0,45**.

### Hiệu chỉnh hệ số truyền dẫn (beta)

Đang dùng **beta 0,5** (mặc định 0,5). giữ 0,5: tốt nhất trên lưới là 0,5 (MAE 318 so với 318) nhưng chưa vượt ngưỡng cải thiện 3%.

| beta | Sai số TB nếu dùng |
|---|---|
| 0,3 | 386 đ |
| 0,4 | 335 đ |
| 0,5 | 318 đ |
| 0,6 | 389 đ |
| 0,7 | 483 đ |
| 0,8 | 588 đ |

### Năm lỗi lớn nhất và lý do

- **21/10/2026** (mốc 20/10/2026), sai 1.003 đ:
  - Đúng chiều, non tay: giá đi −2.000 đ, dự đoán −997 đ.
  - Lớp truyền dẫn London đúng chiều (−997 đ), bớt được 997 đ sai số.
  - Giá trong nước chép 1,00 lần cú đi −2,12% của sàn (hệ số truyền dẫn đang dùng 0,5).
- **02/10/2026** (mốc 01/10/2026), sai 841 đ:
  - Bỏ lỡ cú đi lớn: giá đi −800 đ, dự đoán +41 đ.
- **06/10/2026** (mốc 05/10/2026), sai 799 đ:
  - Đoán cú đi không xảy ra: giá đi 0 đ, dự đoán +799 đ.
  - Lớp truyền dẫn London kéo sai chiều (+799 đ), làm sai số tăng 799 đ.
- **12/10/2026** (mốc 10/10/2026), sai 743 đ:
  - Đoán cú đi không xảy ra: giá đi 0 đ, dự đoán −743 đ.
  - Lớp truyền dẫn London kéo sai chiều (−603 đ), làm sai số tăng 603 đ.
  - Sàn London đi thêm +1,30% sau lượt dự đoán — phần này lượt dự đoán chưa thể biết.
- **17/10/2026** (mốc 16/10/2026), sai 535 đ:
  - Đúng chiều, non tay: giá đi +1.000 đ, dự đoán +465 đ.
  - Lớp truyền dẫn London đúng chiều (+531 đ), bớt được 531 đ sai số.
  - Giá trong nước chép 0,94 lần cú đi +1,16% của sàn (hệ số truyền dẫn đang dùng 0,5).

## Các chuỗi khác — ngày-1

| Chuỗi | Số lần | Sai số TB | Đứng yên | Đúng chiều | Dải 90% phủ |
|---|---|---|---|---|---|
| Đắk Lắk | 37 | 285 đ | 530 đ | 70% | 100% |
| Lâm Đồng | 37 | 272 đ | 532 đ | 70% | 100% |
| Gia Lai | 37 | 285 đ | 530 đ | 70% | 100% |
| Đắk Nông | 37 | 280 đ | 527 đ | 68% | 100% |
| Robusta London | 32 | 43 USD | 44 USD | 47% | 94% |
| Arabica New York | 32 | 100 USD | 105 USD | 59% | 91% |

## Cách đọc

- **Đứng yên** là sai số nếu chỉ đoán "ngày mai bằng hôm nay" — mốc đối chứng khó thắng nhất. Mô hình phải thắng cột này mới đáng giữ.
- **Nếu bỏ lớp** là sai số trung bình khi trừ phần đóng góp của lớp đó ra khỏi dự đoán, tính trên đúng đầu vào đã ghi lúc dự đoán. Lớn hơn sai số thật nghĩa là lớp đó đang giúp.
- **Dải 90% phủ** là tỷ lệ ngày giá thật rơi trong dải thấp–cao mô hình vẽ. Mục tiêu ~90%: thấp hơn nhiều là dải đang hẹp hơn sự thật.
- Hiệu chỉnh beta theo luật chốt trước: cần ≥ 20 mẫu có truyền dẫn, beta mới phải giảm sai số ≥ 3% so với beta đang dùng, và chỉ chọn trong lưới 0,3, 0,4, 0,5, 0,6, 0,7, 0,8.
