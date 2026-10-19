# Sổ học kinh nghiệm dự đoán giá cà phê

Cập nhật: 20/10/2026 05:45. Sổ giữ 60 ngày mốc gần nhất; mọi con số đo trên giá THẬT đã về, không con số nào do mô hình ngôn ngữ viết. Sai số tính bằng đ/kg (nội địa) hoặc USD/tấn (thế giới).

Đây là sổ nội bộ để cải thiện mô hình — không phải khuyến nghị mua bán.

## Trung bình 4 tỉnh

Đã ghi 34 mốc dự đoán, 33 mốc đã có giá thật để chấm.

### Sai số theo tầm dự đoán

| Tầm (ngày) | Số lần | Sai số TB | Đứng yên | Dải 90% phủ |
|---|---|---|---|---|
| 1 | 31 | 228 đ | 500 đ | 100% |
| 2 | 31 | 584 đ | 526 đ | 97% |
| 3 | 30 | 672 đ | 763 đ | 93% |
| 4 | 29 | 902 đ | 824 đ | 90% |
| 5 | 28 | 878 đ | 871 đ | 93% |
| 6 | 27 | 937 đ | 944 đ | 96% |
| 7 | 27 | 1.067 đ | 937 đ | 93% |

### Ngày-1: mô hình so với đứng yên

Trên 33 lần đo: sai số TB **246 đ**, đứng yên **476 đ**, đúng chiều 73%, dải 90% phủ 100%.
→ Mô hình **đang thắng** mốc đứng yên (−230 đ).

### Từng lớp giúp hay hại (ngày-1)

| Lớp | Có tiếng nói | Đúng chiều | Nếu bỏ lớp, sai số TB | Kết luận |
|---|---|---|---|---|
| truyền dẫn London | 25 | 84% | 488 đ | giúp (+242 đ) |
| tín hiệu sàn | 0 | — | 246 đ | chưa có tiếng nói |
| xu hướng gần | 0 | — | 246 đ | chưa có tiếng nói |
| AI điều tiết | 19 | 32% | 228 đ | hại (−18 đ) |

### Từng lớp AI riêng (ngày-1)

| Lớp AI | Có tiếng nói | Đúng chiều | Nếu bỏ riêng lớp, sai số TB | Kết luận |
|---|---|---|---|---|
| tâm lý bản tin | 16 | 56% | 238 đ | hại (−8 đ) |
| đề xuất lệch sàn | 5 | 0% | 244 đ | hại (−2 đ) |
| cung–cầu thế giới (GLM) | 19 | 32% | 237 đ | hại (−9 đ) |

### GLM theo đồng thuận kỹ thuật–tin

| Đồng thuận | Số lần | Sai số TB | Nếu bỏ GLM |
|---|---|---|---|
| kỹ thuật và tin cùng chiều | 13 | 340 đ | 322 đ |
| kỹ thuật và tin ngược chiều | 4 | 344 đ | 358 đ |
| không rõ | 2 | 143 đ | 90 đ |

Luật chốt trước: cần ≥ 20 mẫu "ngược chiều" (hiện 4) rồi mới xét hạ trọng số GLM ở nhóm đó.

### Phân loại lỗi ngày-1

- đúng chiều, vừa: 12 lần
- đứng yên, đoán đứng yên: 7 lần
- bỏ lỡ cú đi: 4 lần
- đúng chiều, quá tay: 4 lần
- đoán cú đi không xảy ra: 3 lần
- đúng chiều, non tay: 2 lần
- bỏ lỡ cú đi lớn: 1 lần

Tỷ lệ truyền dẫn thực (giá trong nước chép bao nhiêu phần cú đi của sàn London, trung vị trên 18 ngày sàn đi ≥ +0,50%): **0,50**.

### Hiệu chỉnh hệ số truyền dẫn (beta)

Đang dùng **beta 0,5** (mặc định 0,5). giữ 0,5: tốt nhất trên lưới là 0,5 (MAE 285 so với 285) nhưng chưa vượt ngưỡng cải thiện 3%.

| beta | Sai số TB nếu dùng |
|---|---|
| 0,3 | 374 đ |
| 0,4 | 316 đ |
| 0,5 | 285 đ |
| 0,6 | 354 đ |
| 0,7 | 450 đ |
| 0,8 | 560 đ |

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
- **17/10/2026** (mốc 16/10/2026), sai 535 đ:
  - Đúng chiều, non tay: giá đi +1.000 đ, dự đoán +465 đ.
  - Lớp truyền dẫn London đúng chiều (+531 đ), bớt được 531 đ sai số.
  - Giá trong nước chép 0,94 lần cú đi +1,16% của sàn (hệ số truyền dẫn đang dùng 0,5).
- **07/10/2026** (mốc 06/10/2026), sai 526 đ:
  - Đúng chiều, quá tay: giá đi +300 đ, dự đoán +826 đ.
  - Giá trong nước chép 0,18 lần cú đi +1,76% của sàn (hệ số truyền dẫn đang dùng 0,5).

## Các chuỗi khác — ngày-1

| Chuỗi | Số lần | Sai số TB | Đứng yên | Đúng chiều | Dải 90% phủ |
|---|---|---|---|---|---|
| Đắk Lắk | 33 | 249 đ | 479 đ | 73% | 100% |
| Lâm Đồng | 33 | 238 đ | 479 đ | 73% | 100% |
| Gia Lai | 33 | 249 đ | 479 đ | 73% | 100% |
| Đắk Nông | 33 | 245 đ | 476 đ | 70% | 100% |
| Robusta London | 28 | 41 USD | 41 USD | 43% | 93% |
| Arabica New York | 28 | 97 USD | 101 USD | 61% | 89% |

## Cách đọc

- **Đứng yên** là sai số nếu chỉ đoán "ngày mai bằng hôm nay" — mốc đối chứng khó thắng nhất. Mô hình phải thắng cột này mới đáng giữ.
- **Nếu bỏ lớp** là sai số trung bình khi trừ phần đóng góp của lớp đó ra khỏi dự đoán, tính trên đúng đầu vào đã ghi lúc dự đoán. Lớn hơn sai số thật nghĩa là lớp đó đang giúp.
- **Dải 90% phủ** là tỷ lệ ngày giá thật rơi trong dải thấp–cao mô hình vẽ. Mục tiêu ~90%: thấp hơn nhiều là dải đang hẹp hơn sự thật.
- Hiệu chỉnh beta theo luật chốt trước: cần ≥ 20 mẫu có truyền dẫn, beta mới phải giảm sai số ≥ 3% so với beta đang dùng, và chỉ chọn trong lưới 0,3, 0,4, 0,5, 0,6, 0,7, 0,8.
