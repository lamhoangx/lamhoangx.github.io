# Sổ học kinh nghiệm dự đoán giá cà phê

Cập nhật: 20/10/2026 17:40. Sổ giữ 60 ngày mốc gần nhất; mọi con số đo trên giá THẬT đã về, không con số nào do mô hình ngôn ngữ viết. Sai số tính bằng đ/kg (nội địa) hoặc USD/tấn (thế giới).

Đây là sổ nội bộ để cải thiện mô hình — không phải khuyến nghị mua bán.

## Trung bình 4 tỉnh

Đã ghi 35 mốc dự đoán, 34 mốc đã có giá thật để chấm.

### Sai số theo tầm dự đoán

| Tầm (ngày) | Số lần | Sai số TB | Đứng yên | Dải 90% phủ |
|---|---|---|---|---|
| 1 | 32 | 226 đ | 509 đ | 100% |
| 2 | 31 | 584 đ | 526 đ | 97% |
| 3 | 31 | 687 đ | 771 đ | 94% |
| 4 | 30 | 930 đ | 863 đ | 90% |
| 5 | 29 | 920 đ | 859 đ | 93% |
| 6 | 28 | 934 đ | 943 đ | 96% |
| 7 | 28 | 1.070 đ | 929 đ | 93% |

### Ngày-1: mô hình so với đứng yên

Trên 34 lần đo: sai số TB **243 đ**, đứng yên **485 đ**, đúng chiều 74%, dải 90% phủ 100%.
→ Mô hình **đang thắng** mốc đứng yên (−242 đ).

### Từng lớp giúp hay hại (ngày-1)

| Lớp | Có tiếng nói | Đúng chiều | Nếu bỏ lớp, sai số TB | Kết luận |
|---|---|---|---|---|
| truyền dẫn London | 26 | 85% | 497 đ | giúp (+254 đ) |
| tín hiệu sàn | 0 | — | 243 đ | chưa có tiếng nói |
| xu hướng gần | 0 | — | 243 đ | chưa có tiếng nói |
| AI điều tiết | 19 | 32% | 225 đ | hại (−18 đ) |

### Từng lớp AI riêng (ngày-1)

| Lớp AI | Có tiếng nói | Đúng chiều | Nếu bỏ riêng lớp, sai số TB | Kết luận |
|---|---|---|---|---|
| tâm lý bản tin | 17 | 59% | 234 đ | hại (−9 đ) |
| đề xuất lệch sàn | 5 | 0% | 242 đ | hại (−1 đ) |
| cung–cầu thế giới (GLM) | 20 | 30% | 236 đ | hại (−7 đ) |

### GLM theo đồng thuận kỹ thuật–tin

| Đồng thuận | Số lần | Sai số TB | Nếu bỏ GLM |
|---|---|---|---|
| kỹ thuật và tin cùng chiều | 13 | 340 đ | 322 đ |
| kỹ thuật và tin ngược chiều | 5 | 306 đ | 324 đ |
| không rõ | 2 | 143 đ | 90 đ |

Luật chốt trước: cần ≥ 20 mẫu "ngược chiều" (hiện 5) rồi mới xét hạ trọng số GLM ở nhóm đó.

### Phân loại lỗi ngày-1

- đúng chiều, vừa: 13 lần
- đứng yên, đoán đứng yên: 7 lần
- bỏ lỡ cú đi: 4 lần
- đúng chiều, quá tay: 4 lần
- đoán cú đi không xảy ra: 3 lần
- đúng chiều, non tay: 2 lần
- bỏ lỡ cú đi lớn: 1 lần

Tỷ lệ truyền dẫn thực (giá trong nước chép bao nhiêu phần cú đi của sàn London, trung vị trên 19 ngày sàn đi ≥ +0,50%): **0,49**.

### Hiệu chỉnh hệ số truyền dẫn (beta)

Đang dùng **beta 0,5** (mặc định 0,5). giữ 0,5: tốt nhất trên lưới là 0,5 (MAE 279 so với 279) nhưng chưa vượt ngưỡng cải thiện 3%.

| beta | Sai số TB nếu dùng |
|---|---|
| 0,3 | 367 đ |
| 0,4 | 304 đ |
| 0,5 | 279 đ |
| 0,6 | 354 đ |
| 0,7 | 454 đ |
| 0,8 | 567 đ |

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
| Đắk Lắk | 34 | 246 đ | 488 đ | 74% | 100% |
| Lâm Đồng | 34 | 232 đ | 491 đ | 74% | 100% |
| Gia Lai | 34 | 246 đ | 488 đ | 74% | 100% |
| Đắk Nông | 34 | 242 đ | 485 đ | 71% | 100% |
| Robusta London | 29 | 42 USD | 42 USD | 41% | 93% |
| Arabica New York | 29 | 100 USD | 106 USD | 62% | 90% |

## Cách đọc

- **Đứng yên** là sai số nếu chỉ đoán "ngày mai bằng hôm nay" — mốc đối chứng khó thắng nhất. Mô hình phải thắng cột này mới đáng giữ.
- **Nếu bỏ lớp** là sai số trung bình khi trừ phần đóng góp của lớp đó ra khỏi dự đoán, tính trên đúng đầu vào đã ghi lúc dự đoán. Lớn hơn sai số thật nghĩa là lớp đó đang giúp.
- **Dải 90% phủ** là tỷ lệ ngày giá thật rơi trong dải thấp–cao mô hình vẽ. Mục tiêu ~90%: thấp hơn nhiều là dải đang hẹp hơn sự thật.
- Hiệu chỉnh beta theo luật chốt trước: cần ≥ 20 mẫu có truyền dẫn, beta mới phải giảm sai số ≥ 3% so với beta đang dùng, và chỉ chọn trong lưới 0,3, 0,4, 0,5, 0,6, 0,7, 0,8.
