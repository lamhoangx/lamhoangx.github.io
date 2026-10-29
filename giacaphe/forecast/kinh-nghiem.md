# Sổ học kinh nghiệm dự đoán giá cà phê

Cập nhật: 30/10/2026 05:45. Sổ giữ 60 ngày mốc gần nhất; mọi con số đo trên giá THẬT đã về, không con số nào do mô hình ngôn ngữ viết. Sai số tính bằng đ/kg (nội địa) hoặc USD/tấn (thế giới).

Đây là sổ nội bộ để cải thiện mô hình — không phải khuyến nghị mua bán.

## Trung bình 4 tỉnh

Đã ghi 42 mốc dự đoán, 41 mốc đã có giá thật để chấm.

### Sai số theo tầm dự đoán

| Tầm (ngày) | Số lần | Sai số TB | Đứng yên | Dải 90% phủ |
|---|---|---|---|---|
| 1 | 35 | 285 đ | 617 đ | 100% |
| 2 | 33 | 693 đ | 673 đ | 94% |
| 3 | 32 | 779 đ | 922 đ | 91% |
| 4 | 32 | 1.062 đ | 1.028 đ | 84% |
| 5 | 32 | 966 đ | 1.025 đ | 94% |
| 6 | 31 | 949 đ | 1.174 đ | 97% |
| 7 | 33 | 1.270 đ | 1.333 đ | 88% |

### Ngày-1: mô hình so với đứng yên

Trên 41 lần đo: sai số TB **282 đ**, đứng yên **546 đ**, đúng chiều 73%, dải 90% phủ 100%.
→ Mô hình **đang thắng** mốc đứng yên (−264 đ).

### Từng lớp giúp hay hại (ngày-1)

| Lớp | Có tiếng nói | Đúng chiều | Nếu bỏ lớp, sai số TB | Kết luận |
|---|---|---|---|---|
| truyền dẫn London | 33 | 88% | 550 đ | giúp (+268 đ) |
| tín hiệu sàn | 0 | — | 282 đ | chưa có tiếng nói |
| xu hướng gần | 0 | — | 282 đ | chưa có tiếng nói |
| AI điều tiết | 23 | 39% | 266 đ | hại (−16 đ) |

### Từng lớp AI riêng (ngày-1)

| Lớp AI | Có tiếng nói | Đúng chiều | Nếu bỏ riêng lớp, sai số TB | Kết luận |
|---|---|---|---|---|
| tâm lý bản tin | 20 | 60% | 274 đ | hại (−8 đ) |
| đề xuất lệch sàn | 5 | 0% | 281 đ | hại (−1 đ) |
| cung–cầu thế giới (GLM) | 25 | 40% | 276 đ | hại (−6 đ) |

### GLM theo đồng thuận kỹ thuật–tin

| Đồng thuận | Số lần | Sai số TB | Nếu bỏ GLM |
|---|---|---|---|
| kỹ thuật và tin cùng chiều | 18 | 406 đ | 393 đ |
| kỹ thuật và tin ngược chiều | 5 | 306 đ | 324 đ |
| không rõ | 2 | 143 đ | 90 đ |

Luật chốt trước: cần ≥ 20 mẫu "ngược chiều" (hiện 5) rồi mới xét hạ trọng số GLM ở nhóm đó.

### Phân loại lỗi ngày-1

- đúng chiều, vừa: 16 lần
- đúng chiều, quá tay: 6 lần
- đứng yên, đoán đứng yên: 6 lần
- đoán cú đi không xảy ra: 5 lần
- bỏ lỡ cú đi: 4 lần
- đúng chiều, non tay: 3 lần
- bỏ lỡ cú đi lớn: 1 lần

Tỷ lệ truyền dẫn thực (giá trong nước chép bao nhiêu phần cú đi của sàn London, trung vị trên 26 ngày sàn đi ≥ +0,50%): **0,50**.

### Hiệu chỉnh hệ số truyền dẫn (beta)

Đang dùng **beta 0,5** (mặc định 0,5). giữ 0,5: tốt nhất trên lưới là 0,5 (MAE 314 so với 314) nhưng chưa vượt ngưỡng cải thiện 3%.

| beta | Sai số TB nếu dùng |
|---|---|
| 0,3 | 379 đ |
| 0,4 | 330 đ |
| 0,5 | 314 đ |
| 0,6 | 374 đ |
| 0,7 | 458 đ |
| 0,8 | 557 đ |

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
| Đắk Lắk | 41 | 278 đ | 546 đ | 73% | 100% |
| Lâm Đồng | 41 | 263 đ | 544 đ | 73% | 100% |
| Gia Lai | 41 | 280 đ | 549 đ | 73% | 100% |
| Đắk Nông | 41 | 286 đ | 551 đ | 71% | 100% |
| Robusta London | 36 | 42 USD | 44 USD | 50% | 94% |
| Arabica New York | 36 | 106 USD | 109 USD | 58% | 92% |

## Cách đọc

- **Đứng yên** là sai số nếu chỉ đoán "ngày mai bằng hôm nay" — mốc đối chứng khó thắng nhất. Mô hình phải thắng cột này mới đáng giữ.
- **Nếu bỏ lớp** là sai số trung bình khi trừ phần đóng góp của lớp đó ra khỏi dự đoán, tính trên đúng đầu vào đã ghi lúc dự đoán. Lớn hơn sai số thật nghĩa là lớp đó đang giúp.
- **Dải 90% phủ** là tỷ lệ ngày giá thật rơi trong dải thấp–cao mô hình vẽ. Mục tiêu ~90%: thấp hơn nhiều là dải đang hẹp hơn sự thật.
- Hiệu chỉnh beta theo luật chốt trước: cần ≥ 20 mẫu có truyền dẫn, beta mới phải giảm sai số ≥ 3% so với beta đang dùng, và chỉ chọn trong lưới 0,3, 0,4, 0,5, 0,6, 0,7, 0,8.
