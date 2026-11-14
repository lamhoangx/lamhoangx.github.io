# Sổ học kinh nghiệm dự đoán giá cà phê

Cập nhật: 14/11/2026 19:31. Sổ giữ 60 ngày mốc gần nhất; mọi con số đo trên giá THẬT đã về, không con số nào do mô hình ngôn ngữ viết. Sai số tính bằng đ/kg (nội địa) hoặc USD/tấn (thế giới).

Đây là sổ nội bộ để cải thiện mô hình — không phải khuyến nghị mua bán.

## Trung bình 4 tỉnh

Đã ghi 54 mốc dự đoán, 53 mốc đã có giá thật để chấm.

### Sai số theo tầm dự đoán

| Tầm (ngày) | Số lần | Sai số TB | Đứng yên | Dải 90% phủ |
|---|---|---|---|---|
| 1 | 45 | 328 đ | 609 đ | 98% |
| 2 | 43 | 735 đ | 760 đ | 93% |
| 3 | 42 | 906 đ | 1.036 đ | 93% |
| 4 | 41 | 1.183 đ | 1.168 đ | 85% |
| 5 | 40 | 1.107 đ | 1.220 đ | 90% |
| 6 | 42 | 1.209 đ | 1.438 đ | 93% |
| 7 | 44 | 1.447 đ | 1.607 đ | 86% |

### Ngày-1: mô hình so với đứng yên

Trên 53 lần đo: sai số TB **336 đ**, đứng yên **564 đ**, đúng chiều 74%, dải 90% phủ 98%.
→ Mô hình **đang thắng** mốc đứng yên (−228 đ).

### Từng lớp giúp hay hại (ngày-1)

| Lớp | Có tiếng nói | Đúng chiều | Nếu bỏ lớp, sai số TB | Kết luận |
|---|---|---|---|---|
| truyền dẫn London | 43 | 86% | 556 đ | giúp (+220 đ) |
| dự đoán sàn London | 0 | — | 336 đ | chưa có tiếng nói |
| giá sàn đã chạy | 0 | — | 336 đ | chưa có tiếng nói |
| tín hiệu sàn | 0 | — | 336 đ | chưa có tiếng nói |
| xu hướng gần | 0 | — | 336 đ | chưa có tiếng nói |
| AI điều tiết | 26 | 50% | 332 đ | hại (−4 đ) |

### Từng lớp AI riêng (ngày-1)

| Lớp AI | Có tiếng nói | Đúng chiều | Nếu bỏ riêng lớp, sai số TB | Kết luận |
|---|---|---|---|---|
| tâm lý bản tin | 20 | 65% | 331 đ | hại (−5 đ) |
| đề xuất lệch sàn | 5 | 0% | 335 đ | hại (−1 đ) |

### Lớp đang đo BÓNG (chưa áp vào dự đoán)

**kỳ vọng của giới phân tích** — chỉ ĐO, dự đoán không dùng nhãn này; sổ tính "nếu áp thêm lớp này" bằng đúng hàm của bước ngày-1.
Trên 1 lần có nhãn (1 lần khác "đi ngang"): đúng chiều 100%; sai số TB thật **310 đ**, nếu áp thêm lớp này **272 đ**.
Luật chốt trước: cần ≥ 20 mẫu có nhãn khác "đi ngang" (hiện 1) rồi mới xét. Chưa đủ cơ sở để bàn đưa vào dự đoán.

### Phân loại lỗi ngày-1

- đúng chiều, vừa: 19 lần
- đứng yên, đoán đứng yên: 7 lần
- đúng chiều, quá tay: 6 lần
- đoán cú đi không xảy ra: 6 lần
- bỏ lỡ cú đi: 6 lần
- đúng chiều, non tay: 6 lần
- ngược chiều: 2 lần
- bỏ lỡ cú đi lớn: 1 lần

Tỷ lệ truyền dẫn thực (giá trong nước chép bao nhiêu phần cú đi của sàn London, trung vị trên 34 ngày sàn đi ≥ +0,50%): **0,45**.

### Hiệu chỉnh hệ số truyền dẫn (beta)

Đang dùng **beta 0,5** (mặc định 0,5). giữ 0,5: tốt nhất trên lưới là 0,5 (MAE 361 so với 361) nhưng chưa vượt ngưỡng cải thiện 3%.

| beta | Sai số TB nếu dùng |
|---|---|
| 0,3 | 415 đ |
| 0,4 | 375 đ |
| 0,5 | 361 đ |
| 0,6 | 413 đ |
| 0,7 | 486 đ |
| 0,8 | 572 đ |

### Năm lỗi lớn nhất và lý do

- **03/11/2026** (mốc 02/11/2026), sai 1.654 đ:
  - Ngược chiều: giá đi −1.200 đ, dự đoán +454 đ.
  - Lớp truyền dẫn London kéo sai chiều (+492 đ), làm sai số tăng 492 đ.
  - Giá trong nước chép -1,22 lần cú đi +1,15% của sàn (hệ số truyền dẫn đang dùng 0,5).
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

## Các chuỗi khác — ngày-1

| Chuỗi | Số lần | Sai số TB | Đứng yên | Đúng chiều | Dải 90% phủ |
|---|---|---|---|---|---|
| Đắk Lắk | 53 | 330 đ | 558 đ | 74% | 98% |
| Lâm Đồng | 53 | 325 đ | 570 đ | 74% | 98% |
| Gia Lai | 53 | 338 đ | 562 đ | 70% | 98% |
| Đắk Nông | 53 | 345 đ | 575 đ | 72% | 98% |
| Robusta London | 48 | 42 USD | 42 USD | 48% | 96% |
| Arabica New York | 48 | 114 USD | 118 USD | 62% | 92% |

## Cách đọc

- **Đứng yên** là sai số nếu chỉ đoán "ngày mai bằng hôm nay" — mốc đối chứng khó thắng nhất. Mô hình phải thắng cột này mới đáng giữ.
- **Nếu bỏ lớp** là sai số trung bình khi trừ phần đóng góp của lớp đó ra khỏi dự đoán, tính trên đúng đầu vào đã ghi lúc dự đoán. Lớn hơn sai số thật nghĩa là lớp đó đang giúp.
- **Dải 90% phủ** là tỷ lệ ngày giá thật rơi trong dải thấp–cao mô hình vẽ. Mục tiêu ~90%: thấp hơn nhiều là dải đang hẹp hơn sự thật.
- Hiệu chỉnh beta theo luật chốt trước: cần ≥ 20 mẫu có truyền dẫn, beta mới phải giảm sai số ≥ 3% so với beta đang dùng, và chỉ chọn trong lưới 0,3, 0,4, 0,5, 0,6, 0,7, 0,8.
