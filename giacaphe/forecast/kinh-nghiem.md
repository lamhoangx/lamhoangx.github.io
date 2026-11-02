# Sổ học kinh nghiệm dự đoán giá cà phê

Cập nhật: 03/11/2026 05:45. Sổ giữ 60 ngày mốc gần nhất; mọi con số đo trên giá THẬT đã về, không con số nào do mô hình ngôn ngữ viết. Sai số tính bằng đ/kg (nội địa) hoặc USD/tấn (thế giới).

Đây là sổ nội bộ để cải thiện mô hình — không phải khuyến nghị mua bán.

## Trung bình 4 tỉnh

Đã ghi 45 mốc dự đoán, 44 mốc đã có giá thật để chấm.

### Sai số theo tầm dự đoán

| Tầm (ngày) | Số lần | Sai số TB | Đứng yên | Dải 90% phủ |
|---|---|---|---|---|
| 1 | 37 | 315 đ | 624 đ | 100% |
| 2 | 36 | 711 đ | 739 đ | 94% |
| 3 | 35 | 849 đ | 997 đ | 91% |
| 4 | 34 | 1.117 đ | 1.106 đ | 85% |
| 5 | 33 | 1.006 đ | 1.097 đ | 94% |
| 6 | 33 | 1.022 đ | 1.264 đ | 97% |
| 7 | 35 | 1.296 đ | 1.431 đ | 89% |

### Ngày-1: mô hình so với đứng yên

Trên 44 lần đo: sai số TB **319 đ**, đứng yên **570 đ**, đúng chiều 73%, dải 90% phủ 100%.
→ Mô hình **đang thắng** mốc đứng yên (−251 đ).

### Từng lớp giúp hay hại (ngày-1)

| Lớp | Có tiếng nói | Đúng chiều | Nếu bỏ lớp, sai số TB | Kết luận |
|---|---|---|---|---|
| truyền dẫn London | 35 | 86% | 563 đ | giúp (+244 đ) |
| tín hiệu sàn | 0 | — | 319 đ | chưa có tiếng nói |
| xu hướng gần | 0 | — | 319 đ | chưa có tiếng nói |
| AI điều tiết | 25 | 44% | 310 đ | hại (−9 đ) |

### Từng lớp AI riêng (ngày-1)

| Lớp AI | Có tiếng nói | Đúng chiều | Nếu bỏ riêng lớp, sai số TB | Kết luận |
|---|---|---|---|---|
| tâm lý bản tin | 21 | 62% | 313 đ | hại (−6 đ) |
| đề xuất lệch sàn | 5 | 0% | 319 đ | không đổi |
| cung–cầu thế giới (GLM) | 27 | 44% | 317 đ | hại (−2 đ) |

### GLM theo đồng thuận kỹ thuật–tin

| Đồng thuận | Số lần | Sai số TB | Nếu bỏ GLM |
|---|---|---|---|
| kỹ thuật và tin cùng chiều | 20 | 456 đ | 453 đ |
| kỹ thuật và tin ngược chiều | 5 | 306 đ | 324 đ |
| không rõ | 2 | 143 đ | 90 đ |

Luật chốt trước: cần ≥ 20 mẫu "ngược chiều" (hiện 5) rồi mới xét hạ trọng số GLM ở nhóm đó.

### Phân loại lỗi ngày-1

- đúng chiều, vừa: 16 lần
- đúng chiều, quá tay: 6 lần
- đứng yên, đoán đứng yên: 6 lần
- đoán cú đi không xảy ra: 5 lần
- đúng chiều, non tay: 5 lần
- bỏ lỡ cú đi: 4 lần
- bỏ lỡ cú đi lớn: 1 lần
- ngược chiều: 1 lần

Tỷ lệ truyền dẫn thực (giá trong nước chép bao nhiêu phần cú đi của sàn London, trung vị trên 28 ngày sàn đi ≥ +0,50%): **0,50**.

### Hiệu chỉnh hệ số truyền dẫn (beta)

Đang dùng **beta 0,5** (mặc định 0,5). giữ 0,5: tốt nhất trên lưới là 0,5 (MAE 347 so với 347) nhưng chưa vượt ngưỡng cải thiện 3%.

| beta | Sai số TB nếu dùng |
|---|---|
| 0,3 | 405 đ |
| 0,4 | 361 đ |
| 0,5 | 347 đ |
| 0,6 | 405 đ |
| 0,7 | 485 đ |
| 0,8 | 580 đ |

### Năm lỗi lớn nhất và lý do

- **21/10/2026** (mốc 20/10/2026), sai 1.003 đ:
  - Đúng chiều, non tay: giá đi −2.000 đ, dự đoán −997 đ.
  - Lớp truyền dẫn London đúng chiều (−997 đ), bớt được 997 đ sai số.
  - Giá trong nước chép 1,00 lần cú đi −2,12% của sàn (hệ số truyền dẫn đang dùng 0,5).
- **31/10/2026** (mốc 30/10/2026), sai 999 đ:
  - Ngược chiều: giá đi −500 đ, dự đoán +499 đ.
  - Lớp truyền dẫn London kéo sai chiều (+578 đ), làm sai số tăng 578 đ.
  - Giá trong nước chép -0,43 lần cú đi +1,32% của sàn (hệ số truyền dẫn đang dùng 0,5).
- **02/10/2026** (mốc 01/10/2026), sai 841 đ:
  - Bỏ lỡ cú đi lớn: giá đi −800 đ, dự đoán +41 đ.
- **02/11/2026** (mốc 31/10/2026), sai 814 đ:
  - Đúng chiều, non tay: giá đi −1.200 đ, dự đoán −386 đ.
  - Lớp AI điều tiết đúng chiều (−119 đ), bớt được 119 đ sai số.
  - Mốc và ngày chấm cách nhau 2 ngày (nguồn nghỉ).
- **06/10/2026** (mốc 05/10/2026), sai 799 đ:
  - Đoán cú đi không xảy ra: giá đi 0 đ, dự đoán +799 đ.
  - Lớp truyền dẫn London kéo sai chiều (+799 đ), làm sai số tăng 799 đ.

## Các chuỗi khác — ngày-1

| Chuỗi | Số lần | Sai số TB | Đứng yên | Đúng chiều | Dải 90% phủ |
|---|---|---|---|---|---|
| Đắk Lắk | 44 | 309 đ | 564 đ | 73% | 100% |
| Lâm Đồng | 44 | 304 đ | 570 đ | 73% | 100% |
| Gia Lai | 44 | 315 đ | 570 đ | 73% | 100% |
| Đắk Nông | 44 | 330 đ | 582 đ | 70% | 100% |
| Robusta London | 39 | 41 USD | 42 USD | 49% | 95% |
| Arabica New York | 39 | 102 USD | 102 USD | 56% | 92% |

## Cách đọc

- **Đứng yên** là sai số nếu chỉ đoán "ngày mai bằng hôm nay" — mốc đối chứng khó thắng nhất. Mô hình phải thắng cột này mới đáng giữ.
- **Nếu bỏ lớp** là sai số trung bình khi trừ phần đóng góp của lớp đó ra khỏi dự đoán, tính trên đúng đầu vào đã ghi lúc dự đoán. Lớn hơn sai số thật nghĩa là lớp đó đang giúp.
- **Dải 90% phủ** là tỷ lệ ngày giá thật rơi trong dải thấp–cao mô hình vẽ. Mục tiêu ~90%: thấp hơn nhiều là dải đang hẹp hơn sự thật.
- Hiệu chỉnh beta theo luật chốt trước: cần ≥ 20 mẫu có truyền dẫn, beta mới phải giảm sai số ≥ 3% so với beta đang dùng, và chỉ chọn trong lưới 0,3, 0,4, 0,5, 0,6, 0,7, 0,8.
